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
import 'package:here_sdk/src/sdk/search/extended_attribute_experimental.dart';
import 'package:meta/meta.dart';

/// @nodoc
@internal

class PlaceExperimental {
  /// @nodoc
  @internal
  String? internalontologyId;

  /// Extended attributes section to contain detailed information for specific result types.
  /// @nodoc
  @internal
  ExtendedAttributeExperimental? internalextended;

  PlaceExperimental(this.internalontologyId, this.internalextended);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PlaceExperimental) return false;
    PlaceExperimental _other = other;
    return internalontologyId == _other.internalontologyId &&
        internalextended == _other.internalextended;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalontologyId.hashCode;
    result = 31 * result + internalextended.hashCode;
    return result;
  }
}


// PlaceExperimental "private" section, not exported.

final _sdkSearchPlaceexperimentalCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_PlaceExperimental_create_handle'));
final _sdkSearchPlaceexperimentalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceExperimental_release_handle'));
final _sdkSearchPlaceexperimentalGetFieldontologyId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceExperimental_get_field_ontologyId'));
final _sdkSearchPlaceexperimentalGetFieldextended = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceExperimental_get_field_extended'));



Pointer<Void> sdkSearchPlaceexperimentalToFfi(PlaceExperimental value) {
  final _ontologyIdHandle = stringToFfiNullable(value.internalontologyId);
  final _extendedHandle = sdkSearchExtendedattributeexperimentalToFfiNullable(value.internalextended);
  final _result = _sdkSearchPlaceexperimentalCreateHandle(_ontologyIdHandle, _extendedHandle);
  stringReleaseFfiHandleNullable(_ontologyIdHandle);
  sdkSearchExtendedattributeexperimentalReleaseFfiHandleNullable(_extendedHandle);
  return _result;
}

PlaceExperimental sdkSearchPlaceexperimentalFromFfi(Pointer<Void> handle) {
  final _ontologyIdHandle = _sdkSearchPlaceexperimentalGetFieldontologyId(handle);
  final _extendedHandle = _sdkSearchPlaceexperimentalGetFieldextended(handle);
  try {
    return PlaceExperimental(
      stringFromFfiNullable(_ontologyIdHandle), 
      sdkSearchExtendedattributeexperimentalFromFfiNullable(_extendedHandle)
    );
  } finally {
    stringReleaseFfiHandleNullable(_ontologyIdHandle);
    sdkSearchExtendedattributeexperimentalReleaseFfiHandleNullable(_extendedHandle);
  }
}

void sdkSearchPlaceexperimentalReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchPlaceexperimentalReleaseHandle(handle);

// Nullable PlaceExperimental

final _sdkSearchPlaceexperimentalCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceExperimental_create_handle_nullable'));
final _sdkSearchPlaceexperimentalReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceExperimental_release_handle_nullable'));
final _sdkSearchPlaceexperimentalGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceExperimental_get_value_nullable'));

Pointer<Void> sdkSearchPlaceexperimentalToFfiNullable(PlaceExperimental? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchPlaceexperimentalToFfi(value);
  final result = _sdkSearchPlaceexperimentalCreateHandleNullable(_handle);
  sdkSearchPlaceexperimentalReleaseFfiHandle(_handle);
  return result;
}

PlaceExperimental? sdkSearchPlaceexperimentalFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchPlaceexperimentalGetValueNullable(handle);
  final result = sdkSearchPlaceexperimentalFromFfi(_handle);
  sdkSearchPlaceexperimentalReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchPlaceexperimentalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchPlaceexperimentalReleaseHandleNullable(handle);

// End of PlaceExperimental "private" section.

