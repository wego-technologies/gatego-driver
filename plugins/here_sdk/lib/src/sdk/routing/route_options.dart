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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/optimization_mode.dart';

/// The options to specify how the route will be calculated.

class RouteOptions {
  /// The optimization mode to be used for route calculation.
  OptimizationMode optimizationMode;

  /// Maximum number of alternative routes that will be calculated, in addition
  /// to the best one. The provided value must be in the range \[0, 6\].
  /// Alternative routes can be unavailable, thus they are not guaranteed to be returned.
  /// The order of routes is from the best to the worst, as evaluated by the route calculation
  /// algorithm and according to the given input parameters.
  /// Defaults to 0, which means there are no alternatives, i.e. only the best route is returned.
  /// Must be 0 for isoline calculation.
  int alternatives;

  /// Optional time when travel is expected to start. Traffic speed and
  /// incidents shall be taken into account in the calculation of the route, per [RouteOptions.enableTrafficOptimization].
  /// If it is not specified, it is assumed to be the current time, i.e. now. Note that both departure time and [RouteOptions.arrivalTime]
  /// cannot be set set at the same time.
  DateTime? departureTime;

  /// Optional time when travel is expected to end. Traffic speed and
  /// incidents shall be taken into account in the calculation of the route, per [RouteOptions.enableTrafficOptimization].
  /// Note that both [RouteOptions.departureTime] and arrival time cannot be set set at the same time.
  DateTime? arrivalTime;

  /// Specifies the maximum speed in meters per second, which the user wishes not to exceed.
  /// The valid range is \[1, 70\] meters per second. Note that it is valid only for [TransportMode.car],
  /// [TransportMode.truck] and [TransportMode.scooter] transport modes.
  /// For car, truck and scooter transport modes, it will affect [Route.duration] of
  /// the route. Only for scooter transport mode, it may affect the route geometry. Defaults to `null`,
  /// which means that no speed cap is set.
  double? speedCapInMetersPerSecond;

  /// A flag that indicates whether the resulting route should contain a [RouteHandle].
  /// Defaults to false.
  bool enableRouteHandle;

  /// A flag that indicates whether traffic information should be considered during route calculation.
  /// When it is enabled, the shape of the route will be adjusted according to the traffic situation that
  /// depends on the [RouteOptions.departureTime]. As a result, streets with heavy traffic
  /// will be avoided whenever possible. When it is disabled, both [RouteOptions.departureTime]
  /// and [RouteOptions.arrivalTime] are ignored, and the route will be shaped disregarding all
  /// the available current and historical traffic information, except long-term road closures. Defaults to true.
  bool enableTrafficOptimization;

  /// A flag that indicates whether the resulting route [Section.tolls] properties should contain
  /// tolls data. Defaults to false.
  ///
  /// **Note:** When a route calculation request asks tolls, a pricing scheme with higher rates might be applied.
  /// Consult your HERE representative to get more information on the related pricing schemes.
  bool enableTolls;

  /// Specifies the number of occupants in the vehicle, including driver,
  /// can affect the vehicle's ability to use HOV/carpool restricted lanes.
  /// Valid only for Car and Truck transport mode. Shouldn't be less then 1. Defaults to 1 and ignored in this case.
  int occupantsNumber;

  RouteOptions([OptimizationMode optimizationMode = OptimizationMode.fastest, int alternatives = 0, DateTime? departureTime = null, DateTime? arrivalTime = null, double? speedCapInMetersPerSecond = null, bool enableRouteHandle = false, bool enableTrafficOptimization = true, bool enableTolls = false, int occupantsNumber = 1])
    : optimizationMode = optimizationMode, alternatives = alternatives, departureTime = departureTime, arrivalTime = arrivalTime, speedCapInMetersPerSecond = speedCapInMetersPerSecond, enableRouteHandle = enableRouteHandle, enableTrafficOptimization = enableTrafficOptimization, enableTolls = enableTolls, occupantsNumber = occupantsNumber;
  RouteOptions.withDefaults()
    : optimizationMode = OptimizationMode.fastest, alternatives = 0, departureTime = null, arrivalTime = null, speedCapInMetersPerSecond = null, enableRouteHandle = false, enableTrafficOptimization = true, enableTolls = false, occupantsNumber = 1;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RouteOptions) return false;
    RouteOptions _other = other;
    return optimizationMode == _other.optimizationMode &&
        alternatives == _other.alternatives &&
        departureTime == _other.departureTime &&
        arrivalTime == _other.arrivalTime &&
        speedCapInMetersPerSecond == _other.speedCapInMetersPerSecond &&
        enableRouteHandle == _other.enableRouteHandle &&
        enableTrafficOptimization == _other.enableTrafficOptimization &&
        enableTolls == _other.enableTolls &&
        occupantsNumber == _other.occupantsNumber;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + optimizationMode.hashCode;
    result = 31 * result + alternatives.hashCode;
    result = 31 * result + departureTime.hashCode;
    result = 31 * result + arrivalTime.hashCode;
    result = 31 * result + speedCapInMetersPerSecond.hashCode;
    result = 31 * result + enableRouteHandle.hashCode;
    result = 31 * result + enableTrafficOptimization.hashCode;
    result = 31 * result + enableTolls.hashCode;
    result = 31 * result + occupantsNumber.hashCode;
    return result;
  }
}


// RouteOptions "private" section, not exported.

final _sdkRoutingRouteoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint8, Uint8, Uint8, Int32),
    Pointer<Void> Function(int, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, int, int, int)
  >('here_sdk_sdk_routing_RouteOptions_create_handle'));
final _sdkRoutingRouteoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_release_handle'));
final _sdkRoutingRouteoptionsGetFieldoptimizationMode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_optimizationMode'));
final _sdkRoutingRouteoptionsGetFieldalternatives = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_alternatives'));
final _sdkRoutingRouteoptionsGetFielddepartureTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_departureTime'));
final _sdkRoutingRouteoptionsGetFieldarrivalTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_arrivalTime'));
final _sdkRoutingRouteoptionsGetFieldspeedCapInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_speedCapInMetersPerSecond'));
final _sdkRoutingRouteoptionsGetFieldenableRouteHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_enableRouteHandle'));
final _sdkRoutingRouteoptionsGetFieldenableTrafficOptimization = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_enableTrafficOptimization'));
final _sdkRoutingRouteoptionsGetFieldenableTolls = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_enableTolls'));
final _sdkRoutingRouteoptionsGetFieldoccupantsNumber = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_occupantsNumber'));



Pointer<Void> sdkRoutingRouteoptionsToFfi(RouteOptions value) {
  final _optimizationModeHandle = sdkRoutingOptimizationmodeToFfi(value.optimizationMode);
  final _alternativesHandle = (value.alternatives);
  final _departureTimeHandle = dateToFfiNullable(value.departureTime);
  final _arrivalTimeHandle = dateToFfiNullable(value.arrivalTime);
  final _speedCapInMetersPerSecondHandle = doubleToFfiNullable(value.speedCapInMetersPerSecond);
  final _enableRouteHandleHandle = booleanToFfi(value.enableRouteHandle);
  final _enableTrafficOptimizationHandle = booleanToFfi(value.enableTrafficOptimization);
  final _enableTollsHandle = booleanToFfi(value.enableTolls);
  final _occupantsNumberHandle = (value.occupantsNumber);
  final _result = _sdkRoutingRouteoptionsCreateHandle(_optimizationModeHandle, _alternativesHandle, _departureTimeHandle, _arrivalTimeHandle, _speedCapInMetersPerSecondHandle, _enableRouteHandleHandle, _enableTrafficOptimizationHandle, _enableTollsHandle, _occupantsNumberHandle);
  sdkRoutingOptimizationmodeReleaseFfiHandle(_optimizationModeHandle);
  
  dateReleaseFfiHandleNullable(_departureTimeHandle);
  dateReleaseFfiHandleNullable(_arrivalTimeHandle);
  doubleReleaseFfiHandleNullable(_speedCapInMetersPerSecondHandle);
  booleanReleaseFfiHandle(_enableRouteHandleHandle);
  booleanReleaseFfiHandle(_enableTrafficOptimizationHandle);
  booleanReleaseFfiHandle(_enableTollsHandle);
  
  return _result;
}

RouteOptions sdkRoutingRouteoptionsFromFfi(Pointer<Void> handle) {
  final _optimizationModeHandle = _sdkRoutingRouteoptionsGetFieldoptimizationMode(handle);
  final _alternativesHandle = _sdkRoutingRouteoptionsGetFieldalternatives(handle);
  final _departureTimeHandle = _sdkRoutingRouteoptionsGetFielddepartureTime(handle);
  final _arrivalTimeHandle = _sdkRoutingRouteoptionsGetFieldarrivalTime(handle);
  final _speedCapInMetersPerSecondHandle = _sdkRoutingRouteoptionsGetFieldspeedCapInMetersPerSecond(handle);
  final _enableRouteHandleHandle = _sdkRoutingRouteoptionsGetFieldenableRouteHandle(handle);
  final _enableTrafficOptimizationHandle = _sdkRoutingRouteoptionsGetFieldenableTrafficOptimization(handle);
  final _enableTollsHandle = _sdkRoutingRouteoptionsGetFieldenableTolls(handle);
  final _occupantsNumberHandle = _sdkRoutingRouteoptionsGetFieldoccupantsNumber(handle);
  try {
    return RouteOptions(
      sdkRoutingOptimizationmodeFromFfi(_optimizationModeHandle), 
      (_alternativesHandle), 
      dateFromFfiNullable(_departureTimeHandle), 
      dateFromFfiNullable(_arrivalTimeHandle), 
      doubleFromFfiNullable(_speedCapInMetersPerSecondHandle), 
      booleanFromFfi(_enableRouteHandleHandle), 
      booleanFromFfi(_enableTrafficOptimizationHandle), 
      booleanFromFfi(_enableTollsHandle), 
      (_occupantsNumberHandle)
    );
  } finally {
    sdkRoutingOptimizationmodeReleaseFfiHandle(_optimizationModeHandle);
    
    dateReleaseFfiHandleNullable(_departureTimeHandle);
    dateReleaseFfiHandleNullable(_arrivalTimeHandle);
    doubleReleaseFfiHandleNullable(_speedCapInMetersPerSecondHandle);
    booleanReleaseFfiHandle(_enableRouteHandleHandle);
    booleanReleaseFfiHandle(_enableTrafficOptimizationHandle);
    booleanReleaseFfiHandle(_enableTollsHandle);
    
  }
}

void sdkRoutingRouteoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingRouteoptionsReleaseHandle(handle);

// Nullable RouteOptions

final _sdkRoutingRouteoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_create_handle_nullable'));
final _sdkRoutingRouteoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_release_handle_nullable'));
final _sdkRoutingRouteoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_value_nullable'));

Pointer<Void> sdkRoutingRouteoptionsToFfiNullable(RouteOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingRouteoptionsToFfi(value);
  final result = _sdkRoutingRouteoptionsCreateHandleNullable(_handle);
  sdkRoutingRouteoptionsReleaseFfiHandle(_handle);
  return result;
}

RouteOptions? sdkRoutingRouteoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingRouteoptionsGetValueNullable(handle);
  final result = sdkRoutingRouteoptionsFromFfi(_handle);
  sdkRoutingRouteoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingRouteoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRouteoptionsReleaseHandleNullable(handle);

// End of RouteOptions "private" section.

