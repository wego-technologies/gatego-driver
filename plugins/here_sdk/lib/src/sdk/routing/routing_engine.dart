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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/routing/bicycle_options.dart';
import 'package:here_sdk/src/sdk/routing/calculate_isoline_callback.dart';
import 'package:here_sdk/src/sdk/routing/calculate_route_callback.dart';
import 'package:here_sdk/src/sdk/routing/car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_truck_options.dart';
import 'package:here_sdk/src/sdk/routing/isoline_options.dart';
import 'package:here_sdk/src/sdk/routing/pedestrian_options.dart';
import 'package:here_sdk/src/sdk/routing/refresh_route_options.dart';
import 'package:here_sdk/src/sdk/routing/route.dart';
import 'package:here_sdk/src/sdk/routing/route_handle.dart';
import 'package:here_sdk/src/sdk/routing/routing_interface.dart';
import 'package:here_sdk/src/sdk/routing/scooter_options.dart';
import 'package:here_sdk/src/sdk/routing/taxi_options.dart';
import 'package:here_sdk/src/sdk/routing/truck_options.dart';
import 'package:here_sdk/src/sdk/routing/waypoint.dart';
import 'package:meta/meta.dart';

/// Use the RoutingEngine to calculate a route from A to B with
/// a number of waypoints in between.
///
/// Route calculation is done asynchronously and requires an
/// online connection. The resulting route contains various
/// information such as the polyline, route length in meters,
/// estimated time to traverse along the route and maneuver data.
///
/// An application may use RoutingEngine.returnToRoute() method to submit a new
/// starting point for a previously calculated route. This method tries to avoid a costly
/// route re-calculation as much as possible. In case returning to the route without
/// re-calculation is not possible, a new route is calculated, while trying to salvage
/// the previous route as much as possible. However, a completely new route
/// containing no part of the previous route is possible, too.
abstract class RoutingEngine implements RoutingInterface {
  /// Creates a new instance of this class.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory RoutingEngine() => $prototype.$init();
  /// Creates a new instance of RoutingEngine.
  ///
  /// [sdkEngine] An SDKEngine instance.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory RoutingEngine.withSdkEngine(SDKNativeEngine sdkEngine) => $prototype.withSdkEngine(sdkEngine);

  /// Asynchronously calculates isolines to indicate the reachable area from a center point.
  ///
  /// This finds all destinations that can be reached in a specific amount of time,
  /// a maximum travel distance, or even the charge level available in an electric vehicle.
  /// The result is a polygon area where each point is reachable within the provided limit.
  ///
  /// [center] Center point from which isolines are calculated.
  /// At minimum, the waypoint must contain the coordinates as point of origin.
  ///
  /// [isolineOptions] Options for isoline calculation.
  ///
  /// [callback] Callback object that will be invoked after isoline calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle calculateIsoline(Waypoint center, IsolineOptions isolineOptions, CalculateIsolineCallback callback);
  /// Asynchronously refreshes a route from the [RouteHandle] provided, i.e.
  ///
  /// refreshes a previously
  /// calculated route, with a new starting point and the specified [RefreshRouteOptions].
  ///
  /// An application may use this to update several options on-the-fly. It is not meant to re-calculate a route after
  /// a route deviation was detected, as in such cases the new starting point would lie too far away from the original
  /// route.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [routeHandle] The route handle holding the route to be refreshed.
  ///
  /// [startingPoint] Updates the starting point of the route. It should be of type [WaypointType.stopover]. Otherwise,
  /// an [RoutingError.invalidParameter] error is generated. Moreover, it should be very close to the
  /// original route specified with the [RouteHandle]. Since the new starting point is expected to be
  /// along the original route, the original route geometry is used to reach the remaining waypoints. The new route
  /// will not include the [Waypoint] items that lie behind the new starting point (i.e. the path that
  /// was already travelled). Plus, [Route.lengthInMeters] and [Route.duration]
  /// values are from the new starting point to the destination. If the new waypoint is too far off the original
  /// route, the route refresh may fail and an [RoutingError.noRouteFound] error is triggered. In that
  /// case, an application may decide to calculate a new route from scratch.
  ///
  /// [refreshRouteOptions] Options to refresh the route.
  ///
  /// [callback] Callback object that will be invoked after refreshing the route.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle refreshRoute(RouteHandle routeHandle, Waypoint startingPoint, RefreshRouteOptions refreshRouteOptions, CalculateRouteCallback callback);
  /// Asynchronously recreates a route from the [RouteHandle] provided, i.e.
  ///
  /// refreshes a previously
  /// calculated route, with the specified [RefreshRouteOptions].
  ///
  /// A route handle can be invalid when the map data changes that is used by the HERE backend to recreate the route. This happens regularly.
  /// Therefore, the route handle is not meant to be persisted for a longer time. Instead, a possible use case can be to plan a route with another HERE service.
  /// For example, a HERE REST API that allows to calculate a route on a desktop. Then this route can be transferred via the handle to a mobile device for further use with the HERE SDK.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [routeHandle] The route handle holding the route to be refreshed.
  ///
  /// [refreshRouteOptions] Options to import the route from handle.
  ///
  /// [callback] Callback object that will be invoked after refreshing the route.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle importRouteFromHandle(RouteHandle routeHandle, RefreshRouteOptions refreshRouteOptions, CalculateRouteCallback callback);
  /// Asynchronously creates a car route from a sequence of geographic coordinates very close to each other.
  ///
  /// The route shape will
  /// be kept as close as possible to the one provided. For best results please use 1Hz GPS data,
  /// or anyway geographic coordinates that have a spacing of a few meters one from the other. For example, such a list of geographic coordinates can
  /// be extracted from a GPX trace or a route object from a 3rd party library. Very sparse data may be rejected by the service with an error.
  ///
  /// **Note:** Any restrictions applied to a transport type or provided options will be
  /// discarded and reported as violations in [Section.sectionNotices] .
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [locations] The list of locations used to calculate the route. Note that only the [Location.coordinates] of a location are used to import the route.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the location list
  /// size is not in the range \[2,10000\].
  ///
  /// [carOptions] Options specific for car route calculation, along with
  /// common route options.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle importCarRoute(List<location_impl.Location> locations, CarOptions carOptions, CalculateRouteCallback callback);
  /// Asynchronously creates a pedestrian route from a sequence of geographic coordinates very close to each other.
  ///
  /// The route shape will
  /// be kept as close as possible to the one provided. For best results please use 1Hz GPS data,
  /// or anyway geographic coordinates that have a spacing of a few meters one from the other. For example, such a list of geographic coordinates can
  /// be extracted from a GPX trace or a route object from a 3rd party library. Very sparse data may be rejected by the service with an error.
  ///
  /// **Note:** Any restrictions applied to a transport type or provided options will be
  /// discarded and reported as violations in [Section.sectionNotices] .
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [locations] The list of locations used to calculate the route. Note that only the [Location.coordinates] of a location are used to import the route.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the location list
  /// size is not in the range \[2,10000\].
  ///
  /// [pedestrianOptions] Options specific for pedestrian route calculation, along with
  /// common route options. Note that [OptimizationMode.shortest] is
  /// is not supported for pedestrians and converted to
  /// [OptimizationMode.fastest] automatically.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle importPedestrianRoute(List<location_impl.Location> locations, PedestrianOptions pedestrianOptions, CalculateRouteCallback callback);
  /// Asynchronously creates a bicycle route from a sequence of geographic coordinates very close to each other.
  ///
  /// The route shape will
  /// be kept as close as possible to the one provided. For best results please use 1Hz GPS data,
  /// or anyway geographic coordinates that have a spacing of a few meters one from the other. For example, such a list of geographic coordinates can
  /// be extracted from a GPX trace or a route object from a 3rd party library. Very sparse data may be rejected by the service with an error.
  ///
  /// **Note:** Any restrictions applied to a transport type or provided options will be
  /// discarded and reported as violations in [Section.sectionNotices] .
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [locations] The list of locations used to calculate the route. Note that only the [Location.coordinates] of a location are used to import the route.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the location list
  /// size is not in the range \[2,10000\].
  ///
  /// [bicycleOptions] Options specific for bicycle route calculation, along with
  /// common route options.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle importBicycleRoute(List<location_impl.Location> locations, BicycleOptions bicycleOptions, CalculateRouteCallback callback);
  /// Asynchronously creates a truck route from a sequence of geographic coordinates very close to each other.
  ///
  /// The route shape will
  /// be kept as close as possible to the one provided. For best results please use 1Hz GPS data,
  /// or anyway geographic coordinates that have a spacing of a few meters one from the other. For example, such a list of geographic coordinates can
  /// be extracted from a GPX trace or a route object from a 3rd party library. Very sparse data may be rejected by the service with an error.
  ///
  /// **Note:** Any restrictions applied to a transport type or provided options will be
  /// discarded and reported as violations in [Section.sectionNotices] .
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [locations] The list of locations used to calculate the route. Note that only the [Location.coordinates] of a location are used to import the route.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the location list
  /// size is not in the range \[2,10000\].
  ///
  /// [truckOptions] Options specific for truck route calculation, along with
  /// common route options.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle importTruckRoute(List<location_impl.Location> locations, TruckOptions truckOptions, CalculateRouteCallback callback);
  /// Asynchronously creates a scooter route from a sequence of geographic coordinates very close to each other.
  ///
  /// The route shape will
  /// be kept as close as possible to the one provided. For best results please use 1Hz GPS data,
  /// or anyway geographic coordinates that have a spacing of a few meters one from the other. For example, such a list of geographic coordinates can
  /// be extracted from a GPX trace or a route object from a 3rd party library. Very sparse data may be rejected by the service with an error.
  ///
  /// **Note:** Any restrictions applied to a transport type or provided options will be
  /// discarded and reported as violations in [Section.sectionNotices] .
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [locations] The list of locations used to calculate the route. Note that only the [Location.coordinates] of a location are used to import the route.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the location list
  /// size is not in the range \[2,10000\].
  ///
  /// [scooterOptions] Options specific for scooter route calculation, along with
  /// common route options. Note that [OptimizationMode.shortest] is
  /// is not supported for scooters and converted to
  /// [OptimizationMode.fastest] automatically.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle importScooterRoute(List<location_impl.Location> locations, ScooterOptions scooterOptions, CalculateRouteCallback callback);
  /// Asynchronously creates a taxi route from a sequence of geographic coordinates very close to each other.
  ///
  /// The route shape will
  /// be kept as close as possible to the one provided. For best results please use 1Hz GPS data,
  /// or anyway geographic coordinates that have a spacing of a few meters one from the other. For example, such a list of geographic coordinates can
  /// be extracted from a GPX trace or a route object from a 3rd party library. Very sparse data may be rejected by the service with an error.
  ///
  /// **Note:** Any restrictions applied to a transport type or provided options will be
  /// discarded and reported as violations in [Section.sectionNotices] .
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [locations] The list of locations used to calculate the route. Note that only the [Location.coordinates] of a location are used to import the route.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the location list
  /// size is not in the range \[2,10000\].
  ///
  /// [taxiOptions] Options specific for taxi route calculation, along with
  /// common route options. Note that [OptimizationMode.shortest] is
  /// is not supported for taxis and converted to
  /// [OptimizationMode.fastest] automatically.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle importTaxiRoute(List<location_impl.Location> locations, TaxiOptions taxiOptions, CalculateRouteCallback callback);
  /// Asynchronously creates an electric car route from a sequence of geographic coordinates very close to each other.
  ///
  /// The route shape will
  /// be kept as close as possible to the one provided. For best results please use 1Hz GPS data,
  /// or anyway geographic coordinates that have a spacing of a few meters one from the other. For example, such a list of geographic coordinates can
  /// be extracted from a GPX trace or a route object from a 3rd party library. Very sparse data may be rejected by the service with an error.
  ///
  /// **Note:** Any restrictions applied to a transport type or provided options will be
  /// discarded and reported as violations in [Section.sectionNotices] .
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [locations] The list of locations used to calculate the route. Note that only the [Location.coordinates] of a location are used to import the route.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the location list
  /// size is not in the range \[2,10000\].
  ///
  /// [evCarOptions] Options specific for an electric car route calculation, along with
  /// common route options.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle importEVCarRoute(List<location_impl.Location> locations, EVCarOptions evCarOptions, CalculateRouteCallback callback);
  /// Asynchronously creates an electric truck route from a sequence of geographic coordinates very close to each other.
  ///
  /// The route shape will
  /// be kept as close as possible to the one provided. For best results please use 1Hz GPS data,
  /// or anyway geographic coordinates that have a spacing of a few meters one from the other. For example, such a list of geographic coordinates can
  /// be extracted from a GPX trace or a route object from a 3rd party library. Very sparse data may be rejected by the service with an error.
  ///
  /// **Note:** Any restrictions applied to a transport type or provided options will be
  /// discarded and reported as violations in [Section.sectionNotices] .
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [locations] The list of locations used to calculate the route. Note that only the [Location.coordinates] of a location are used to import the route.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the location list
  /// size is not in the range \[2,10000\].
  ///
  /// [evTruckOptions] Options specific for an electric truck route calculation, along with
  /// common route options.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle importEVTruckRoute(List<location_impl.Location> locations, EVTruckOptions evTruckOptions, CalculateRouteCallback callback);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = RoutingEngine$Impl(Pointer<Void>.fromAddress(0));
}


// RoutingEngine "private" section, not exported.

final _sdkRoutingRoutingengineRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_routing_RoutingEngine_register_finalizer'));
final _sdkRoutingRoutingengineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_copy_handle'));
final _sdkRoutingRoutingengineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_release_handle'));
final _sdkRoutingRoutingengineGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_get_type_id'));


final _$initReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make_return_release_handle'));
final _$initReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make_return_get_result'));
final _$initReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make_return_get_error'));
final _$initReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make_return_has_error'));


final _withSdkEngineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make__SDKNativeEngine_return_release_handle'));
final _withSdkEngineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make__SDKNativeEngine_return_get_result'));
final _withSdkEngineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make__SDKNativeEngine_return_get_error'));
final _withSdkEngineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make__SDKNativeEngine_return_has_error'));













/// @nodoc
@visibleForTesting
class RoutingEngine$Impl extends __lib.NativeBase implements RoutingEngine {

  RoutingEngine$Impl(Pointer<Void> handle) : super(handle);


  RoutingEngine $init() {
    final _result_handle = _$init();
    final _result = RoutingEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingRoutingengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  RoutingEngine withSdkEngine(SDKNativeEngine sdkEngine) {
    final _result_handle = _withSdkEngine(sdkEngine);
    final _result = RoutingEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingRoutingengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_routing_RoutingEngine_make'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    if (_$initReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initReturnGetError(__callResultHandle);
        _$initReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initReturnGetResult(__callResultHandle);
    _$initReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine) {
    final _withSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RoutingEngine_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _withSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    if (_withSdkEngineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withSdkEngineReturnGetError(__callResultHandle);
        _withSdkEngineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withSdkEngineReturnGetResult(__callResultHandle);
    _withSdkEngineReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  TaskHandle calculateIsoline(Waypoint center, IsolineOptions isolineOptions, CalculateIsolineCallback callback) {
    final _calculateIsolineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingEngine_calculateIsoline__Waypoint_IsolineOptions_CalculateIsolineCallback'));
    final _centerHandle = sdkRoutingWaypointToFfi(center);
    final _isolineOptionsHandle = sdkRoutingIsolineoptionsToFfi(isolineOptions);
    final _callbackHandle = sdkRoutingCalculateisolinecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateIsolineFfi(_handle, __lib.LibraryContext.isolateId, _centerHandle, _isolineOptionsHandle, _callbackHandle);
    sdkRoutingWaypointReleaseFfiHandle(_centerHandle);
    sdkRoutingIsolineoptionsReleaseFfiHandle(_isolineOptionsHandle);
    sdkRoutingCalculateisolinecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle refreshRoute(RouteHandle routeHandle, Waypoint startingPoint, RefreshRouteOptions refreshRouteOptions, CalculateRouteCallback callback) {
    final _refreshRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingEngine_refreshRoute__RouteHandle_Waypoint_RefreshRouteOptions_CalculateRouteCallback'));
    final _routeHandleHandle = sdkRoutingRoutehandleToFfi(routeHandle);
    final _startingPointHandle = sdkRoutingWaypointToFfi(startingPoint);
    final _refreshRouteOptionsHandle = sdkRoutingRefreshrouteoptionsToFfi(refreshRouteOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _refreshRouteFfi(_handle, __lib.LibraryContext.isolateId, _routeHandleHandle, _startingPointHandle, _refreshRouteOptionsHandle, _callbackHandle);
    sdkRoutingRoutehandleReleaseFfiHandle(_routeHandleHandle);
    sdkRoutingWaypointReleaseFfiHandle(_startingPointHandle);
    sdkRoutingRefreshrouteoptionsReleaseFfiHandle(_refreshRouteOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle importRouteFromHandle(RouteHandle routeHandle, RefreshRouteOptions refreshRouteOptions, CalculateRouteCallback callback) {
    final _importRouteFromHandleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingEngine_importRoute__RouteHandle_RefreshRouteOptions_CalculateRouteCallback'));
    final _routeHandleHandle = sdkRoutingRoutehandleToFfi(routeHandle);
    final _refreshRouteOptionsHandle = sdkRoutingRefreshrouteoptionsToFfi(refreshRouteOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _importRouteFromHandleFfi(_handle, __lib.LibraryContext.isolateId, _routeHandleHandle, _refreshRouteOptionsHandle, _callbackHandle);
    sdkRoutingRoutehandleReleaseFfiHandle(_routeHandleHandle);
    sdkRoutingRefreshrouteoptionsReleaseFfiHandle(_refreshRouteOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle importCarRoute(List<location_impl.Location> locations, CarOptions carOptions, CalculateRouteCallback callback) {
    final _importCarRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingEngine_importRoute__ListOf_sdk_core_Location_CarOptions_CalculateRouteCallback'));
    final _locationsHandle = heresdkRoutingBindingslistofSdkCoreLocationToFfi(locations);
    final _carOptionsHandle = sdkRoutingCaroptionsToFfi(carOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _importCarRouteFfi(_handle, __lib.LibraryContext.isolateId, _locationsHandle, _carOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkCoreLocationReleaseFfiHandle(_locationsHandle);
    sdkRoutingCaroptionsReleaseFfiHandle(_carOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle importPedestrianRoute(List<location_impl.Location> locations, PedestrianOptions pedestrianOptions, CalculateRouteCallback callback) {
    final _importPedestrianRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingEngine_importRoute__ListOf_sdk_core_Location_PedestrianOptions_CalculateRouteCallback'));
    final _locationsHandle = heresdkRoutingBindingslistofSdkCoreLocationToFfi(locations);
    final _pedestrianOptionsHandle = sdkRoutingPedestrianoptionsToFfi(pedestrianOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _importPedestrianRouteFfi(_handle, __lib.LibraryContext.isolateId, _locationsHandle, _pedestrianOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkCoreLocationReleaseFfiHandle(_locationsHandle);
    sdkRoutingPedestrianoptionsReleaseFfiHandle(_pedestrianOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle importBicycleRoute(List<location_impl.Location> locations, BicycleOptions bicycleOptions, CalculateRouteCallback callback) {
    final _importBicycleRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingEngine_importRoute__ListOf_sdk_core_Location_BicycleOptions_CalculateRouteCallback'));
    final _locationsHandle = heresdkRoutingBindingslistofSdkCoreLocationToFfi(locations);
    final _bicycleOptionsHandle = sdkRoutingBicycleoptionsToFfi(bicycleOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _importBicycleRouteFfi(_handle, __lib.LibraryContext.isolateId, _locationsHandle, _bicycleOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkCoreLocationReleaseFfiHandle(_locationsHandle);
    sdkRoutingBicycleoptionsReleaseFfiHandle(_bicycleOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle importTruckRoute(List<location_impl.Location> locations, TruckOptions truckOptions, CalculateRouteCallback callback) {
    final _importTruckRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingEngine_importRoute__ListOf_sdk_core_Location_TruckOptions_CalculateRouteCallback'));
    final _locationsHandle = heresdkRoutingBindingslistofSdkCoreLocationToFfi(locations);
    final _truckOptionsHandle = sdkRoutingTruckoptionsToFfi(truckOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _importTruckRouteFfi(_handle, __lib.LibraryContext.isolateId, _locationsHandle, _truckOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkCoreLocationReleaseFfiHandle(_locationsHandle);
    sdkRoutingTruckoptionsReleaseFfiHandle(_truckOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle importScooterRoute(List<location_impl.Location> locations, ScooterOptions scooterOptions, CalculateRouteCallback callback) {
    final _importScooterRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingEngine_importRoute__ListOf_sdk_core_Location_ScooterOptions_CalculateRouteCallback'));
    final _locationsHandle = heresdkRoutingBindingslistofSdkCoreLocationToFfi(locations);
    final _scooterOptionsHandle = sdkRoutingScooteroptionsToFfi(scooterOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _importScooterRouteFfi(_handle, __lib.LibraryContext.isolateId, _locationsHandle, _scooterOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkCoreLocationReleaseFfiHandle(_locationsHandle);
    sdkRoutingScooteroptionsReleaseFfiHandle(_scooterOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle importTaxiRoute(List<location_impl.Location> locations, TaxiOptions taxiOptions, CalculateRouteCallback callback) {
    final _importTaxiRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingEngine_importRoute__ListOf_sdk_core_Location_TaxiOptions_CalculateRouteCallback'));
    final _locationsHandle = heresdkRoutingBindingslistofSdkCoreLocationToFfi(locations);
    final _taxiOptionsHandle = sdkRoutingTaxioptionsToFfi(taxiOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _importTaxiRouteFfi(_handle, __lib.LibraryContext.isolateId, _locationsHandle, _taxiOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkCoreLocationReleaseFfiHandle(_locationsHandle);
    sdkRoutingTaxioptionsReleaseFfiHandle(_taxiOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle importEVCarRoute(List<location_impl.Location> locations, EVCarOptions evCarOptions, CalculateRouteCallback callback) {
    final _importEVCarRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingEngine_importRoute__ListOf_sdk_core_Location_EVCarOptions_CalculateRouteCallback'));
    final _locationsHandle = heresdkRoutingBindingslistofSdkCoreLocationToFfi(locations);
    final _evCarOptionsHandle = sdkRoutingEvcaroptionsToFfi(evCarOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _importEVCarRouteFfi(_handle, __lib.LibraryContext.isolateId, _locationsHandle, _evCarOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkCoreLocationReleaseFfiHandle(_locationsHandle);
    sdkRoutingEvcaroptionsReleaseFfiHandle(_evCarOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle importEVTruckRoute(List<location_impl.Location> locations, EVTruckOptions evTruckOptions, CalculateRouteCallback callback) {
    final _importEVTruckRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingEngine_importRoute__ListOf_sdk_core_Location_EVTruckOptions_CalculateRouteCallback'));
    final _locationsHandle = heresdkRoutingBindingslistofSdkCoreLocationToFfi(locations);
    final _evTruckOptionsHandle = sdkRoutingEvtruckoptionsToFfi(evTruckOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _importEVTruckRouteFfi(_handle, __lib.LibraryContext.isolateId, _locationsHandle, _evTruckOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkCoreLocationReleaseFfiHandle(_locationsHandle);
    sdkRoutingEvtruckoptionsReleaseFfiHandle(_evTruckOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateCarRoute(List<Waypoint> waypoints, CarOptions carOptions, CalculateRouteCallback callback) {
    final _calculateCarRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_CarOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _carOptionsHandle = sdkRoutingCaroptionsToFfi(carOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateCarRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _carOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingCaroptionsReleaseFfiHandle(_carOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculatePedestrianRoute(List<Waypoint> waypoints, PedestrianOptions pedestrianOptions, CalculateRouteCallback callback) {
    final _calculatePedestrianRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_PedestrianOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _pedestrianOptionsHandle = sdkRoutingPedestrianoptionsToFfi(pedestrianOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculatePedestrianRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _pedestrianOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingPedestrianoptionsReleaseFfiHandle(_pedestrianOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateTruckRoute(List<Waypoint> waypoints, TruckOptions truckOptions, CalculateRouteCallback callback) {
    final _calculateTruckRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_TruckOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _truckOptionsHandle = sdkRoutingTruckoptionsToFfi(truckOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateTruckRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _truckOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingTruckoptionsReleaseFfiHandle(_truckOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateScooterRoute(List<Waypoint> waypoints, ScooterOptions scooterOptions, CalculateRouteCallback callback) {
    final _calculateScooterRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_ScooterOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _scooterOptionsHandle = sdkRoutingScooteroptionsToFfi(scooterOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateScooterRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _scooterOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingScooteroptionsReleaseFfiHandle(_scooterOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateBicycleRoute(List<Waypoint> waypoints, BicycleOptions bicycleOptions, CalculateRouteCallback callback) {
    final _calculateBicycleRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_BicycleOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _bicycleOptionsHandle = sdkRoutingBicycleoptionsToFfi(bicycleOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateBicycleRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _bicycleOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingBicycleoptionsReleaseFfiHandle(_bicycleOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateTaxiRoute(List<Waypoint> waypoints, TaxiOptions taxiOptions, CalculateRouteCallback callback) {
    final _calculateTaxiRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_TaxiOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _taxiOptionsHandle = sdkRoutingTaxioptionsToFfi(taxiOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateTaxiRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _taxiOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingTaxioptionsReleaseFfiHandle(_taxiOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateEVCarRoute(List<Waypoint> waypoints, EVCarOptions evCarOptions, CalculateRouteCallback callback) {
    final _calculateEVCarRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_EVCarOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _evCarOptionsHandle = sdkRoutingEvcaroptionsToFfi(evCarOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateEVCarRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _evCarOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingEvcaroptionsReleaseFfiHandle(_evCarOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateEVTruckRoute(List<Waypoint> waypoints, EVTruckOptions evTruckOptions, CalculateRouteCallback callback) {
    final _calculateEVTruckRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_EVTruckOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _evTruckOptionsHandle = sdkRoutingEvtruckoptionsToFfi(evTruckOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateEVTruckRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _evTruckOptionsHandle, _callbackHandle);
    heresdkRoutingBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingEvtruckoptionsReleaseFfiHandle(_evTruckOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle returnToRoute(Route route, Waypoint startingPoint, double routeFractionTraveled, CalculateRouteCallback callback) {
    final _returnToRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Double, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_returnToRoute__Route_Waypoint_Double_CalculateRouteCallback'));
    final _routeHandle = sdkRoutingRouteToFfi(route);
    final _startingPointHandle = sdkRoutingWaypointToFfi(startingPoint);
    final _routeFractionTraveledHandle = (routeFractionTraveled);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _returnToRouteFfi(_handle, __lib.LibraryContext.isolateId, _routeHandle, _startingPointHandle, _routeFractionTraveledHandle, _callbackHandle);
    sdkRoutingRouteReleaseFfiHandle(_routeHandle);
    sdkRoutingWaypointReleaseFfiHandle(_startingPointHandle);

    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkRoutingRoutingengineToFfi(RoutingEngine value) =>
  _sdkRoutingRoutingengineCopyHandle((value as __lib.NativeBase).handle);

RoutingEngine sdkRoutingRoutingengineFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is RoutingEngine) return instance;

  final _typeIdHandle = _sdkRoutingRoutingengineGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkRoutingRoutingengineCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : RoutingEngine$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkRoutingRoutingengineRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkRoutingRoutingengineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingRoutingengineReleaseHandle(handle);

Pointer<Void> sdkRoutingRoutingengineToFfiNullable(RoutingEngine? value) =>
  value != null ? sdkRoutingRoutingengineToFfi(value) : Pointer<Void>.fromAddress(0);

RoutingEngine? sdkRoutingRoutingengineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingRoutingengineFromFfi(handle) : null;

void sdkRoutingRoutingengineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRoutingengineReleaseHandle(handle);

// End of RoutingEngine "private" section.

