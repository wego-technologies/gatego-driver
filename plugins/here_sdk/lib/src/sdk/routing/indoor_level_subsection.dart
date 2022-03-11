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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/routing/indoor_location_data_internal.dart';
import 'package:here_sdk/src/sdk/routing/maneuver.dart';
import 'package:meta/meta.dart';

/// @nodoc
@internal
abstract class IndoorLevelSubsection {

  /// @nodoc
  @internal
  List<GeoCoordinates> get internalpolyline;

  /// @nodoc
  @internal
  IndoorLocationDataInternal get internalindoorLocation;

  /// @nodoc
  @internal
  List<Maneuver> get internalmaneuvers;

}


// IndoorLevelSubsection "private" section, not exported.

final _sdkRoutingIndoorlevelsubsectionRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_routing_IndoorLevelSubsection_register_finalizer'));
final _sdkRoutingIndoorlevelsubsectionCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelSubsection_copy_handle'));
final _sdkRoutingIndoorlevelsubsectionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelSubsection_release_handle'));


class IndoorLevelSubsection$Impl extends __lib.NativeBase implements IndoorLevelSubsection {

  IndoorLevelSubsection$Impl(Pointer<Void> handle) : super(handle);


  late List<GeoCoordinates> _polylineCache;
  bool _polylineIsCached = false;
  @override

  List<GeoCoordinates> get internalpolyline {
    if (!_polylineIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorLevelSubsection_polyline_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _polylineCache = heresdkRoutingCommonBindingslistofSdkCoreGeocoordinatesFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingslistofSdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

      }
      _polylineIsCached = true;
    }
    return _polylineCache;
  }

  @internal
  @override
  IndoorLocationDataInternal get internalindoorLocation {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorLevelSubsection_indoorLocation_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingIndoorlocationdatainternalFromFfi(__resultHandle);
    } finally {
      sdkRoutingIndoorlocationdatainternalReleaseFfiHandle(__resultHandle);

    }

  }



  late List<Maneuver> _maneuversCache;
  bool _maneuversIsCached = false;
  @override

  List<Maneuver> get internalmaneuvers {
    if (!_maneuversIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorLevelSubsection_maneuvers_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _maneuversCache = heresdkRoutingCommonBindingslistofSdkRoutingManeuverFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingslistofSdkRoutingManeuverReleaseFfiHandle(__resultHandle);

      }
      _maneuversIsCached = true;
    }
    return _maneuversCache;
  }


}

Pointer<Void> sdkRoutingIndoorlevelsubsectionToFfi(IndoorLevelSubsection value) =>
  _sdkRoutingIndoorlevelsubsectionCopyHandle((value as __lib.NativeBase).handle);

IndoorLevelSubsection sdkRoutingIndoorlevelsubsectionFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is IndoorLevelSubsection) return instance;

  final _copiedHandle = _sdkRoutingIndoorlevelsubsectionCopyHandle(handle);
  final result = IndoorLevelSubsection$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkRoutingIndoorlevelsubsectionRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkRoutingIndoorlevelsubsectionReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingIndoorlevelsubsectionReleaseHandle(handle);

Pointer<Void> sdkRoutingIndoorlevelsubsectionToFfiNullable(IndoorLevelSubsection? value) =>
  value != null ? sdkRoutingIndoorlevelsubsectionToFfi(value) : Pointer<Void>.fromAddress(0);

IndoorLevelSubsection? sdkRoutingIndoorlevelsubsectionFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingIndoorlevelsubsectionFromFfi(handle) : null;

void sdkRoutingIndoorlevelsubsectionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingIndoorlevelsubsectionReleaseHandle(handle);

// End of IndoorLevelSubsection "private" section.

