import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import '../providers/providers.dart';
import '../widgets/logo.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/core.errors.dart';
import 'package:here_sdk/gestures.dart';
import 'package:here_sdk/mapview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:background_location/background_location.dart' as bg_loc;

class LocSharingPage extends StatefulHookConsumerWidget {
  const LocSharingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocSharingPageState();
}

class _LocSharingPageState extends ConsumerState<LocSharingPage> {
  @override
  void initState() {
    if (ref.read(locationProvider).isAwaitingPermissions) {
      ref.read(locationProvider.notifier).checkPremission();
    }
    super.initState();
  }

  List<GeoCoordinates> lines = [];
  GeoPolyline? geoPolyline;
  MapPolyline? mapPolyline;
  LocationIndicator? locIndicator;
  bool shouldfly = true;

  @override
  Widget build(BuildContext context) {
    final locationState = ref.watch(locationProvider);
    final locationStateNotifier = ref.watch(locationProvider.notifier);
    final accountProv = ref.watch(accountProvider).account;
    final authProv = ref.watch(authProvider.notifier);

    locIndicator ??= LocationIndicator();

    ref.listen<bg_loc.Location?>(hereGeoCoords, (previous, next) {
      final controller = ref.read(hereController);

      if (controller != null) {
        final nextCoordinate = GeoCoordinates(next!.latitude!, next.longitude!);

        if (previous == null) {}
        final previousCoordinate = previous == null
            ? null
            : GeoCoordinates(previous.latitude!, previous.longitude!);

        Location loc = Location.withCoordinates(nextCoordinate);
        loc.time = DateTime.now();
        loc.bearingInDegrees = next.bearing;

        locIndicator?.updateLocation(loc);
        controller.addLifecycleListener(locIndicator!);

        if (previousCoordinate == null ||
            nextCoordinate.distanceTo(previousCoordinate) > 1) {
          if (shouldfly) {
            if (previousCoordinate == null) {
              controller.camera.lookAtPointWithDistance(nextCoordinate, 1500);
            } else {
              controller.camera.flyToWithOptionsAndGeoOrientationAndDistance(
                  nextCoordinate,
                  GeoOrientationUpdate(loc.bearingInDegrees, 60),
                  1500,
                  MapCameraFlyToOptions.withDefaults());
            }
          }
          lines.add(nextCoordinate);
          if (lines.length > 1000) {
            lines.removeAt(0);
          }
          final mapScene = controller.mapScene;

          final mapPolylineNew = createPolyline(lines, context);
          if (mapPolylineNew != null) {
            mapScene.addMapPolyline(mapPolylineNew);
          }
          if (mapPolyline != null) {
            mapScene.removeMapPolyline(mapPolyline!);
          }
          mapPolyline = mapPolylineNew;
        }
      }
    });

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
              if (!shouldfly && locationState.isLocating)
                Positioned(
                  bottom: 90,
                  right: 20,
                  child: FloatingActionButton(
                    onPressed: () {
                      shouldfly = true;
                      final locRaw = ref.read(hereGeoCoords);
                      final loc =
                          GeoCoordinates(locRaw!.latitude!, locRaw.longitude!);
                      ref
                          .read(hereController.state)
                          .state!
                          .camera
                          .flyToWithOptionsAndGeoOrientationAndDistance(
                              loc,
                              GeoOrientationUpdate(locRaw.bearing, 60),
                              1500,
                              MapCameraFlyToOptions.withDefaults());
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
                                ? "Tracking is Started"
                                : "Tracking is Stopped",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 20),
                          ),
                          OutlinedButton.icon(
                            onPressed: () async {
                              if (locationState.isLocating) {
                                locationStateNotifier.stopAndDispose();
                              } else {
                                await locationStateNotifier.beginTracking();
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

      hereMapController.gestures.panListener = PanListener((p0, p1, p2, p3) {
        if (mounted && shouldfly) {
          setState(() {
            shouldfly = false;
          });
        }
      });
      hereMapController.gestures.doubleTapListener = DoubleTapListener((p0) {
        if (mounted && shouldfly) {
          setState(() {
            shouldfly = false;
          });
        }
      });
      hereMapController.gestures.pinchRotateListener =
          PinchRotateListener((p0, p1, p2, p3, p4) {
        if (mounted && shouldfly) {
          setState(() {
            shouldfly = false;
          });
        }
      });
      hereMapController.gestures.twoFingerPanListener =
          TwoFingerPanListener((p0, p1, p2, p3) {
        if (mounted && shouldfly) {
          setState(() {
            shouldfly = false;
          });
        }
      });

      const double distanceToEarthInMeters = 8000;
      hereMapController.camera.lookAtPointWithDistance(
          GeoCoordinates(52.530932, 13.384915), distanceToEarthInMeters);
      hereMapController.setWatermarkPosition(
          WatermarkPlacement.bottomCenter, 10);

      ref.read(hereController.state).state = hereMapController;
    });
  }
}

String getInitials(String? name) => name?.isNotEmpty ?? false
    ? name!.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
    : 'NN';

MapPolyline? createPolyline(
  List<GeoCoordinates> coordinates,
  BuildContext context,
) {
  GeoPolyline geoPolyline;
  try {
    geoPolyline = GeoPolyline(coordinates);
  } on InstantiationException {
    // Thrown when less than two vertices.
    return null;
  }

  double widthInPixels = 20;
  Color lineColor = Theme.of(context).primaryColor;
  MapPolyline mapPolyline = MapPolyline(geoPolyline, widthInPixels, lineColor);

  return mapPolyline;
}
