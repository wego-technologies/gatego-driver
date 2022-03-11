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
import 'package:here_sdk/src/sdk/core/localized_texts.dart';

/// Textual attributes of road.

class RoadTexts {
  /// Road names in available languages.
  /// Empty for unnamed roads.
  LocalizedTexts names;

  /// Road numbers in available languages.
  /// Empty if the road has no numbers assigned.
  LocalizedTexts numbers;

  /// Toward signpost information in available languages.
  /// Empty if the road has no toward signpost information assigned.
  LocalizedTexts towards;

  RoadTexts(this.names, this.numbers, this.towards);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RoadTexts) return false;
    RoadTexts _other = other;
    return names == _other.names &&
        numbers == _other.numbers &&
        towards == _other.towards;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + names.hashCode;
    result = 31 * result + numbers.hashCode;
    result = 31 * result + towards.hashCode;
    return result;
  }
}


// RoadTexts "private" section, not exported.

final _sdkRoutingRoadtextsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_create_handle'));
final _sdkRoutingRoadtextsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_release_handle'));
final _sdkRoutingRoadtextsGetFieldnames = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_get_field_names'));
final _sdkRoutingRoadtextsGetFieldnumbers = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_get_field_numbers'));
final _sdkRoutingRoadtextsGetFieldtowards = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_get_field_towards'));



Pointer<Void> sdkRoutingRoadtextsToFfi(RoadTexts value) {
  final _namesHandle = sdkCoreLocalizedtextsToFfi(value.names);
  final _numbersHandle = sdkCoreLocalizedtextsToFfi(value.numbers);
  final _towardsHandle = sdkCoreLocalizedtextsToFfi(value.towards);
  final _result = _sdkRoutingRoadtextsCreateHandle(_namesHandle, _numbersHandle, _towardsHandle);
  sdkCoreLocalizedtextsReleaseFfiHandle(_namesHandle);
  sdkCoreLocalizedtextsReleaseFfiHandle(_numbersHandle);
  sdkCoreLocalizedtextsReleaseFfiHandle(_towardsHandle);
  return _result;
}

RoadTexts sdkRoutingRoadtextsFromFfi(Pointer<Void> handle) {
  final _namesHandle = _sdkRoutingRoadtextsGetFieldnames(handle);
  final _numbersHandle = _sdkRoutingRoadtextsGetFieldnumbers(handle);
  final _towardsHandle = _sdkRoutingRoadtextsGetFieldtowards(handle);
  try {
    return RoadTexts(
      sdkCoreLocalizedtextsFromFfi(_namesHandle), 
      sdkCoreLocalizedtextsFromFfi(_numbersHandle), 
      sdkCoreLocalizedtextsFromFfi(_towardsHandle)
    );
  } finally {
    sdkCoreLocalizedtextsReleaseFfiHandle(_namesHandle);
    sdkCoreLocalizedtextsReleaseFfiHandle(_numbersHandle);
    sdkCoreLocalizedtextsReleaseFfiHandle(_towardsHandle);
  }
}

void sdkRoutingRoadtextsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingRoadtextsReleaseHandle(handle);

// Nullable RoadTexts

final _sdkRoutingRoadtextsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_create_handle_nullable'));
final _sdkRoutingRoadtextsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_release_handle_nullable'));
final _sdkRoutingRoadtextsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_get_value_nullable'));

Pointer<Void> sdkRoutingRoadtextsToFfiNullable(RoadTexts? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingRoadtextsToFfi(value);
  final result = _sdkRoutingRoadtextsCreateHandleNullable(_handle);
  sdkRoutingRoadtextsReleaseFfiHandle(_handle);
  return result;
}

RoadTexts? sdkRoutingRoadtextsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingRoadtextsGetValueNullable(handle);
  final result = sdkRoutingRoadtextsFromFfi(_handle);
  sdkRoutingRoadtextsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingRoadtextsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRoadtextsReleaseHandleNullable(handle);

// End of RoadTexts "private" section.

