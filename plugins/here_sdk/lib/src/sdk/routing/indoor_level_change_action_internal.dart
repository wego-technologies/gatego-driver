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
import 'package:meta/meta.dart';

/// @nodoc
@internal

class IndoorLevelChangeActionInternal {
  /// @nodoc
  @internal
  String internalconnector;

  /// @nodoc
  @internal
  int internaldeltaZ;

  IndoorLevelChangeActionInternal(this.internalconnector, this.internaldeltaZ);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! IndoorLevelChangeActionInternal) return false;
    IndoorLevelChangeActionInternal _other = other;
    return internalconnector == _other.internalconnector &&
        internaldeltaZ == _other.internaldeltaZ;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalconnector.hashCode;
    result = 31 * result + internaldeltaZ.hashCode;
    return result;
  }
}


// IndoorLevelChangeActionInternal "private" section, not exported.

final _sdkRoutingIndoorlevelchangeactioninternalCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32),
    Pointer<Void> Function(Pointer<Void>, int)
  >('here_sdk_sdk_routing_IndoorLevelChangeActionInternal_create_handle'));
final _sdkRoutingIndoorlevelchangeactioninternalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelChangeActionInternal_release_handle'));
final _sdkRoutingIndoorlevelchangeactioninternalGetFieldconnector = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelChangeActionInternal_get_field_connector'));
final _sdkRoutingIndoorlevelchangeactioninternalGetFielddeltaZ = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelChangeActionInternal_get_field_deltaZ'));



Pointer<Void> sdkRoutingIndoorlevelchangeactioninternalToFfi(IndoorLevelChangeActionInternal value) {
  final _connectorHandle = stringToFfi(value.internalconnector);
  final _deltaZHandle = (value.internaldeltaZ);
  final _result = _sdkRoutingIndoorlevelchangeactioninternalCreateHandle(_connectorHandle, _deltaZHandle);
  stringReleaseFfiHandle(_connectorHandle);
  
  return _result;
}

IndoorLevelChangeActionInternal sdkRoutingIndoorlevelchangeactioninternalFromFfi(Pointer<Void> handle) {
  final _connectorHandle = _sdkRoutingIndoorlevelchangeactioninternalGetFieldconnector(handle);
  final _deltaZHandle = _sdkRoutingIndoorlevelchangeactioninternalGetFielddeltaZ(handle);
  try {
    return IndoorLevelChangeActionInternal(
      stringFromFfi(_connectorHandle), 
      (_deltaZHandle)
    );
  } finally {
    stringReleaseFfiHandle(_connectorHandle);
    
  }
}

void sdkRoutingIndoorlevelchangeactioninternalReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingIndoorlevelchangeactioninternalReleaseHandle(handle);

// Nullable IndoorLevelChangeActionInternal

final _sdkRoutingIndoorlevelchangeactioninternalCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelChangeActionInternal_create_handle_nullable'));
final _sdkRoutingIndoorlevelchangeactioninternalReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelChangeActionInternal_release_handle_nullable'));
final _sdkRoutingIndoorlevelchangeactioninternalGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelChangeActionInternal_get_value_nullable'));

Pointer<Void> sdkRoutingIndoorlevelchangeactioninternalToFfiNullable(IndoorLevelChangeActionInternal? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingIndoorlevelchangeactioninternalToFfi(value);
  final result = _sdkRoutingIndoorlevelchangeactioninternalCreateHandleNullable(_handle);
  sdkRoutingIndoorlevelchangeactioninternalReleaseFfiHandle(_handle);
  return result;
}

IndoorLevelChangeActionInternal? sdkRoutingIndoorlevelchangeactioninternalFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingIndoorlevelchangeactioninternalGetValueNullable(handle);
  final result = sdkRoutingIndoorlevelchangeactioninternalFromFfi(_handle);
  sdkRoutingIndoorlevelchangeactioninternalReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingIndoorlevelchangeactioninternalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingIndoorlevelchangeactioninternalReleaseHandleNullable(handle);

// End of IndoorLevelChangeActionInternal "private" section.

