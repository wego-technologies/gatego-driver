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
import 'package:here_sdk/src/sdk/routing/avoidance_options.dart';
import 'package:here_sdk/src/sdk/routing/route_options.dart';
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';

/// All the options to specify how a car route should be calculated.

class CarOptions {
  /// Specifies the common route calculation options.
  RouteOptions routeOptions;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  RouteTextOptions textOptions;

  /// Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.
  AvoidanceOptions avoidanceOptions;

  CarOptions.withDefaults()
      : routeOptions = RouteOptions.withDefaults(), textOptions = RouteTextOptions.withDefaults(), avoidanceOptions = AvoidanceOptions.withDefaults();
  @Deprecated("Will be removed in v4.13.0. Please use CarOptions.withDefaults() instead.")
  CarOptions(this.routeOptions, this.textOptions, this.avoidanceOptions);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CarOptions) return false;
    CarOptions _other = other;
    return routeOptions == _other.routeOptions &&
        textOptions == _other.textOptions &&
        avoidanceOptions == _other.avoidanceOptions;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + routeOptions.hashCode;
    result = 31 * result + textOptions.hashCode;
    result = 31 * result + avoidanceOptions.hashCode;
    return result;
  }
}


// CarOptions "private" section, not exported.

final _sdkRoutingCaroptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_create_handle'));
final _sdkRoutingCaroptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_release_handle'));
final _sdkRoutingCaroptionsGetFieldrouteOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_get_field_routeOptions'));
final _sdkRoutingCaroptionsGetFieldtextOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_get_field_textOptions'));
final _sdkRoutingCaroptionsGetFieldavoidanceOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_get_field_avoidanceOptions'));



Pointer<Void> sdkRoutingCaroptionsToFfi(CarOptions value) {
  final _routeOptionsHandle = sdkRoutingRouteoptionsToFfi(value.routeOptions);
  final _textOptionsHandle = sdkRoutingRoutetextoptionsToFfi(value.textOptions);
  final _avoidanceOptionsHandle = sdkRoutingAvoidanceoptionsToFfi(value.avoidanceOptions);
  final _result = _sdkRoutingCaroptionsCreateHandle(_routeOptionsHandle, _textOptionsHandle, _avoidanceOptionsHandle);
  sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
  sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
  sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
  return _result;
}

CarOptions sdkRoutingCaroptionsFromFfi(Pointer<Void> handle) {
  final _routeOptionsHandle = _sdkRoutingCaroptionsGetFieldrouteOptions(handle);
  final _textOptionsHandle = _sdkRoutingCaroptionsGetFieldtextOptions(handle);
  final _avoidanceOptionsHandle = _sdkRoutingCaroptionsGetFieldavoidanceOptions(handle);
  try {
    return CarOptions(
      sdkRoutingRouteoptionsFromFfi(_routeOptionsHandle), 
      sdkRoutingRoutetextoptionsFromFfi(_textOptionsHandle), 
      sdkRoutingAvoidanceoptionsFromFfi(_avoidanceOptionsHandle)
    );
  } finally {
    sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
    sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
    sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
  }
}

void sdkRoutingCaroptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingCaroptionsReleaseHandle(handle);

// Nullable CarOptions

final _sdkRoutingCaroptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_create_handle_nullable'));
final _sdkRoutingCaroptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_release_handle_nullable'));
final _sdkRoutingCaroptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_get_value_nullable'));

Pointer<Void> sdkRoutingCaroptionsToFfiNullable(CarOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingCaroptionsToFfi(value);
  final result = _sdkRoutingCaroptionsCreateHandleNullable(_handle);
  sdkRoutingCaroptionsReleaseFfiHandle(_handle);
  return result;
}

CarOptions? sdkRoutingCaroptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingCaroptionsGetValueNullable(handle);
  final result = sdkRoutingCaroptionsFromFfi(_handle);
  sdkRoutingCaroptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingCaroptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingCaroptionsReleaseHandleNullable(handle);

// End of CarOptions "private" section.

