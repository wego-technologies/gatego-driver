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
import 'package:here_sdk/src/sdk/routing/indoor_level_change_action_internal.dart';
import 'package:here_sdk/src/sdk/routing/indoor_location_data_internal.dart';
import 'package:here_sdk/src/sdk/routing/indoor_space_action_internal.dart';
import 'package:meta/meta.dart';

/// @nodoc
@internal
abstract class IndoorManeuverInternal {

  /// @nodoc
  @internal
  IndoorLocationDataInternal get internalindoorLocation;

  /// @nodoc
  @internal
  IndoorLevelChangeActionInternal? get internallevelChangeAction;

  /// @nodoc
  @internal
  IndoorSpaceActionInternal? get internalleaveAction;

  /// @nodoc
  @internal
  IndoorSpaceActionInternal? get internalenterAction;

}


// IndoorManeuverInternal "private" section, not exported.

final _sdkRoutingIndoormaneuverinternalRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_routing_IndoorManeuverInternal_register_finalizer'));
final _sdkRoutingIndoormaneuverinternalCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorManeuverInternal_copy_handle'));
final _sdkRoutingIndoormaneuverinternalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorManeuverInternal_release_handle'));


class IndoorManeuverInternal$Impl extends __lib.NativeBase implements IndoorManeuverInternal {

  IndoorManeuverInternal$Impl(Pointer<Void> handle) : super(handle);

  @internal
  @override
  IndoorLocationDataInternal get internalindoorLocation {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorManeuverInternal_indoorLocation_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingIndoorlocationdatainternalFromFfi(__resultHandle);
    } finally {
      sdkRoutingIndoorlocationdatainternalReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  IndoorLevelChangeActionInternal? get internallevelChangeAction {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorManeuverInternal_levelChangeAction_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingIndoorlevelchangeactioninternalFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingIndoorlevelchangeactioninternalReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @internal
  @override
  IndoorSpaceActionInternal? get internalleaveAction {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorManeuverInternal_leaveAction_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingIndoorspaceactioninternalFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingIndoorspaceactioninternalReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @internal
  @override
  IndoorSpaceActionInternal? get internalenterAction {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorManeuverInternal_enterAction_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingIndoorspaceactioninternalFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingIndoorspaceactioninternalReleaseFfiHandleNullable(__resultHandle);

    }

  }



}

Pointer<Void> sdkRoutingIndoormaneuverinternalToFfi(IndoorManeuverInternal value) =>
  _sdkRoutingIndoormaneuverinternalCopyHandle((value as __lib.NativeBase).handle);

IndoorManeuverInternal sdkRoutingIndoormaneuverinternalFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is IndoorManeuverInternal) return instance;

  final _copiedHandle = _sdkRoutingIndoormaneuverinternalCopyHandle(handle);
  final result = IndoorManeuverInternal$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkRoutingIndoormaneuverinternalRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkRoutingIndoormaneuverinternalReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingIndoormaneuverinternalReleaseHandle(handle);

Pointer<Void> sdkRoutingIndoormaneuverinternalToFfiNullable(IndoorManeuverInternal? value) =>
  value != null ? sdkRoutingIndoormaneuverinternalToFfi(value) : Pointer<Void>.fromAddress(0);

IndoorManeuverInternal? sdkRoutingIndoormaneuverinternalFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingIndoormaneuverinternalFromFfi(handle) : null;

void sdkRoutingIndoormaneuverinternalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingIndoormaneuverinternalReleaseHandle(handle);

// End of IndoorManeuverInternal "private" section.

