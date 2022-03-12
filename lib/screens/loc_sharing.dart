import 'package:flutter/material.dart';
import 'package:gatego_driver/widgets/locSharing/appbar_card.dart';
import 'package:gatego_driver/widgets/locSharing/focus_on_map_fab.dart';
import 'package:gatego_driver/widgets/locSharing/speed_indicator.dart';
import 'package:gatego_driver/widgets/locSharing/tracking_status_card.dart';
import '../providers/providers.dart';
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
              const AppBarCard(),
              if (!locationState.shouldFly && locationState.isLocating)
                const Positioned(
                  bottom: 90,
                  right: 25,
                  child: FocusOnMapFab(),
                ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: TrackingStatusCard(),
              ),
              if (locationState.latestLocation?.speed != null &&
                  locationState.isLocating)
                const Positioned(
                  bottom: 90,
                  left: 20,
                  child: SpeedIndicator(),
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

      hereMapController.camera.lookAtPointWithDistance(
          GeoCoordinates(52.530932, 13.384915), 55005000);
      hereMapController.setWatermarkPosition(
          WatermarkPlacement.bottomCenter, 13);

      ref.read(locationProvider).mapController = hereMapController;
    });
  }
}
