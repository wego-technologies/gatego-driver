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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/metadata.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker3_d_model.dart';
import 'package:meta/meta.dart';

/// MapMarker3D represents a 3D shape rendered on the map at specified geodetic coordinates.
///
/// It can have a solid color or be textured, depending on the data from [MapMarker3DModel].
/// It can be moved around a map by updating its coordinates.
/// Its orientation can be changed by updating its bearing, pitch and roll.
abstract class MapMarker3D {
  /// Creates an instance of a marker.
  ///
  /// [at] The marker's geographical coordinates.
  /// The marker's center will be placed on the location.
  /// The center is the origin of the mesh's local coordinate system as defined in its model.
  ///
  /// [model] The 3D model used to draw marker.
  ///
  factory MapMarker3D(GeoCoordinates at, MapMarker3DModel model) => $prototype.$init(at, model);
  /// Creates an instance of a marker with scale factor.
  ///
  /// [at] The marker's geographical coordinates.
  /// The marker's center will be placed on the location.
  /// The center is the origin of the mesh's local coordinate system as defined in its model.
  ///
  /// [model] The 3D model used to render the marker.
  ///
  /// [scale] Scale factor to change the initial size of an object which is expressed in
  /// screen pixels inside [MapMarker3DModel].
  /// Default scale is 1, for a scale of 2, the model is 2x larger.
  /// For a scale of 0.5, its current size shrinks to half of its original size.
  ///
  factory MapMarker3D.withScale(GeoCoordinates at, MapMarker3DModel model, double scale) => $prototype.withScale(at, model, scale);

  /// Gets the point on the map where the marker is centered.
  GeoCoordinates get coordinates;
  /// Sets the point on the map where the marker is centered.
  set coordinates(GeoCoordinates value);

  /// Gets the Metadata instance attached to this marker.
  /// This will be `null` if nothing has been attached before.
  Metadata? get metadata;
  /// Sets the Metadata instance attached to this marker.
  set metadata(Metadata? value);

  /// Gets the bearing in degrees, from the true North in clockwise direction.
  /// Bearing axis is perpendicular to ground and passes through the marker's location.
  double get bearing;
  /// Sets the bearing in degrees, from the true North in clockwise direction.
  /// Bearing axis is perpendicular to ground and passes through the marker's location.
  set bearing(double value);

  /// Gets the roll of the 3D map marker in degrees.
  double get roll;
  /// Sets the roll of the 3D map marker in degrees.
  set roll(double value);

  /// Gets the pitch of the 3D map marker in degrees.
  double get pitch;
  /// Sets the pitch of the 3D map marker in degrees.
  set pitch(double value);

  /// Gets the scale factor.
  double get scale;
  /// Sets the scale factor.
  set scale(double value);

  /// Returns true if depth check is enabled. If it is enabled the depth of the 3D m marker's
  /// vertices is considered during rendering. If set to false the 3D marker will always
  /// appear in front of any other map objects. If set to true the marker might be occluded by
  /// other map objects like extruded buildings. Use the height property of the [MapMarker3D.coordinates] to
  /// position the marker sufficiently high above the surface. Setting depth check to true will fix
  /// visual glitches where components of the marker 3d model unexpectedly shine through.
  /// By default depth check is set to false.
  bool get isDepthCheckEnabled;
  /// Sets the depth check. This Determines whether the depth of the 3D marker's vertices is
  /// considered during rendering. If set to false the 3D marker will always appear in front of any
  /// other map objects. If set to true the marker might be occluded by other map objects like
  /// extruded buildings. Use the height property of the [MapMarker3D.coordinates] to position the marker
  /// sufficiently high above the surface. Setting depth check to true will fix visual glitches
  /// where components of the marker 3d model unexpectedly shine through.
  /// By default depth check is set to false.
  set isDepthCheckEnabled(bool value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapMarker3D$Impl(Pointer<Void>.fromAddress(0));
}


// MapMarker3D "private" section, not exported.

final _sdkMapviewMapmarker3dRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapMarker3D_register_finalizer'));
final _sdkMapviewMapmarker3dCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3D_copy_handle'));
final _sdkMapviewMapmarker3dReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3D_release_handle'));




/// @nodoc
@visibleForTesting
class MapMarker3D$Impl extends __lib.NativeBase implements MapMarker3D {

  MapMarker3D$Impl(Pointer<Void> handle) : super(handle);


  MapMarker3D $init(GeoCoordinates at, MapMarker3DModel model) {
    final _result_handle = _$init(at, model);
    final _result = MapMarker3D$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapmarker3dRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapMarker3D withScale(GeoCoordinates at, MapMarker3DModel model, double scale) {
    final _result_handle = _withScale(at, model, scale);
    final _result = MapMarker3D$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapmarker3dRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(GeoCoordinates at, MapMarker3DModel model) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3D_make__GeoCoordinates_MapMarker3DModel'));
    final _atHandle = sdkCoreGeocoordinatesToFfi(at);
    final _modelHandle = sdkMapviewMapmarker3dmodelToFfi(model);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _atHandle, _modelHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_atHandle);
    sdkMapviewMapmarker3dmodelReleaseFfiHandle(_modelHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withScale(GeoCoordinates at, MapMarker3DModel model, double scale) {
    final _withScaleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Double), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, double)>('here_sdk_sdk_mapview_MapMarker3D_make__GeoCoordinates_MapMarker3DModel_Double'));
    final _atHandle = sdkCoreGeocoordinatesToFfi(at);
    final _modelHandle = sdkMapviewMapmarker3dmodelToFfi(model);
    final _scaleHandle = (scale);
    final __resultHandle = _withScaleFfi(__lib.LibraryContext.isolateId, _atHandle, _modelHandle, _scaleHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_atHandle);
    sdkMapviewMapmarker3dmodelReleaseFfiHandle(_modelHandle);

    return __resultHandle;
  }

  @override
  GeoCoordinates get coordinates {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_coordinates_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set coordinates(GeoCoordinates value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3D_coordinates_set__GeoCoordinates'));
    final _valueHandle = sdkCoreGeocoordinatesToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_valueHandle);

  }


  @override
  Metadata? get metadata {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_metadata_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreMetadataFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreMetadataReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set metadata(Metadata? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3D_metadata_set__Metadata_'));
    final _valueHandle = sdkCoreMetadataToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreMetadataReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  double get bearing {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_bearing_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set bearing(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapMarker3D_bearing_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  double get roll {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_roll_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set roll(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapMarker3D_roll_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  double get pitch {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_pitch_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set pitch(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapMarker3D_pitch_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  double get scale {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_scale_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set scale(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapMarker3D_scale_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  bool get isDepthCheckEnabled {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_isDepthCheckEnabled_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isDepthCheckEnabled(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapMarker3D_isDepthCheckEnabled_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkMapviewMapmarker3dToFfi(MapMarker3D value) =>
  _sdkMapviewMapmarker3dCopyHandle((value as __lib.NativeBase).handle);

MapMarker3D sdkMapviewMapmarker3dFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapMarker3D) return instance;

  final _copiedHandle = _sdkMapviewMapmarker3dCopyHandle(handle);
  final result = MapMarker3D$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapmarker3dRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapmarker3dReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapmarker3dReleaseHandle(handle);

Pointer<Void> sdkMapviewMapmarker3dToFfiNullable(MapMarker3D? value) =>
  value != null ? sdkMapviewMapmarker3dToFfi(value) : Pointer<Void>.fromAddress(0);

MapMarker3D? sdkMapviewMapmarker3dFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapmarker3dFromFfi(handle) : null;

void sdkMapviewMapmarker3dReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmarker3dReleaseHandle(handle);

// End of MapMarker3D "private" section.

