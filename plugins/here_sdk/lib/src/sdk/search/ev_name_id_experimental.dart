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

class EvNameIdExperimental {
  /// Any string value
  /// @nodoc
  @internal
  String? internalname;

  /// Unique ID
  /// @nodoc
  @internal
  String? internalid;

  EvNameIdExperimental(this.internalname, this.internalid);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EvNameIdExperimental) return false;
    EvNameIdExperimental _other = other;
    return internalname == _other.internalname &&
        internalid == _other.internalid;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalname.hashCode;
    result = 31 * result + internalid.hashCode;
    return result;
  }
}


// EvNameIdExperimental "private" section, not exported.

final _sdkSearchEvnameidexperimentalCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_EvNameIdExperimental_create_handle'));
final _sdkSearchEvnameidexperimentalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvNameIdExperimental_release_handle'));
final _sdkSearchEvnameidexperimentalGetFieldname = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvNameIdExperimental_get_field_name'));
final _sdkSearchEvnameidexperimentalGetFieldid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvNameIdExperimental_get_field_id'));



Pointer<Void> sdkSearchEvnameidexperimentalToFfi(EvNameIdExperimental value) {
  final _nameHandle = stringToFfiNullable(value.internalname);
  final _idHandle = stringToFfiNullable(value.internalid);
  final _result = _sdkSearchEvnameidexperimentalCreateHandle(_nameHandle, _idHandle);
  stringReleaseFfiHandleNullable(_nameHandle);
  stringReleaseFfiHandleNullable(_idHandle);
  return _result;
}

EvNameIdExperimental sdkSearchEvnameidexperimentalFromFfi(Pointer<Void> handle) {
  final _nameHandle = _sdkSearchEvnameidexperimentalGetFieldname(handle);
  final _idHandle = _sdkSearchEvnameidexperimentalGetFieldid(handle);
  try {
    return EvNameIdExperimental(
      stringFromFfiNullable(_nameHandle), 
      stringFromFfiNullable(_idHandle)
    );
  } finally {
    stringReleaseFfiHandleNullable(_nameHandle);
    stringReleaseFfiHandleNullable(_idHandle);
  }
}

void sdkSearchEvnameidexperimentalReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchEvnameidexperimentalReleaseHandle(handle);

// Nullable EvNameIdExperimental

final _sdkSearchEvnameidexperimentalCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvNameIdExperimental_create_handle_nullable'));
final _sdkSearchEvnameidexperimentalReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvNameIdExperimental_release_handle_nullable'));
final _sdkSearchEvnameidexperimentalGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvNameIdExperimental_get_value_nullable'));

Pointer<Void> sdkSearchEvnameidexperimentalToFfiNullable(EvNameIdExperimental? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchEvnameidexperimentalToFfi(value);
  final result = _sdkSearchEvnameidexperimentalCreateHandleNullable(_handle);
  sdkSearchEvnameidexperimentalReleaseFfiHandle(_handle);
  return result;
}

EvNameIdExperimental? sdkSearchEvnameidexperimentalFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchEvnameidexperimentalGetValueNullable(handle);
  final result = sdkSearchEvnameidexperimentalFromFfi(_handle);
  sdkSearchEvnameidexperimentalReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchEvnameidexperimentalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchEvnameidexperimentalReleaseHandleNullable(handle);

// End of EvNameIdExperimental "private" section.

