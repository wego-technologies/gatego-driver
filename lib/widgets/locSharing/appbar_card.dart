import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:gatego_driver/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/logo.dart';

class AppBarCard extends ConsumerWidget {
  const AppBarCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountProv = ref.watch(accountProvider).account;
    return Card(
      margin: const EdgeInsets.all(15),
      child: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Logo(width: 100),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    child: Text(getInitials(accountProv?.name)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () async {
                      await ref.read(authProvider.notifier).logout();
                      Beamer.of(context).beamToNamed('/login');
                    },
                    icon: const Icon(Icons.logout),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String getInitials(String? name) => name?.isNotEmpty ?? false
    ? name!.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
    : '..';
