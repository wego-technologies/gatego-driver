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
import 'package:here_sdk/src/sdk/search/ev_charging_attributes_experimental.dart';
import 'package:meta/meta.dart';

/// @nodoc
@internal

class ExtendedAttributeExperimental {
  /// EV charging pool information
  /// @nodoc
  @internal
  EvChargingAttributesExperimental? internalevStation;

  ExtendedAttributeExperimental(this.internalevStation);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ExtendedAttributeExperimental) return false;
    ExtendedAttributeExperimental _other = other;
    return internalevStation == _other.internalevStation;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalevStation.hashCode;
    return result;
  }
}


// ExtendedAttributeExperimental "private" section, not exported.

final _sdkSearchExtendedattributeexperimentalCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ExtendedAttributeExperimental_create_handle'));
final _sdkSearchExtendedattributeexperimentalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_ExtendedAttributeExperimental_release_handle'));
final _sdkSearchExtendedattributeexperimentalGetFieldevStation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ExtendedAttributeExperimental_get_field_evStation'));



Pointer<Void> sdkSearchExtendedattributeexperimentalToFfi(ExtendedAttributeExperimental value) {
  final _evStationHandle = sdkSearchEvchargingattributesexperimentalToFfiNullable(value.internalevStation);
  final _result = _sdkSearchExtendedattributeexperimentalCreateHandle(_evStationHandle);
  sdkSearchEvchargingattributesexperimentalReleaseFfiHandleNullable(_evStationHandle);
  return _result;
}

ExtendedAttributeExperimental sdkSearchExtendedattributeexperimentalFromFfi(Pointer<Void> handle) {
  final _evStationHandle = _sdkSearchExtendedattributeexperimentalGetFieldevStation(handle);
  try {
    return ExtendedAttributeExperimental(
      sdkSearchEvchargingattributesexperimentalFromFfiNullable(_evStationHandle)
    );
  } finally {
    sdkSearchEvchargingattributesexperimentalReleaseFfiHandleNullable(_evStationHandle);
  }
}

void sdkSearchExtendedattributeexperimentalReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchExtendedattributeexperimentalReleaseHandle(handle);

// Nullable ExtendedAttributeExperimental

final _sdkSearchExtendedattributeexperimentalCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ExtendedAttributeExperimental_create_handle_nullable'));
final _sdkSearchExtendedattributeexperimentalReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_ExtendedAttributeExperimental_release_handle_nullable'));
final _sdkSearchExtendedattributeexperimentalGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ExtendedAttributeExperimental_get_value_nullable'));

Pointer<Void> sdkSearchExtendedattributeexperimentalToFfiNullable(ExtendedAttributeExperimental? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchExtendedattributeexperimentalToFfi(value);
  final result = _sdkSearchExtendedattributeexperimentalCreateHandleNullable(_handle);
  sdkSearchExtendedattributeexperimentalReleaseFfiHandle(_handle);
  return result;
}

ExtendedAttributeExperimental? sdkSearchExtendedattributeexperimentalFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchExtendedattributeexperimentalGetValueNullable(handle);
  final result = sdkSearchExtendedattributeexperimentalFromFfi(_handle);
  sdkSearchExtendedattributeexperimentalReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchExtendedattributeexperimentalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchExtendedattributeexperimentalReleaseHandleNullable(handle);

// End of ExtendedAttributeExperimental "private" section.

