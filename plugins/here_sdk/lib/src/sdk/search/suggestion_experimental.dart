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
import 'package:meta/meta.dart';

/// @nodoc
@internal

class SuggestionExperimental {
  /// @nodoc
  @internal
  int internaldummy;

  SuggestionExperimental(this.internaldummy);
  SuggestionExperimental.withDefaults()
    : internaldummy = 0;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SuggestionExperimental) return false;
    SuggestionExperimental _other = other;
    return internaldummy == _other.internaldummy;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internaldummy.hashCode;
    return result;
  }
}


// SuggestionExperimental "private" section, not exported.

final _sdkSearchSuggestionexperimentalCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_SuggestionExperimental_create_handle'));
final _sdkSearchSuggestionexperimentalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestionExperimental_release_handle'));
final _sdkSearchSuggestionexperimentalGetFielddummy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestionExperimental_get_field_dummy'));



Pointer<Void> sdkSearchSuggestionexperimentalToFfi(SuggestionExperimental value) {
  final _dummyHandle = (value.internaldummy);
  final _result = _sdkSearchSuggestionexperimentalCreateHandle(_dummyHandle);
  
  return _result;
}

SuggestionExperimental sdkSearchSuggestionexperimentalFromFfi(Pointer<Void> handle) {
  final _dummyHandle = _sdkSearchSuggestionexperimentalGetFielddummy(handle);
  try {
    return SuggestionExperimental(
      (_dummyHandle)
    );
  } finally {
    
  }
}

void sdkSearchSuggestionexperimentalReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchSuggestionexperimentalReleaseHandle(handle);

// Nullable SuggestionExperimental

final _sdkSearchSuggestionexperimentalCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestionExperimental_create_handle_nullable'));
final _sdkSearchSuggestionexperimentalReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestionExperimental_release_handle_nullable'));
final _sdkSearchSuggestionexperimentalGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestionExperimental_get_value_nullable'));

Pointer<Void> sdkSearchSuggestionexperimentalToFfiNullable(SuggestionExperimental? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchSuggestionexperimentalToFfi(value);
  final result = _sdkSearchSuggestionexperimentalCreateHandleNullable(_handle);
  sdkSearchSuggestionexperimentalReleaseFfiHandle(_handle);
  return result;
}

SuggestionExperimental? sdkSearchSuggestionexperimentalFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchSuggestionexperimentalGetValueNullable(handle);
  final result = sdkSearchSuggestionexperimentalFromFfi(_handle);
  sdkSearchSuggestionexperimentalReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchSuggestionexperimentalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchSuggestionexperimentalReleaseHandleNullable(handle);

// End of SuggestionExperimental "private" section.

