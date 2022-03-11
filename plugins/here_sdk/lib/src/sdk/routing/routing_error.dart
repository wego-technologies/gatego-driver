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

/// Specifies possible errors that may result from the calculation of a route.
enum RoutingError {
    /// Generic internal error.
    internalError,
    /// An invalid input parameter.
    invalidParameter,
    /// Routing server is unreachable.
    serverUnreachable,
    /// A general network request error.
    httpError,
    /// Routing operation is not authenticated. Check your credentials.
    authenticationFailed,
    /// The provided credentials don't give access to the requested resource.
    forbidden,
    /// Credentials exceeded the allowed requests limit.
    exceededUsageLimit,
    /// Error while parsing route data.
    parsingError,
    /// No route can be calculated for the given input.
    noRouteFound,
    /// The request timed out.
    timedOut,
    /// The device has no internet connection.
    offline,
    /// No isoline can be calculated for the given input.
    noIsolineFound,
    /// The route has no [Route.routeHandle], but it was used for a feature that requires one.
    /// Consider to recalculate the route with a route handle. See [RouteOptions.enableRouteHandle].
    noRouteHandle,
    /// Operation cancelled.
    operationCancelled
}

// RoutingError "private" section, not exported.

int sdkRoutingRoutingerrorToFfi(RoutingError value) {
  switch (value) {
  case RoutingError.internalError:
    return 1;
  case RoutingError.invalidParameter:
    return 2;
  case RoutingError.serverUnreachable:
    return 3;
  case RoutingError.httpError:
    return 4;
  case RoutingError.authenticationFailed:
    return 5;
  case RoutingError.forbidden:
    return 6;
  case RoutingError.exceededUsageLimit:
    return 7;
  case RoutingError.parsingError:
    return 8;
  case RoutingError.noRouteFound:
    return 9;
  case RoutingError.timedOut:
    return 10;
  case RoutingError.offline:
    return 11;
  case RoutingError.noIsolineFound:
    return 12;
  case RoutingError.noRouteHandle:
    return 13;
  case RoutingError.operationCancelled:
    return 14;
  default:
    throw StateError("Invalid enum value $value for RoutingError enum.");
  }
}

RoutingError sdkRoutingRoutingerrorFromFfi(int handle) {
  switch (handle) {
  case 1:
    return RoutingError.internalError;
  case 2:
    return RoutingError.invalidParameter;
  case 3:
    return RoutingError.serverUnreachable;
  case 4:
    return RoutingError.httpError;
  case 5:
    return RoutingError.authenticationFailed;
  case 6:
    return RoutingError.forbidden;
  case 7:
    return RoutingError.exceededUsageLimit;
  case 8:
    return RoutingError.parsingError;
  case 9:
    return RoutingError.noRouteFound;
  case 10:
    return RoutingError.timedOut;
  case 11:
    return RoutingError.offline;
  case 12:
    return RoutingError.noIsolineFound;
  case 13:
    return RoutingError.noRouteHandle;
  case 14:
    return RoutingError.operationCancelled;
  default:
    throw StateError("Invalid numeric value $handle for RoutingError enum.");
  }
}

void sdkRoutingRoutingerrorReleaseFfiHandle(int handle) {}

final _sdkRoutingRoutingerrorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_RoutingError_create_handle_nullable'));
final _sdkRoutingRoutingerrorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingError_release_handle_nullable'));
final _sdkRoutingRoutingerrorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingError_get_value_nullable'));

Pointer<Void> sdkRoutingRoutingerrorToFfiNullable(RoutingError? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingRoutingerrorToFfi(value);
  final result = _sdkRoutingRoutingerrorCreateHandleNullable(_handle);
  sdkRoutingRoutingerrorReleaseFfiHandle(_handle);
  return result;
}

RoutingError? sdkRoutingRoutingerrorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingRoutingerrorGetValueNullable(handle);
  final result = sdkRoutingRoutingerrorFromFfi(_handle);
  sdkRoutingRoutingerrorReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingRoutingerrorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRoutingerrorReleaseHandleNullable(handle);

// End of RoutingError "private" section.

