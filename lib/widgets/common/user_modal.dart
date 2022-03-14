import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:gatego_driver/providers/providers.dart';
import 'package:gatego_driver/utils/string_to_role.dart';
import 'package:gatego_driver/widgets/common/avatar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserModalCard extends HookConsumerWidget {
  const UserModalCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountProvider);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Avatar(account?.name),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        account?.name ?? "Unknown User",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        beatuifyRole(account?.role),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  )
                ],
              ),
              TextButton.icon(
                onPressed: () async {
                  await ref.read(authProvider.notifier).logout();
                  Beamer.of(context).beamToNamed("/login");
                },
                icon: const Icon(Icons.logout_rounded),
                label: const Text("Sign Out"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
