// Copyright (c) 2018-2021 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'dart:ffi';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/location.dart';
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;
import 'package:here_sdk/src/sdk/mapview/map_camera_update.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker3_d_model.dart';
import 'package:here_sdk/src/sdk/mapview/map_view_base.dart';
import 'package:here_sdk/src/sdk/mapview/map_view_lifecycle_listener.dart';
import 'package:meta/meta.dart';

/// Graphical object to represent the location of the user on a MapView.
///
/// It is either as a green dot
/// for pedestrian style or a triangular arrow for vehicle navigation style. The location is made
/// available to an instance of this class by calling the method [LocationIndicator.updateLocationAndCamera].
/// Use the method [MapViewBase.addLifecycleListener] to add this object to the map and
/// [MapViewBase.removeLifecycleListener] to remove it.
/// Note: The LocationIndicator is always rendered at a fixed altitude near 0. Changing the MapCamera
/// to look at geographic coordinates with an altitude that is higher can cause a problem: If the
/// MapCamera angle is tilted and altitude is too high, the LocationIndicator can unexpectedly
/// disappear from the viewport due to the new perspective.
abstract class LocationIndicator implements MapViewLifecycleListener {
  /// Creates an instance of LocationIndicator.
  ///
  factory LocationIndicator() => $prototype.$init();
  /// Creates an instance of LocationIndicator and adds it to provided [MapViewBase] by calling [MapViewBase.addLifecycleListener].
  ///
  factory LocationIndicator.withMapView(MapViewBase mapView) => $prototype.withMapView(mapView);

  /// Enables [LocationIndicator] for provided [MapViewBase].
  ///
  /// If [LocationIndicator] is already enabled (added to map view) for passed map view, this function does nothing.
  /// If [LocationIndicator] is added to different [MapViewBase], this function removes first [LocationIndicator]
  /// from previous map view before adding to new one.
  ///
  /// Note that calling this has the same effect as calling addLifecycleListener(locationIndicator) on the map view.
  ///
  void enable(MapViewBase mapView);
  /// This function removes [LocationIndicator] from map view.
  ///
  /// If [LocationIndicator] was not added to any map view yet, this function does nothing.
  ///
  /// Note that calling this has the same effect as calling removeLifecycleListener(locationIndicator) on the map view.
  ///
  void disable();
  /// Updates the indicator to a new location.
  ///
  /// [location] The updated location of the user.
  ///
  void updateLocation(location_impl.Location location);
  /// Updates the indicator to a new location and applies a camera update at the same time.
  ///
  /// [location] The updated location of the user.
  ///
  /// [cameraUpdate] The update to apply to the camera.
  ///
  void updateLocationAndCamera(location_impl.Location location, MapCameraUpdate cameraUpdate);
  /// Sets the MapMarker3DModel asset to be displayed as location indicator for a specified type.
  ///
  /// The 3D model should be oriented with y axis up and thus standing on the x/z plane where the
  /// z axis is the depth. The direction in which the location indicator is pointing is the
  /// positive z axis.
  ///
  /// [model] The MapMarker3DModel object to be displayed for the specified type.
  ///
  /// [scale] The scaling which will be applied to the marker model. As the size of the
  /// location marker should be aligned on devices with different resolutions the
  /// scale factor is applied relative to the ppi value and thus differs from the
  /// scale which is passed to [MapMarker3D] objects. For the default
  /// marker models a value of 5.0 was used.
  ///
  /// [type] The type of location marker for which the marker 3d model should be replaced.
  ///
  void setMarker3dModel(MapMarker3DModel model, double scale, LocationIndicatorMarkerType type);
  /// Returns the [LocationIndicatorIndicatorStyle] which can be [LocationIndicatorIndicatorStyle.pedestrian] or [LocationIndicatorIndicatorStyle.navigation].
  LocationIndicatorIndicatorStyle get locationIndicatorStyle;
  /// Sets [LocationIndicator.locationIndicatorStyle] to [LocationIndicatorIndicatorStyle.pedestrian] or [LocationIndicatorIndicatorStyle.navigation].
  set locationIndicatorStyle(LocationIndicatorIndicatorStyle value);

  /// Returns true if the indicator is in active state and false for inactive state.
  bool get isActive;
  /// Sets the indicator to active state if true was passed or to inactive state when false
  /// was passed.
  set isActive(bool value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = LocationIndicator$Impl(Pointer<Void>.fromAddress(0));
}

/// The predefined styles for the location indicator which are pedestrian and navigation mode.
enum LocationIndicatorIndicatorStyle {
    /// The location is indicated using a green dot with a small arrow indicating the north-up
    /// direction of the device. If the position is outdated it is shown in grey.
    /// This should be preferred for pedestrian use cases.
    pedestrian,
    /// The location is indicated using a triangular green arrow which indicates the direction
    /// into which the user is moving. This should be preferred for vehicle navigation use cases.
    navigation
}

// LocationIndicatorIndicatorStyle "private" section, not exported.

int sdkMapviewLocationindicatorIndicatorstyleToFfi(LocationIndicatorIndicatorStyle value) {
  switch (value) {
  case LocationIndicatorIndicatorStyle.pedestrian:
    return 0;
  case LocationIndicatorIndicatorStyle.navigation:
    return 1;
  default:
    throw StateError("Invalid enum value $value for LocationIndicatorIndicatorStyle enum.");
  }
}

LocationIndicatorIndicatorStyle sdkMapviewLocationindicatorIndicatorstyleFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LocationIndicatorIndicatorStyle.pedestrian;
  case 1:
    return LocationIndicatorIndicatorStyle.navigation;
  default:
    throw StateError("Invalid numeric value $handle for LocationIndicatorIndicatorStyle enum.");
  }
}

void sdkMapviewLocationindicatorIndicatorstyleReleaseFfiHandle(int handle) {}

final _sdkMapviewLocationindicatorIndicatorstyleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_LocationIndicator_IndicatorStyle_create_handle_nullable'));
final _sdkMapviewLocationindicatorIndicatorstyleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LocationIndicator_IndicatorStyle_release_handle_nullable'));
final _sdkMapviewLocationindicatorIndicatorstyleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LocationIndicator_IndicatorStyle_get_value_nullable'));

Pointer<Void> sdkMapviewLocationindicatorIndicatorstyleToFfiNullable(LocationIndicatorIndicatorStyle? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewLocationindicatorIndicatorstyleToFfi(value);
  final result = _sdkMapviewLocationindicatorIndicatorstyleCreateHandleNullable(_handle);
  sdkMapviewLocationindicatorIndicatorstyleReleaseFfiHandle(_handle);
  return result;
}

LocationIndicatorIndicatorStyle? sdkMapviewLocationindicatorIndicatorstyleFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewLocationindicatorIndicatorstyleGetValueNullable(handle);
  final result = sdkMapviewLocationindicatorIndicatorstyleFromFfi(_handle);
  sdkMapviewLocationindicatorIndicatorstyleReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewLocationindicatorIndicatorstyleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewLocationindicatorIndicatorstyleReleaseHandleNullable(handle);

// End of LocationIndicatorIndicatorStyle "private" section.
/// Enum to identify different types of markers of the location indicator.
enum LocationIndicatorMarkerType {
    /// Pedestrian navigation represented by a green dot by default.
    pedestrian,
    /// Pedestrian navigation in inactive state, represented by a gray dot by default.
    /// It is used when the indicator was set to inactive using [LocationIndicator.isActive]
    /// in pedestrian mode.
    pedestrianInactive,
    /// Vehicle navigation represented by a green triangular arrow by default.
    navigation,
    /// Vehicle navigation in inactive state, represented by a gray triangular arrow by default.
    /// It is used when the indicator was set to inactive using [LocationIndicator.isActive]
    /// in navigation mode.
    navigationInactive
}

// LocationIndicatorMarkerType "private" section, not exported.

int sdkMapviewLocationindicatorMarkertypeToFfi(LocationIndicatorMarkerType value) {
  switch (value) {
  case LocationIndicatorMarkerType.pedestrian:
    return 0;
  case LocationIndicatorMarkerType.pedestrianInactive:
    return 1;
  case LocationIndicatorMarkerType.navigation:
    return 2;
  case LocationIndicatorMarkerType.navigationInactive:
    return 3;
  default:
    throw StateError("Invalid enum value $value for LocationIndicatorMarkerType enum.");
  }
}

LocationIndicatorMarkerType sdkMapviewLocationindicatorMarkertypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LocationIndicatorMarkerType.pedestrian;
  case 1:
    return LocationIndicatorMarkerType.pedestrianInactive;
  case 2:
    return LocationIndicatorMarkerType.navigation;
  case 3:
    return LocationIndicatorMarkerType.navigationInactive;
  default:
    throw StateError("Invalid numeric value $handle for LocationIndicatorMarkerType enum.");
  }
}

void sdkMapviewLocationindicatorMarkertypeReleaseFfiHandle(int handle) {}

final _sdkMapviewLocationindicatorMarkertypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_LocationIndicator_MarkerType_create_handle_nullable'));
final _sdkMapviewLocationindicatorMarkertypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LocationIndicator_MarkerType_release_handle_nullable'));
final _sdkMapviewLocationindicatorMarkertypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LocationIndicator_MarkerType_get_value_nullable'));

Pointer<Void> sdkMapviewLocationindicatorMarkertypeToFfiNullable(LocationIndicatorMarkerType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewLocationindicatorMarkertypeToFfi(value);
  final result = _sdkMapviewLocationindicatorMarkertypeCreateHandleNullable(_handle);
  sdkMapviewLocationindicatorMarkertypeReleaseFfiHandle(_handle);
  return result;
}

LocationIndicatorMarkerType? sdkMapviewLocationindicatorMarkertypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewLocationindicatorMarkertypeGetValueNullable(handle);
  final result = sdkMapviewLocationindicatorMarkertypeFromFfi(_handle);
  sdkMapviewLocationindicatorMarkertypeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewLocationindicatorMarkertypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewLocationindicatorMarkertypeReleaseHandleNullable(handle);

// End of LocationIndicatorMarkerType "private" section.

// LocationIndicator "private" section, not exported.

final _sdkMapviewLocationindicatorRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_LocationIndicator_register_finalizer'));
final _sdkMapviewLocationindicatorCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LocationIndicator_copy_handle'));
final _sdkMapviewLocationindicatorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LocationIndicator_release_handle'));
final _sdkMapviewLocationindicatorGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LocationIndicator_get_type_id'));









/// @nodoc
@visibleForTesting
class LocationIndicator$Impl extends __lib.NativeBase implements LocationIndicator {

  LocationIndicator$Impl(Pointer<Void> handle) : super(handle);


  LocationIndicator $init() {
    final _result_handle = _$init();
    final _result = LocationIndicator$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewLocationindicatorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  LocationIndicator withMapView(MapViewBase mapView) {
    final _result_handle = _withMapView(mapView);
    final _result = LocationIndicator$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewLocationindicatorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_mapview_LocationIndicator_make'));
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  static Pointer<Void> _withMapView(MapViewBase mapView) {
    final _withMapViewFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_LocationIndicator_make__MapViewBase'));
    final _mapViewHandle = sdkMapviewMapviewbaseToFfi(mapView);
    final __resultHandle = _withMapViewFfi(__lib.LibraryContext.isolateId, _mapViewHandle);
    sdkMapviewMapviewbaseReleaseFfiHandle(_mapViewHandle);
    return __resultHandle;
  }

  @override
  void enable(MapViewBase mapView) {
    final _enableFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_LocationIndicator_enable__MapViewBase'));
    final _mapViewHandle = sdkMapviewMapviewbaseToFfi(mapView);
    final _handle = this.handle;
    _enableFfi(_handle, __lib.LibraryContext.isolateId, _mapViewHandle);
    sdkMapviewMapviewbaseReleaseFfiHandle(_mapViewHandle);

  }

  @override
  void disable() {
    final _disableFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_LocationIndicator_disable'));
    final _handle = this.handle;
    _disableFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void updateLocation(location_impl.Location location) {
    final _updateLocationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_LocationIndicator_updateLocation__Location'));
    final _locationHandle = sdkCoreLocationToFfi(location);
    final _handle = this.handle;
    _updateLocationFfi(_handle, __lib.LibraryContext.isolateId, _locationHandle);
    sdkCoreLocationReleaseFfiHandle(_locationHandle);

  }

  @override
  void updateLocationAndCamera(location_impl.Location location, MapCameraUpdate cameraUpdate) {
    final _updateLocationAndCameraFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_LocationIndicator_updateLocation__Location_MapCameraUpdate'));
    final _locationHandle = sdkCoreLocationToFfi(location);
    final _cameraUpdateHandle = sdkMapviewMapcameraupdateToFfi(cameraUpdate);
    final _handle = this.handle;
    _updateLocationAndCameraFfi(_handle, __lib.LibraryContext.isolateId, _locationHandle, _cameraUpdateHandle);
    sdkCoreLocationReleaseFfiHandle(_locationHandle);
    sdkMapviewMapcameraupdateReleaseFfiHandle(_cameraUpdateHandle);

  }

  @override
  void setMarker3dModel(MapMarker3DModel model, double scale, LocationIndicatorMarkerType type) {
    final _setMarker3dModelFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Double, Uint32), void Function(Pointer<Void>, int, Pointer<Void>, double, int)>('here_sdk_sdk_mapview_LocationIndicator_setMarker3dModel__MapMarker3DModel_Double_MarkerType'));
    final _modelHandle = sdkMapviewMapmarker3dmodelToFfi(model);
    final _scaleHandle = (scale);
    final _typeHandle = sdkMapviewLocationindicatorMarkertypeToFfi(type);
    final _handle = this.handle;
    _setMarker3dModelFfi(_handle, __lib.LibraryContext.isolateId, _modelHandle, _scaleHandle, _typeHandle);
    sdkMapviewMapmarker3dmodelReleaseFfiHandle(_modelHandle);

    sdkMapviewLocationindicatorMarkertypeReleaseFfiHandle(_typeHandle);

  }

  @override
  void onAttach(MapViewBase mapView) {
    final _onAttachFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewLifecycleListener_onAttach__MapViewBase'));
    final _mapViewHandle = sdkMapviewMapviewbaseToFfi(mapView);
    final _handle = this.handle;
    _onAttachFfi(_handle, __lib.LibraryContext.isolateId, _mapViewHandle);
    sdkMapviewMapviewbaseReleaseFfiHandle(_mapViewHandle);

  }

  @override
  void onDetach(MapViewBase mapView) {
    final _onDetachFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewLifecycleListener_onDetach__MapViewBase'));
    final _mapViewHandle = sdkMapviewMapviewbaseToFfi(mapView);
    final _handle = this.handle;
    _onDetachFfi(_handle, __lib.LibraryContext.isolateId, _mapViewHandle);
    sdkMapviewMapviewbaseReleaseFfiHandle(_mapViewHandle);

  }

  @override
  void onPause() {
    final _onPauseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewLifecycleListener_onPause'));
    final _handle = this.handle;
    _onPauseFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void onResume() {
    final _onResumeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewLifecycleListener_onResume'));
    final _handle = this.handle;
    _onResumeFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void onDestroy() {
    final _onDestroyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewLifecycleListener_onDestroy'));
    final _handle = this.handle;
    _onDestroyFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  LocationIndicatorIndicatorStyle get locationIndicatorStyle {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_LocationIndicator_locationIndicatorStyle_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewLocationindicatorIndicatorstyleFromFfi(__resultHandle);
    } finally {
      sdkMapviewLocationindicatorIndicatorstyleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set locationIndicatorStyle(LocationIndicatorIndicatorStyle value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_LocationIndicator_locationIndicatorStyle_set__IndicatorStyle'));
    final _valueHandle = sdkMapviewLocationindicatorIndicatorstyleToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkMapviewLocationindicatorIndicatorstyleReleaseFfiHandle(_valueHandle);

  }


  @override
  bool get isActive {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_LocationIndicator_isActive_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isActive(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_LocationIndicator_isActive_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkMapviewLocationindicatorToFfi(LocationIndicator value) =>
  _sdkMapviewLocationindicatorCopyHandle((value as __lib.NativeBase).handle);

LocationIndicator sdkMapviewLocationindicatorFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LocationIndicator) return instance;

  final _typeIdHandle = _sdkMapviewLocationindicatorGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewLocationindicatorCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : LocationIndicator$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewLocationindicatorRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewLocationindicatorReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewLocationindicatorReleaseHandle(handle);

Pointer<Void> sdkMapviewLocationindicatorToFfiNullable(LocationIndicator? value) =>
  value != null ? sdkMapviewLocationindicatorToFfi(value) : Pointer<Void>.fromAddress(0);

LocationIndicator? sdkMapviewLocationindicatorFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewLocationindicatorFromFfi(handle) : null;

void sdkMapviewLocationindicatorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewLocationindicatorReleaseHandle(handle);

// End of LocationIndicator "private" section.

