import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import '../providers/providers.dart';
import '../widgets/logo.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/gestures.dart';
import 'package:here_sdk/mapview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocSharingPage extends StatefulHookConsumerWidget {
  const LocSharingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocSharingPageState();
}

class _LocSharingPageState extends ConsumerState<LocSharingPage> {
  @override
  Widget build(BuildContext context) {
    final locationState = ref.watch(locationProvider);
    final locationStateNotifier = ref.watch(locationProvider.notifier);
    final accountProv = ref.watch(accountProvider).account;
    final authProv = ref.watch(authProvider.notifier);

    if (accountProv == null) {
      WidgetsBinding.instance?.addPostFrameCallback((_) => setState(() {}));
    }

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: HereMap(onMapCreated: _onMapCreated),
              ),
              if (!locationState.shouldFly && locationState.isLocating)
                Positioned(
                  bottom: 90,
                  right: 20,
                  child: FloatingActionButton(
                    onPressed: () {
                      locationStateNotifier.shouldFly();
                      setState(() {});
                    },
                    child: const Icon(Icons.my_location_rounded),
                  ),
                ),
              Card(
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
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              child: Text(getInitials(accountProv?.name)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              onPressed: () async {
                                await authProv.logout();
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
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Card(
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
                                        await locationStateNotifier
                                            .beginTracking();
                                      } else {
                                        locationStateNotifier
                                            .launchPermission(context);
                                      }
                                    }
                                  },
                            icon: Icon(locationState.isLocating
                                ? Icons.stop_rounded
                                : Icons.play_arrow_rounded),
                            label: Text(
                                locationState.isLocating ? "Stop" : "Start"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(
        Theme.of(context).brightness == Brightness.light
            ? MapScheme.normalDay
            : MapScheme.normalNight, (MapError? error) {
      if (error != null) {
        return;
      }

      hereMapController.mapScene.setLayerVisibility(
          MapSceneLayers.trafficIncidents, VisibilityState.visible);
      // MapSceneLayers.trafficIncidents renders traffic icons and lines to indicate the location of incidents. Note that these are not directly pickable yet.
      hereMapController.mapScene.setLayerVisibility(
          MapSceneLayers.trafficFlow, VisibilityState.visible);

      /*hereMapController.gestures.disableDefaultAction(GestureType.twoFingerTap);
      hereMapController.gestures.disableDefaultAction(GestureType.doubleTap);
      hereMapController.gestures.disableDefaultAction(GestureType.pan);
      hereMapController.gestures.disableDefaultAction(GestureType.pinchRotate);
      hereMapController.gestures.disableDefaultAction(GestureType.twoFingerPan);
      hereMapController.gestures.disableDefaultAction(GestureType.twoFingerTap);*/

      var shouldFly = ref.read(locationProvider).shouldFly;

      hereMapController.gestures.panListener = PanListener((p0, p1, p2, p3) {
        if (mounted && shouldFly) {
          setState(() {
            ref.read(locationProvider).shouldFly = false;
          });
        }
      });
      hereMapController.gestures.doubleTapListener = DoubleTapListener((p0) {
        if (mounted && shouldFly) {
          ref.read(locationProvider).shouldFly = false;
        }
      });
      hereMapController.gestures.pinchRotateListener =
          PinchRotateListener((p0, p1, p2, p3, p4) {
        if (mounted && shouldFly) {
          ref.read(locationProvider).shouldFly = false;
        }
      });
      hereMapController.gestures.twoFingerPanListener =
          TwoFingerPanListener((p0, p1, p2, p3) {
        if (mounted && shouldFly) {
          ref.read(locationProvider).shouldFly = false;
        }
      });

      const double distanceToEarthInMeters = 8000;
      hereMapController.camera.lookAtPointWithDistance(
          GeoCoordinates(52.530932, 13.384915), distanceToEarthInMeters);
      hereMapController.setWatermarkPosition(
          WatermarkPlacement.bottomCenter, 10);

      ref.read(locationProvider).mapController = hereMapController;
    });
  }
}

String getInitials(String? name) => name?.isNotEmpty ?? false
    ? name!.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
    : 'NN';
