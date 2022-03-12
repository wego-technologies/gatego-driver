import 'package:flutter/material.dart';
import 'package:gatego_driver/providers/providers.dart';
import 'package:gatego_driver/widgets/common/avatar.dart';
import 'package:gatego_driver/widgets/common/user_modal.dart';
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
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          //backgroundColor: Colors.transparent,
                          constraints: const BoxConstraints(maxHeight: 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          builder: (context) {
                            return const UserModalCard();
                          });
                    },
                    child: Avatar(accountProv?.name),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
