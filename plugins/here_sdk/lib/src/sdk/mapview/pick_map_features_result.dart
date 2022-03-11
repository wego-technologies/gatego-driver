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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

/// A class that contains possible results from picking a map feature on the map scene.
abstract class PickMapFeaturesResult {

  /// Gets a list of POIs at the location of picking.
  List<PickPoiResult> get pois;

}

/// Carries the result of picking a Carto POI (point of interest) object.

class PickPoiResult {
  /// The name of the POI localized in the currently selected map language.
  String name;

  /// The geographic coordinates of the POI.
  GeoCoordinates coordinates;

  /// The place category ID of the POI.
  /// This is the same String value as `PlaceCategory.id` that can be obtained from the
  /// `SearchEngine` and the `OfflineSearchEngine`. Note that not all editions include the
  /// `OfflineSearchEngine`.
  String placeCategoryId;

  PickPoiResult(this.name, this.coordinates, this.placeCategoryId);
}


// PickPoiResult "private" section, not exported.

final _sdkMapviewPickmapfeaturesresultPoiresultCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapFeaturesResult_PoiResult_create_handle'));
final _sdkMapviewPickmapfeaturesresultPoiresultReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapFeaturesResult_PoiResult_release_handle'));
final _sdkMapviewPickmapfeaturesresultPoiresultGetFieldname = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapFeaturesResult_PoiResult_get_field_name'));
final _sdkMapviewPickmapfeaturesresultPoiresultGetFieldcoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapFeaturesResult_PoiResult_get_field_coordinates'));
final _sdkMapviewPickmapfeaturesresultPoiresultGetFieldplaceCategoryId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapFeaturesResult_PoiResult_get_field_placeCategoryId'));



Pointer<Void> sdkMapviewPickmapfeaturesresultPoiresultToFfi(PickPoiResult value) {
  final _nameHandle = stringToFfi(value.name);
  final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(value.coordinates);
  final _placeCategoryIdHandle = stringToFfi(value.placeCategoryId);
  final _result = _sdkMapviewPickmapfeaturesresultPoiresultCreateHandle(_nameHandle, _coordinatesHandle, _placeCategoryIdHandle);
  stringReleaseFfiHandle(_nameHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
  stringReleaseFfiHandle(_placeCategoryIdHandle);
  return _result;
}

PickPoiResult sdkMapviewPickmapfeaturesresultPoiresultFromFfi(Pointer<Void> handle) {
  final _nameHandle = _sdkMapviewPickmapfeaturesresultPoiresultGetFieldname(handle);
  final _coordinatesHandle = _sdkMapviewPickmapfeaturesresultPoiresultGetFieldcoordinates(handle);
  final _placeCategoryIdHandle = _sdkMapviewPickmapfeaturesresultPoiresultGetFieldplaceCategoryId(handle);
  try {
    return PickPoiResult(
      stringFromFfi(_nameHandle), 
      sdkCoreGeocoordinatesFromFfi(_coordinatesHandle), 
      stringFromFfi(_placeCategoryIdHandle)
    );
  } finally {
    stringReleaseFfiHandle(_nameHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    stringReleaseFfiHandle(_placeCategoryIdHandle);
  }
}

void sdkMapviewPickmapfeaturesresultPoiresultReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewPickmapfeaturesresultPoiresultReleaseHandle(handle);

// Nullable PickPoiResult

final _sdkMapviewPickmapfeaturesresultPoiresultCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapFeaturesResult_PoiResult_create_handle_nullable'));
final _sdkMapviewPickmapfeaturesresultPoiresultReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapFeaturesResult_PoiResult_release_handle_nullable'));
final _sdkMapviewPickmapfeaturesresultPoiresultGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapFeaturesResult_PoiResult_get_value_nullable'));

Pointer<Void> sdkMapviewPickmapfeaturesresultPoiresultToFfiNullable(PickPoiResult? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewPickmapfeaturesresultPoiresultToFfi(value);
  final result = _sdkMapviewPickmapfeaturesresultPoiresultCreateHandleNullable(_handle);
  sdkMapviewPickmapfeaturesresultPoiresultReleaseFfiHandle(_handle);
  return result;
}

PickPoiResult? sdkMapviewPickmapfeaturesresultPoiresultFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewPickmapfeaturesresultPoiresultGetValueNullable(handle);
  final result = sdkMapviewPickmapfeaturesresultPoiresultFromFfi(_handle);
  sdkMapviewPickmapfeaturesresultPoiresultReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewPickmapfeaturesresultPoiresultReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewPickmapfeaturesresultPoiresultReleaseHandleNullable(handle);

// End of PickPoiResult "private" section.

// PickMapFeaturesResult "private" section, not exported.

final _sdkMapviewPickmapfeaturesresultRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_PickMapFeaturesResult_register_finalizer'));
final _sdkMapviewPickmapfeaturesresultCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapFeaturesResult_copy_handle'));
final _sdkMapviewPickmapfeaturesresultReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapFeaturesResult_release_handle'));


class PickMapFeaturesResult$Impl extends __lib.NativeBase implements PickMapFeaturesResult {

  PickMapFeaturesResult$Impl(Pointer<Void> handle) : super(handle);

  @override
  List<PickPoiResult> get pois {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapFeaturesResult_pois_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkMapviewHarpBindingslistofSdkMapviewPickmapfeaturesresultPoiresultFromFfi(__resultHandle);
    } finally {
      heresdkMapviewHarpBindingslistofSdkMapviewPickmapfeaturesresultPoiresultReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkMapviewPickmapfeaturesresultToFfi(PickMapFeaturesResult value) =>
  _sdkMapviewPickmapfeaturesresultCopyHandle((value as __lib.NativeBase).handle);

PickMapFeaturesResult sdkMapviewPickmapfeaturesresultFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PickMapFeaturesResult) return instance;

  final _copiedHandle = _sdkMapviewPickmapfeaturesresultCopyHandle(handle);
  final result = PickMapFeaturesResult$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewPickmapfeaturesresultRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewPickmapfeaturesresultReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewPickmapfeaturesresultReleaseHandle(handle);

Pointer<Void> sdkMapviewPickmapfeaturesresultToFfiNullable(PickMapFeaturesResult? value) =>
  value != null ? sdkMapviewPickmapfeaturesresultToFfi(value) : Pointer<Void>.fromAddress(0);

PickMapFeaturesResult? sdkMapviewPickmapfeaturesresultFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewPickmapfeaturesresultFromFfi(handle) : null;

void sdkMapviewPickmapfeaturesresultReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewPickmapfeaturesresultReleaseHandle(handle);

// End of PickMapFeaturesResult "private" section.

