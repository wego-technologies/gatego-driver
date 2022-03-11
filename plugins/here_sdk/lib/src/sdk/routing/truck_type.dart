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

/// Specifies the type of truck.
@Deprecated("Will be removed in v4.12.0. Please use `TruckType` instead.")
enum TruckType {
    /// A truck on a single frame with a permanently attached cargo area.
    straight,
    /// A towing vehicle that can pull one or more semi-trailers (AKA semi-truck.)
    tractor
}

// TruckType "private" section, not exported.

int sdkRoutingTrucktypeToFfi(TruckType value) {
  switch (value) {
  case TruckType.straight:
    return 0;
  case TruckType.tractor:
    return 1;
  default:
    throw StateError("Invalid enum value $value for TruckType enum.");
  }
}

TruckType sdkRoutingTrucktypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TruckType.straight;
  case 1:
    return TruckType.tractor;
  default:
    throw StateError("Invalid numeric value $handle for TruckType enum.");
  }
}

void sdkRoutingTrucktypeReleaseFfiHandle(int handle) {}

final _sdkRoutingTrucktypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_TruckType_create_handle_nullable'));
final _sdkRoutingTrucktypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckType_release_handle_nullable'));
final _sdkRoutingTrucktypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckType_get_value_nullable'));

Pointer<Void> sdkRoutingTrucktypeToFfiNullable(TruckType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTrucktypeToFfi(value);
  final result = _sdkRoutingTrucktypeCreateHandleNullable(_handle);
  sdkRoutingTrucktypeReleaseFfiHandle(_handle);
  return result;
}

TruckType? sdkRoutingTrucktypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTrucktypeGetValueNullable(handle);
  final result = sdkRoutingTrucktypeFromFfi(_handle);
  sdkRoutingTrucktypeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTrucktypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTrucktypeReleaseHandleNullable(handle);

// End of TruckType "private" section.

