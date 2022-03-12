import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:background_location/background_location.dart';
import 'package:here_sdk/core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod/riverpod.dart';

import 'providers.dart';

class LocationState {
  bool isLocating;
  bool isPermissionGranted;
  bool isAwaitingPermissions;
  GeoCoordinates? latestCoordinates;

  LocationState(
      {required this.isLocating,
      required this.isPermissionGranted,
      required this.isAwaitingPermissions,
      this.latestCoordinates});

  LocationState copyWith({
    bool? isLocating,
    bool? isPermissionGranted,
    bool? isAwaitingPermissions,
    GeoCoordinates? latestCoordinates,
  }) {
    return LocationState(
      isLocating: isLocating ?? this.isLocating,
      isPermissionGranted: isPermissionGranted ?? this.isPermissionGranted,
      isAwaitingPermissions:
          isAwaitingPermissions ?? this.isAwaitingPermissions,
      latestCoordinates: latestCoordinates ?? this.latestCoordinates,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLocating': isLocating,
      'isPermissionGranted': isPermissionGranted,
      'isAwaitingPermissions': isAwaitingPermissions,
      'latestCoordinates':
          "${latestCoordinates?.latitude}, ${latestCoordinates?.longitude}, ${latestCoordinates?.altitude}",
    };
  }

  factory LocationState.fromMap(Map<String, dynamic> map) {
    return LocationState(
      isLocating: map['isLocating'] ?? false,
      isPermissionGranted: map['isPermissionGranted'] ?? false,
      isAwaitingPermissions: map['isAwaitingPermissions'] ?? false,
      //latestCoordinates: map['latestCoordinates'] != null ? GeoCoordinates.fromMap(map['latestCoordinates']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationState.fromJson(String source) =>
      LocationState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LocationState(isLocating: $isLocating, isPermissionGranted: $isPermissionGranted, isAwaitingPermissions: $isAwaitingPermissions, latestCoordinates: $latestCoordinates)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocationState &&
        other.isLocating == isLocating &&
        other.isPermissionGranted == isPermissionGranted &&
        other.isAwaitingPermissions == isAwaitingPermissions &&
        other.latestCoordinates == latestCoordinates;
  }

  @override
  int get hashCode {
    return isLocating.hashCode ^
        isPermissionGranted.hashCode ^
        isAwaitingPermissions.hashCode ^
        latestCoordinates.hashCode;
  }
}

class LocationProvider extends StateNotifier<LocationState> {
  LocationProvider(this.ref)
      : super(LocationState(
          isLocating: false,
          isPermissionGranted: false,
          isAwaitingPermissions: true,
        ));
  final Ref ref;

  ReceivePort port = ReceivePort();
  StreamController controller = StreamController();

  Future<bool> checkPremission() async {
    try {
      final premissionStatus = await Permission.locationAlways.status;
      if (premissionStatus.isGranted) {
        state = state.copyWith(isPermissionGranted: true);
        return true;
      } else if (state.isPermissionGranted) {
        state = state.copyWith(isPermissionGranted: false);
      }
      return false;
    } catch (e) {
      if (state.isPermissionGranted) {
        state = state.copyWith(isPermissionGranted: false);
      }
      return false;
    }
  }

  void launchPermission() {
    openAppSettings();
  }

  Future<void> beginTracking() async {
    if (state.isLocating) return;
    BackgroundLocation.startLocationService();
    state = state.copyWith(isLocating: true);

    BackgroundLocation.getLocationUpdates((location) {
      ref.read(hereGeoCoords.state).state = location;
    });
  }

  Future<void> stopAndDispose() async {
    BackgroundLocation.stopLocationService();
    state = state.copyWith(isLocating: false);
  }

  static const String isolateName = "LocatorIsolate";
}
