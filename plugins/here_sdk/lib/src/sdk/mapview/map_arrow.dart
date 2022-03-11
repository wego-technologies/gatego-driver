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
import 'dart:ui' as ui;
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/sdk/core/color.dart';
import 'package:here_sdk/src/sdk/core/geo_polyline.dart';
import 'package:meta/meta.dart';

/// A visual representation of an arrow on the map.
///
/// It consists of a polyline with an arbitrary
/// number of points and an arrow tip at its end. The map arrows are only visible on zoom levels
/// above 13.
///
/// To display the map arrow, it needs to be added to the scene using [MapScene.addMapArrow].
/// To stop displaying it, remove it from the scene using [MapScene.removeMapArrow].
abstract class MapArrow {
  /// Creates a new MapArrow instance
  ///
  /// [geometry] The geometry of the arrow. The last coordinate in the list defines the position where the
  /// tip of the arrow is located.
  ///
  /// [widthInPixels] The width of the arrow line in pixel. The tip is scaled accordingly.
  ///
  /// [color] The color with which to render the arrow.
  ///
  factory MapArrow(GeoPolyline geometry, double widthInPixels, ui.Color color) => $prototype.$init(geometry, widthInPixels, color);


  /// @nodoc
  int internalgetId();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapArrow$Impl(Pointer<Void>.fromAddress(0));
}


// MapArrow "private" section, not exported.

final _sdkMapviewMaparrowRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapArrow_register_finalizer'));
final _sdkMapviewMaparrowCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapArrow_copy_handle'));
final _sdkMapviewMaparrowReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapArrow_release_handle'));




/// @nodoc
@visibleForTesting
class MapArrow$Impl extends __lib.NativeBase implements MapArrow {

  MapArrow$Impl(Pointer<Void> handle) : super(handle);


  MapArrow $init(GeoPolyline geometry, double widthInPixels, ui.Color color) {
    final _result_handle = _$init(geometry, widthInPixels, color);
    final _result = MapArrow$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMaparrowRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(GeoPolyline geometry, double widthInPixels, ui.Color color) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Double, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapArrow_make__GeoPolyline_Double_Color'));
    final _geometryHandle = sdkCoreGeopolylineToFfi(geometry);
    final _widthInPixelsHandle = (widthInPixels);
    final _colorHandle = sdkCoreColorToFfi(color);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _geometryHandle, _widthInPixelsHandle, _colorHandle);
    sdkCoreGeopolylineReleaseFfiHandle(_geometryHandle);

    sdkCoreColorReleaseFfiHandle(_colorHandle);
    return __resultHandle;
  }

  @override
  int internalgetId() {
    final _getIdFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapArrow_getId'));
    final _handle = this.handle;
    final __resultHandle = _getIdFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


}

Pointer<Void> sdkMapviewMaparrowToFfi(MapArrow value) =>
  _sdkMapviewMaparrowCopyHandle((value as __lib.NativeBase).handle);

MapArrow sdkMapviewMaparrowFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapArrow) return instance;

  final _copiedHandle = _sdkMapviewMaparrowCopyHandle(handle);
  final result = MapArrow$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMaparrowRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMaparrowReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMaparrowReleaseHandle(handle);

Pointer<Void> sdkMapviewMaparrowToFfiNullable(MapArrow? value) =>
  value != null ? sdkMapviewMaparrowToFfi(value) : Pointer<Void>.fromAddress(0);

MapArrow? sdkMapviewMaparrowFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMaparrowFromFfi(handle) : null;

void sdkMapviewMaparrowReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMaparrowReleaseHandle(handle);

// End of MapArrow "private" section.

