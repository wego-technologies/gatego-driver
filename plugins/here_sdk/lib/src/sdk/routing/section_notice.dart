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
import 'package:here_sdk/src/sdk/routing/notice_severity.dart';
import 'package:here_sdk/src/sdk/routing/section_notice_code.dart';

/// Explains an issue encountered in a [Section].

class SectionNotice {
  /// The notice code.
  SectionNoticeCode code;

  /// The notice severity.
  NoticeSeverity severity;

  SectionNotice(this.code, this.severity);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SectionNotice) return false;
    SectionNotice _other = other;
    return code == _other.code &&
        severity == _other.severity;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + code.hashCode;
    result = 31 * result + severity.hashCode;
    return result;
  }
}


// SectionNotice "private" section, not exported.

final _sdkRoutingSectionnoticeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Uint32),
    Pointer<Void> Function(int, int)
  >('here_sdk_sdk_routing_SectionNotice_create_handle'));
final _sdkRoutingSectionnoticeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNotice_release_handle'));
final _sdkRoutingSectionnoticeGetFieldcode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNotice_get_field_code'));
final _sdkRoutingSectionnoticeGetFieldseverity = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNotice_get_field_severity'));



Pointer<Void> sdkRoutingSectionnoticeToFfi(SectionNotice value) {
  final _codeHandle = sdkRoutingSectionnoticecodeToFfi(value.code);
  final _severityHandle = sdkRoutingNoticeseverityToFfi(value.severity);
  final _result = _sdkRoutingSectionnoticeCreateHandle(_codeHandle, _severityHandle);
  sdkRoutingSectionnoticecodeReleaseFfiHandle(_codeHandle);
  sdkRoutingNoticeseverityReleaseFfiHandle(_severityHandle);
  return _result;
}

SectionNotice sdkRoutingSectionnoticeFromFfi(Pointer<Void> handle) {
  final _codeHandle = _sdkRoutingSectionnoticeGetFieldcode(handle);
  final _severityHandle = _sdkRoutingSectionnoticeGetFieldseverity(handle);
  try {
    return SectionNotice(
      sdkRoutingSectionnoticecodeFromFfi(_codeHandle), 
      sdkRoutingNoticeseverityFromFfi(_severityHandle)
    );
  } finally {
    sdkRoutingSectionnoticecodeReleaseFfiHandle(_codeHandle);
    sdkRoutingNoticeseverityReleaseFfiHandle(_severityHandle);
  }
}

void sdkRoutingSectionnoticeReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingSectionnoticeReleaseHandle(handle);

// Nullable SectionNotice

final _sdkRoutingSectionnoticeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNotice_create_handle_nullable'));
final _sdkRoutingSectionnoticeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNotice_release_handle_nullable'));
final _sdkRoutingSectionnoticeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNotice_get_value_nullable'));

Pointer<Void> sdkRoutingSectionnoticeToFfiNullable(SectionNotice? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingSectionnoticeToFfi(value);
  final result = _sdkRoutingSectionnoticeCreateHandleNullable(_handle);
  sdkRoutingSectionnoticeReleaseFfiHandle(_handle);
  return result;
}

SectionNotice? sdkRoutingSectionnoticeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingSectionnoticeGetValueNullable(handle);
  final result = sdkRoutingSectionnoticeFromFfi(_handle);
  sdkRoutingSectionnoticeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingSectionnoticeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingSectionnoticeReleaseHandleNullable(handle);

// End of SectionNotice "private" section.

