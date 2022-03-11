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

/// Specifies the tunnel categories.
@Deprecated("Will be removed in v4.12.0. Please use `TunnelCategory` instead.")
enum TunnelCategory {
    /// Category B.
    b,
    /// Category C.
    c,
    /// Category D.
    d,
    /// Category E.
    e
}

// TunnelCategory "private" section, not exported.

int sdkRoutingTunnelcategoryToFfi(TunnelCategory value) {
  switch (value) {
  case TunnelCategory.b:
    return 0;
  case TunnelCategory.c:
    return 1;
  case TunnelCategory.d:
    return 2;
  case TunnelCategory.e:
    return 3;
  default:
    throw StateError("Invalid enum value $value for TunnelCategory enum.");
  }
}

TunnelCategory sdkRoutingTunnelcategoryFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TunnelCategory.b;
  case 1:
    return TunnelCategory.c;
  case 2:
    return TunnelCategory.d;
  case 3:
    return TunnelCategory.e;
  default:
    throw StateError("Invalid numeric value $handle for TunnelCategory enum.");
  }
}

void sdkRoutingTunnelcategoryReleaseFfiHandle(int handle) {}

final _sdkRoutingTunnelcategoryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_TunnelCategory_create_handle_nullable'));
final _sdkRoutingTunnelcategoryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TunnelCategory_release_handle_nullable'));
final _sdkRoutingTunnelcategoryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TunnelCategory_get_value_nullable'));

Pointer<Void> sdkRoutingTunnelcategoryToFfiNullable(TunnelCategory? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTunnelcategoryToFfi(value);
  final result = _sdkRoutingTunnelcategoryCreateHandleNullable(_handle);
  sdkRoutingTunnelcategoryReleaseFfiHandle(_handle);
  return result;
}

TunnelCategory? sdkRoutingTunnelcategoryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTunnelcategoryGetValueNullable(handle);
  final result = sdkRoutingTunnelcategoryFromFfi(_handle);
  sdkRoutingTunnelcategoryReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTunnelcategoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTunnelcategoryReleaseHandleNullable(handle);

// End of TunnelCategory "private" section.

