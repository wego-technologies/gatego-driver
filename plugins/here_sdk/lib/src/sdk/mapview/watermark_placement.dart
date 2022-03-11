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

/// Defines the allowed display locations for HERE logo watermark in the preferred order.
enum WatermarkPlacement {
    /// HERE logo watermark placed in the bottom-right corner of the map view which is the default.
    bottomRight,
    /// HERE logo watermark placed in the bottom-left corner of the map view.
    bottomLeft,
    /// HERE logo watermark placed in the bottom-center of the map view.
    bottomCenter
}

// WatermarkPlacement "private" section, not exported.

int sdkMapviewWatermarkplacementToFfi(WatermarkPlacement value) {
  switch (value) {
  case WatermarkPlacement.bottomRight:
    return 0;
  case WatermarkPlacement.bottomLeft:
    return 1;
  case WatermarkPlacement.bottomCenter:
    return 2;
  default:
    throw StateError("Invalid enum value $value for WatermarkPlacement enum.");
  }
}

WatermarkPlacement sdkMapviewWatermarkplacementFromFfi(int handle) {
  switch (handle) {
  case 0:
    return WatermarkPlacement.bottomRight;
  case 1:
    return WatermarkPlacement.bottomLeft;
  case 2:
    return WatermarkPlacement.bottomCenter;
  default:
    throw StateError("Invalid numeric value $handle for WatermarkPlacement enum.");
  }
}

void sdkMapviewWatermarkplacementReleaseFfiHandle(int handle) {}

final _sdkMapviewWatermarkplacementCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_WatermarkPlacement_create_handle_nullable'));
final _sdkMapviewWatermarkplacementReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_WatermarkPlacement_release_handle_nullable'));
final _sdkMapviewWatermarkplacementGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_WatermarkPlacement_get_value_nullable'));

Pointer<Void> sdkMapviewWatermarkplacementToFfiNullable(WatermarkPlacement? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewWatermarkplacementToFfi(value);
  final result = _sdkMapviewWatermarkplacementCreateHandleNullable(_handle);
  sdkMapviewWatermarkplacementReleaseFfiHandle(_handle);
  return result;
}

WatermarkPlacement? sdkMapviewWatermarkplacementFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewWatermarkplacementGetValueNullable(handle);
  final result = sdkMapviewWatermarkplacementFromFfi(_handle);
  sdkMapviewWatermarkplacementReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewWatermarkplacementReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewWatermarkplacementReleaseHandleNullable(handle);

// End of WatermarkPlacement "private" section.

