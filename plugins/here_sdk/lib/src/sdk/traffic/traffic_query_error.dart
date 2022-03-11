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

/// Represents various errors that could occur from a traffic queries.
enum TrafficQueryError {
    /// Failed to retrieve result since the server has returned an error or invalid result.
    failedToRetrieveResult,
    /// Incident query operation is not authenticated. Check your credentials.
    authenticationFailed,
    /// Server unreachable.
    serverUnreachable,
    /// The request timed out.
    timedOut,
    /// The device has no internet connection.
    offline,
    /// Network request error.
    httpError,
    /// Invalid geometry: bounding box, circle, or corridor.
    invalidGeometry,
    /// Invalid incident id.
    invalidIncidentId,
    /// One or several filter options are invalid.
    invalidFilterOptions,
    /// Operation cancelled.
    operationCancelled
}

// TrafficQueryError "private" section, not exported.

int sdkTrafficTrafficqueryerrorToFfi(TrafficQueryError value) {
  switch (value) {
  case TrafficQueryError.failedToRetrieveResult:
    return 0;
  case TrafficQueryError.authenticationFailed:
    return 1;
  case TrafficQueryError.serverUnreachable:
    return 2;
  case TrafficQueryError.timedOut:
    return 3;
  case TrafficQueryError.offline:
    return 4;
  case TrafficQueryError.httpError:
    return 5;
  case TrafficQueryError.invalidGeometry:
    return 6;
  case TrafficQueryError.invalidIncidentId:
    return 7;
  case TrafficQueryError.invalidFilterOptions:
    return 8;
  case TrafficQueryError.operationCancelled:
    return 9;
  default:
    throw StateError("Invalid enum value $value for TrafficQueryError enum.");
  }
}

TrafficQueryError sdkTrafficTrafficqueryerrorFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TrafficQueryError.failedToRetrieveResult;
  case 1:
    return TrafficQueryError.authenticationFailed;
  case 2:
    return TrafficQueryError.serverUnreachable;
  case 3:
    return TrafficQueryError.timedOut;
  case 4:
    return TrafficQueryError.offline;
  case 5:
    return TrafficQueryError.httpError;
  case 6:
    return TrafficQueryError.invalidGeometry;
  case 7:
    return TrafficQueryError.invalidIncidentId;
  case 8:
    return TrafficQueryError.invalidFilterOptions;
  case 9:
    return TrafficQueryError.operationCancelled;
  default:
    throw StateError("Invalid numeric value $handle for TrafficQueryError enum.");
  }
}

void sdkTrafficTrafficqueryerrorReleaseFfiHandle(int handle) {}

final _sdkTrafficTrafficqueryerrorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_traffic_TrafficQueryError_create_handle_nullable'));
final _sdkTrafficTrafficqueryerrorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficQueryError_release_handle_nullable'));
final _sdkTrafficTrafficqueryerrorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficQueryError_get_value_nullable'));

Pointer<Void> sdkTrafficTrafficqueryerrorToFfiNullable(TrafficQueryError? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficTrafficqueryerrorToFfi(value);
  final result = _sdkTrafficTrafficqueryerrorCreateHandleNullable(_handle);
  sdkTrafficTrafficqueryerrorReleaseFfiHandle(_handle);
  return result;
}

TrafficQueryError? sdkTrafficTrafficqueryerrorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficTrafficqueryerrorGetValueNullable(handle);
  final result = sdkTrafficTrafficqueryerrorFromFfi(_handle);
  sdkTrafficTrafficqueryerrorReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficTrafficqueryerrorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficqueryerrorReleaseHandleNullable(handle);

// End of TrafficQueryError "private" section.

