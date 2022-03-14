import 'package:flutter/material.dart';
import 'package:gatego_driver/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TrackingStatusCard extends HookConsumerWidget {
  const TrackingStatusCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationProvider);
    final locationStateNotifier = ref.read(locationProvider.notifier);

    if (locationState.isAwaitingPermissions) {
      locationStateNotifier.checkPremission();
    }

    return Card(
      margin: const EdgeInsets.all(15),
      child: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                locationState.isLocating
                    ? "Tracking is Active"
                    : "Tracking is Stopped",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 20),
              ),
              OutlinedButton.icon(
                onPressed: locationState.isAwaitingPermissions
                    ? null
                    : () async {
                        if (locationState.isLocating) {
                          locationStateNotifier.stopAndDispose();
                        } else {
                          if (locationState.isPermissionGranted) {
                            await locationStateNotifier.beginTracking();
                          } else {
                            locationStateNotifier.launchPermission(context);
                          }
                        }
                      },
                icon: Icon(locationState.isLocating
                    ? Icons.stop_rounded
                    : Icons.play_arrow_rounded),
                label: Text(locationState.isLocating ? "Stop" : "Start"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
