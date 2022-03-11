// Copyright (c) 2019-2022 HERE Global B.V. and its affiliate(s).
// All rights reserved.
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

/// Content types supported by the map.
enum MapContentType {
    /// Geodetic point.
    point,
    /// Screen point.
    screenPoint,
    /// Geodetic line.
    line,
    /// Shiftable geodetic line.
    lineShiftable,
    /// Geodetic polygon.
    polygon,
    /// Raster image.
    rasterImage,
    /// Geodetic anchored mesh.
    mesh
}

// MapContentType "private" section, not exported.

int sdkMapviewMapcontenttypeToFfi(MapContentType value) {
  switch (value) {
  case MapContentType.point:
    return 0;
  case MapContentType.screenPoint:
    return 1;
  case MapContentType.line:
    return 2;
  case MapContentType.lineShiftable:
    return 3;
  case MapContentType.polygon:
    return 4;
  case MapContentType.rasterImage:
    return 5;
  case MapContentType.mesh:
    return 6;
  default:
    throw StateError("Invalid enum value $value for MapContentType enum.");
  }
}

MapContentType sdkMapviewMapcontenttypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MapContentType.point;
  case 1:
    return MapContentType.screenPoint;
  case 2:
    return MapContentType.line;
  case 3:
    return MapContentType.lineShiftable;
  case 4:
    return MapContentType.polygon;
  case 5:
    return MapContentType.rasterImage;
  case 6:
    return MapContentType.mesh;
  default:
    throw StateError("Invalid numeric value $handle for MapContentType enum.");
  }
}

void sdkMapviewMapcontenttypeReleaseFfiHandle(int handle) {}

final _sdkMapviewMapcontenttypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapContentType_create_handle_nullable'));
final _sdkMapviewMapcontenttypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContentType_release_handle_nullable'));
final _sdkMapviewMapcontenttypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContentType_get_value_nullable'));

Pointer<Void> sdkMapviewMapcontenttypeToFfiNullable(MapContentType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapcontenttypeToFfi(value);
  final result = _sdkMapviewMapcontenttypeCreateHandleNullable(_handle);
  sdkMapviewMapcontenttypeReleaseFfiHandle(_handle);
  return result;
}

MapContentType? sdkMapviewMapcontenttypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapcontenttypeGetValueNullable(handle);
  final result = sdkMapviewMapcontenttypeFromFfi(_handle);
  sdkMapviewMapcontenttypeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapcontenttypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcontenttypeReleaseHandleNullable(handle);

// End of MapContentType "private" section.

