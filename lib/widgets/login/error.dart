import 'package:flutter/material.dart';
import 'package:gatego_driver/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorCard extends HookConsumerWidget {
  const ErrorCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useAuth = ref.watch(authProvider);
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Card(
        color: Theme.of(context).errorColor.withAlpha(200),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.warning_rounded,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                useAuth.errorState!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
