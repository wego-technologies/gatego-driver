import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:guard_app/providers/providers.dart';
import 'package:guard_app/widgets/logo.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/core.errors.dart';
import 'package:here_sdk/mapview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
  MapPolygon? mapCircleOutline;
  MapPolygon? mapCircle;

  @override
  Widget build(BuildContext context) {
    final locationState = ref.watch(locationProvider);
    final locationStateNotifier = ref.watch(locationProvider.notifier);
    final accountProv = ref.watch(accountProvider).account;
    final authProv = ref.watch(authProvider.notifier);

    ref.listen<GeoCoordinates?>(hereGeoCoords, (previous, next) {
      final controller = ref.read(hereController);

      if (controller != null) {
        if (previous == null || next!.distanceTo(previous) > 1) {
          if (previous == null) {
            controller.camera.lookAtPointWithDistance(next!, 1500);
          } else {
            controller.camera.flyToWithOptionsAndDistance(
                next!, 1500, MapCameraFlyToOptions.withDefaults());
          }
          lines.add(next);
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

          if (mapCircle != null) {
            mapScene.removeMapPolygon(mapCircle!);
            mapScene.removeMapPolygon(mapCircleOutline!);
          }
          final mapCircleOutlineNew = _createMapCircle(50, next, context, 0.2);
          final mapCircleNew = _createMapCircle(10, next, context, 1);
          mapScene.addMapPolygon(mapCircleNew);
          mapScene.addMapPolygon(mapCircleOutlineNew);
          mapCircle = mapCircleNew;
          mapCircleOutline = mapCircleOutlineNew;
        }
      }
    });

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
                            Text(
                              accountProv?.name ?? "No Name",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 20),
                            ),
                            IconButton(
                                onPressed: () async {
                                  await authProv.logout();
                                  Beamer.of(context).beamToNamed('/login');
                                },
                                icon: const Icon(Icons.logout))
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

      const double distanceToEarthInMeters = 8000;
      hereMapController.camera.lookAtPointWithDistance(
          GeoCoordinates(52.530932, 13.384915), distanceToEarthInMeters);
      hereMapController.setWatermarkPosition(
          WatermarkPlacement.bottomCenter, 10);
      hereMapController.mapScene.setLayerVisibility(
          MapSceneLayers.trafficFlow, VisibilityState.visible);
      // MapSceneLayers.trafficIncidents renders traffic icons and lines to indicate the location of incidents. Note that these are not directly pickable yet.
      hereMapController.mapScene.setLayerVisibility(
          MapSceneLayers.trafficIncidents, VisibilityState.visible);

      ref.read(hereController.state).state = hereMapController;
    });
  }
}

String getInitials(String? name) => name?.isNotEmpty ?? false
    ? name!.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
    : 'NN';

MapPolygon _createMapCircle(double radius, GeoCoordinates coordinates,
    BuildContext context, double opacity) {
  GeoCircle geoCircle = GeoCircle(coordinates, radius);

  GeoPolygon geoPolygon = GeoPolygon.withGeoCircle(geoCircle);
  Color fillColor = Theme.of(context).primaryColor.withOpacity(opacity);
  MapPolygon mapPolygon = MapPolygon(geoPolygon, fillColor);

  return mapPolygon;
}

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
