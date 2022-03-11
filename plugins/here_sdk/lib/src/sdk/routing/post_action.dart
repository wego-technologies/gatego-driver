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
import 'package:here_sdk/src/sdk/routing/post_action_type.dart';

/// An action that must be done after arrival, i.e.
///
/// completing a section in the route.

class PostAction {
  /// Type of this action.
  /// Defaults to [PostActionType.chargingSetup].
  PostActionType action;

  /// Estimated duration of this action in seconds.
  /// Defaults to 0.
  @Deprecated("Will be removed in v4.13.0. Use [PostAction.duration] instead.")
  int durationInSeconds;

  /// Estimated duration of this action.
  /// Defaults to 0 seconds.
  Duration duration;

  PostAction._(this.action, this.durationInSeconds, this.duration);
  @Deprecated("Will be removed in v4.13.0. Please use PostAction.withDefaults() instead.")
  PostAction(this.action, this.durationInSeconds)
      : duration = const Duration(seconds: 0);
  PostAction.withDefaults()
      : action = PostActionType.chargingSetup, durationInSeconds = 0, duration = const Duration(seconds: 0);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PostAction) return false;
    PostAction _other = other;
    return action == _other.action &&
        durationInSeconds == _other.durationInSeconds &&
        duration == _other.duration;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + action.hashCode;
    result = 31 * result + durationInSeconds.hashCode;
    result = 31 * result + duration.hashCode;
    return result;
  }
}


// PostAction "private" section, not exported.

final _sdkRoutingPostactionCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Int32, Uint64),
    Pointer<Void> Function(int, int, int)
  >('here_sdk_sdk_routing_PostAction_create_handle'));
final _sdkRoutingPostactionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PostAction_release_handle'));
final _sdkRoutingPostactionGetFieldaction = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PostAction_get_field_action'));
final _sdkRoutingPostactionGetFielddurationInSeconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PostAction_get_field_durationInSeconds'));
final _sdkRoutingPostactionGetFieldduration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PostAction_get_field_duration'));



Pointer<Void> sdkRoutingPostactionToFfi(PostAction value) {
  final _actionHandle = sdkRoutingPostactiontypeToFfi(value.action);
  final _durationInSecondsHandle = (value.durationInSeconds);
  final _durationHandle = durationToFfi(value.duration);
  final _result = _sdkRoutingPostactionCreateHandle(_actionHandle, _durationInSecondsHandle, _durationHandle);
  sdkRoutingPostactiontypeReleaseFfiHandle(_actionHandle);
  
  durationReleaseFfiHandle(_durationHandle);
  return _result;
}

PostAction sdkRoutingPostactionFromFfi(Pointer<Void> handle) {
  final _actionHandle = _sdkRoutingPostactionGetFieldaction(handle);
  final _durationInSecondsHandle = _sdkRoutingPostactionGetFielddurationInSeconds(handle);
  final _durationHandle = _sdkRoutingPostactionGetFieldduration(handle);
  try {
    return PostAction._(
      sdkRoutingPostactiontypeFromFfi(_actionHandle), 
      (_durationInSecondsHandle), 
      durationFromFfi(_durationHandle)
    );
  } finally {
    sdkRoutingPostactiontypeReleaseFfiHandle(_actionHandle);
    
    durationReleaseFfiHandle(_durationHandle);
  }
}

void sdkRoutingPostactionReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingPostactionReleaseHandle(handle);

// Nullable PostAction

final _sdkRoutingPostactionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PostAction_create_handle_nullable'));
final _sdkRoutingPostactionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PostAction_release_handle_nullable'));
final _sdkRoutingPostactionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PostAction_get_value_nullable'));

Pointer<Void> sdkRoutingPostactionToFfiNullable(PostAction? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingPostactionToFfi(value);
  final result = _sdkRoutingPostactionCreateHandleNullable(_handle);
  sdkRoutingPostactionReleaseFfiHandle(_handle);
  return result;
}

PostAction? sdkRoutingPostactionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingPostactionGetValueNullable(handle);
  final result = sdkRoutingPostactionFromFfi(_handle);
  sdkRoutingPostactionReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingPostactionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingPostactionReleaseHandleNullable(handle);

// End of PostAction "private" section.

