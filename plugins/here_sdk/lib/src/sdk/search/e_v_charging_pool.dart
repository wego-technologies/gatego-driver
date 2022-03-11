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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/search/e_v_charging_station.dart';

/// A charging pool for electric vehicles is an area equipped with one or more charging stations.
///
/// Note: This is a BETA feature and thus subject to change.

class EVChargingPool {
  /// List of charging stations.
  List<EVChargingStation> chargingStations;

  EVChargingPool(this.chargingStations);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EVChargingPool) return false;
    EVChargingPool _other = other;
    return DeepCollectionEquality().equals(chargingStations, _other.chargingStations);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(chargingStations);
    return result;
  }
}


// EVChargingPool "private" section, not exported.

final _sdkSearchEvchargingpoolCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPool_create_handle'));
final _sdkSearchEvchargingpoolReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPool_release_handle'));
final _sdkSearchEvchargingpoolGetFieldchargingStations = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPool_get_field_chargingStations'));



Pointer<Void> sdkSearchEvchargingpoolToFfi(EVChargingPool value) {
  final _chargingStationsHandle = heresdkSearchCommonBindingslistofSdkSearchEvchargingstationToFfi(value.chargingStations);
  final _result = _sdkSearchEvchargingpoolCreateHandle(_chargingStationsHandle);
  heresdkSearchCommonBindingslistofSdkSearchEvchargingstationReleaseFfiHandle(_chargingStationsHandle);
  return _result;
}

EVChargingPool sdkSearchEvchargingpoolFromFfi(Pointer<Void> handle) {
  final _chargingStationsHandle = _sdkSearchEvchargingpoolGetFieldchargingStations(handle);
  try {
    return EVChargingPool(
      heresdkSearchCommonBindingslistofSdkSearchEvchargingstationFromFfi(_chargingStationsHandle)
    );
  } finally {
    heresdkSearchCommonBindingslistofSdkSearchEvchargingstationReleaseFfiHandle(_chargingStationsHandle);
  }
}

void sdkSearchEvchargingpoolReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchEvchargingpoolReleaseHandle(handle);

// Nullable EVChargingPool

final _sdkSearchEvchargingpoolCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPool_create_handle_nullable'));
final _sdkSearchEvchargingpoolReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPool_release_handle_nullable'));
final _sdkSearchEvchargingpoolGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPool_get_value_nullable'));

Pointer<Void> sdkSearchEvchargingpoolToFfiNullable(EVChargingPool? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchEvchargingpoolToFfi(value);
  final result = _sdkSearchEvchargingpoolCreateHandleNullable(_handle);
  sdkSearchEvchargingpoolReleaseFfiHandle(_handle);
  return result;
}

EVChargingPool? sdkSearchEvchargingpoolFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchEvchargingpoolGetValueNullable(handle);
  final result = sdkSearchEvchargingpoolFromFfi(_handle);
  sdkSearchEvchargingpoolReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchEvchargingpoolReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchEvchargingpoolReleaseHandleNullable(handle);

// End of EVChargingPool "private" section.

