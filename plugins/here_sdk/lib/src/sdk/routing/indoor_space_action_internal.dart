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

class IndoorSpaceActionInternal {
  /// @nodoc
  @internal
  String internaldisplayName;

  /// @nodoc
  @internal
  String internalspaceId;

  IndoorSpaceActionInternal(this.internaldisplayName, this.internalspaceId);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! IndoorSpaceActionInternal) return false;
    IndoorSpaceActionInternal _other = other;
    return internaldisplayName == _other.internaldisplayName &&
        internalspaceId == _other.internalspaceId;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internaldisplayName.hashCode;
    result = 31 * result + internalspaceId.hashCode;
    return result;
  }
}


// IndoorSpaceActionInternal "private" section, not exported.

final _sdkRoutingIndoorspaceactioninternalCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorSpaceActionInternal_create_handle'));
final _sdkRoutingIndoorspaceactioninternalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorSpaceActionInternal_release_handle'));
final _sdkRoutingIndoorspaceactioninternalGetFielddisplayName = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorSpaceActionInternal_get_field_displayName'));
final _sdkRoutingIndoorspaceactioninternalGetFieldspaceId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorSpaceActionInternal_get_field_spaceId'));



Pointer<Void> sdkRoutingIndoorspaceactioninternalToFfi(IndoorSpaceActionInternal value) {
  final _displayNameHandle = stringToFfi(value.internaldisplayName);
  final _spaceIdHandle = stringToFfi(value.internalspaceId);
  final _result = _sdkRoutingIndoorspaceactioninternalCreateHandle(_displayNameHandle, _spaceIdHandle);
  stringReleaseFfiHandle(_displayNameHandle);
  stringReleaseFfiHandle(_spaceIdHandle);
  return _result;
}

IndoorSpaceActionInternal sdkRoutingIndoorspaceactioninternalFromFfi(Pointer<Void> handle) {
  final _displayNameHandle = _sdkRoutingIndoorspaceactioninternalGetFielddisplayName(handle);
  final _spaceIdHandle = _sdkRoutingIndoorspaceactioninternalGetFieldspaceId(handle);
  try {
    return IndoorSpaceActionInternal(
      stringFromFfi(_displayNameHandle), 
      stringFromFfi(_spaceIdHandle)
    );
  } finally {
    stringReleaseFfiHandle(_displayNameHandle);
    stringReleaseFfiHandle(_spaceIdHandle);
  }
}

void sdkRoutingIndoorspaceactioninternalReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingIndoorspaceactioninternalReleaseHandle(handle);

// Nullable IndoorSpaceActionInternal

final _sdkRoutingIndoorspaceactioninternalCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorSpaceActionInternal_create_handle_nullable'));
final _sdkRoutingIndoorspaceactioninternalReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorSpaceActionInternal_release_handle_nullable'));
final _sdkRoutingIndoorspaceactioninternalGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorSpaceActionInternal_get_value_nullable'));

Pointer<Void> sdkRoutingIndoorspaceactioninternalToFfiNullable(IndoorSpaceActionInternal? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingIndoorspaceactioninternalToFfi(value);
  final result = _sdkRoutingIndoorspaceactioninternalCreateHandleNullable(_handle);
  sdkRoutingIndoorspaceactioninternalReleaseFfiHandle(_handle);
  return result;
}

IndoorSpaceActionInternal? sdkRoutingIndoorspaceactioninternalFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingIndoorspaceactioninternalGetValueNullable(handle);
  final result = sdkRoutingIndoorspaceactioninternalFromFfi(_handle);
  sdkRoutingIndoorspaceactioninternalReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingIndoorspaceactioninternalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingIndoorspaceactioninternalReleaseHandleNullable(handle);

// End of IndoorSpaceActionInternal "private" section.

