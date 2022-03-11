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

class EvChargingPointExperimental {
  /// Number of physical connectors in the connectors group
  /// @nodoc
  @internal
  int? internalnumberOfConnectors;

  /// Charge mode of the connectors group. For more information, check the IEC-61851-1
  /// https://en.wikipedia.org/w/index.php?title=Charging_station&oldid=1013010605#IEC-61851-1_Charging_Modes
  /// standard.
  /// @nodoc
  @internal
  String? internalchargeMode;

  /// Voltage provided by the connectors group
  /// example: 100-120V AC
  /// @nodoc
  @internal
  String? internalvoltsRange;

  /// Number of phases provided by the connectors group
  /// @nodoc
  @internal
  int? internalphases;

  /// Amperage provided by the connectors group
  /// example: 12A-80A
  /// @nodoc
  @internal
  String? internalampsRange;

  /// Number of physical connectors that are available (i.e not being used to charge a vehicle,
  /// out of service, etc) at the charge point
  /// @nodoc
  @internal
  int? internalnumberOfAvailable;

  /// Number of physical connectors that are in use at the charge point
  /// @nodoc
  @internal
  int? internalnumberOfInUse;

  /// INTERNAL: Number of physical connectors that are out of service at the charge point
  /// @nodoc
  @internal
  int? internalnumberOfOutOfService;

  /// INTERNAL: Number of physical connectors that are reserved at the charge point
  /// @nodoc
  @internal
  int? internalnumberOfReserved;

  /// Information about when the facility information was last updated, in ISO 8601 format.
  /// If the time is UTC, a Z is added. If the time is not UTC , then the offset is added as a ?hh:mm value
  /// (for example, 2014-01-14T10:00:00.000+0100).
  /// example: 2013-12-31T12:00:00.000Z
  /// @nodoc
  @internal
  String? internallastUpdateTimestamp;

  EvChargingPointExperimental(this.internalnumberOfConnectors, this.internalchargeMode, this.internalvoltsRange, this.internalphases, this.internalampsRange, this.internalnumberOfAvailable, this.internalnumberOfInUse, this.internalnumberOfOutOfService, this.internalnumberOfReserved, this.internallastUpdateTimestamp);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EvChargingPointExperimental) return false;
    EvChargingPointExperimental _other = other;
    return internalnumberOfConnectors == _other.internalnumberOfConnectors &&
        internalchargeMode == _other.internalchargeMode &&
        internalvoltsRange == _other.internalvoltsRange &&
        internalphases == _other.internalphases &&
        internalampsRange == _other.internalampsRange &&
        internalnumberOfAvailable == _other.internalnumberOfAvailable &&
        internalnumberOfInUse == _other.internalnumberOfInUse &&
        internalnumberOfOutOfService == _other.internalnumberOfOutOfService &&
        internalnumberOfReserved == _other.internalnumberOfReserved &&
        internallastUpdateTimestamp == _other.internallastUpdateTimestamp;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalnumberOfConnectors.hashCode;
    result = 31 * result + internalchargeMode.hashCode;
    result = 31 * result + internalvoltsRange.hashCode;
    result = 31 * result + internalphases.hashCode;
    result = 31 * result + internalampsRange.hashCode;
    result = 31 * result + internalnumberOfAvailable.hashCode;
    result = 31 * result + internalnumberOfInUse.hashCode;
    result = 31 * result + internalnumberOfOutOfService.hashCode;
    result = 31 * result + internalnumberOfReserved.hashCode;
    result = 31 * result + internallastUpdateTimestamp.hashCode;
    return result;
  }
}


// EvChargingPointExperimental "private" section, not exported.

final _sdkSearchEvchargingpointexperimentalCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPointExperimental_create_handle'));
final _sdkSearchEvchargingpointexperimentalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPointExperimental_release_handle'));
final _sdkSearchEvchargingpointexperimentalGetFieldnumberOfConnectors = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPointExperimental_get_field_numberOfConnectors'));
final _sdkSearchEvchargingpointexperimentalGetFieldchargeMode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPointExperimental_get_field_chargeMode'));
final _sdkSearchEvchargingpointexperimentalGetFieldvoltsRange = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPointExperimental_get_field_voltsRange'));
final _sdkSearchEvchargingpointexperimentalGetFieldphases = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPointExperimental_get_field_phases'));
final _sdkSearchEvchargingpointexperimentalGetFieldampsRange = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPointExperimental_get_field_ampsRange'));
final _sdkSearchEvchargingpointexperimentalGetFieldnumberOfAvailable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPointExperimental_get_field_numberOfAvailable'));
final _sdkSearchEvchargingpointexperimentalGetFieldnumberOfInUse = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPointExperimental_get_field_numberOfInUse'));
final _sdkSearchEvchargingpointexperimentalGetFieldnumberOfOutOfService = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPointExperimental_get_field_numberOfOutOfService'));
final _sdkSearchEvchargingpointexperimentalGetFieldnumberOfReserved = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPointExperimental_get_field_numberOfReserved'));
final _sdkSearchEvchargingpointexperimentalGetFieldlastUpdateTimestamp = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPointExperimental_get_field_lastUpdateTimestamp'));



Pointer<Void> sdkSearchEvchargingpointexperimentalToFfi(EvChargingPointExperimental value) {
  final _numberOfConnectorsHandle = intToFfiNullable(value.internalnumberOfConnectors);
  final _chargeModeHandle = stringToFfiNullable(value.internalchargeMode);
  final _voltsRangeHandle = stringToFfiNullable(value.internalvoltsRange);
  final _phasesHandle = intToFfiNullable(value.internalphases);
  final _ampsRangeHandle = stringToFfiNullable(value.internalampsRange);
  final _numberOfAvailableHandle = intToFfiNullable(value.internalnumberOfAvailable);
  final _numberOfInUseHandle = intToFfiNullable(value.internalnumberOfInUse);
  final _numberOfOutOfServiceHandle = intToFfiNullable(value.internalnumberOfOutOfService);
  final _numberOfReservedHandle = intToFfiNullable(value.internalnumberOfReserved);
  final _lastUpdateTimestampHandle = stringToFfiNullable(value.internallastUpdateTimestamp);
  final _result = _sdkSearchEvchargingpointexperimentalCreateHandle(_numberOfConnectorsHandle, _chargeModeHandle, _voltsRangeHandle, _phasesHandle, _ampsRangeHandle, _numberOfAvailableHandle, _numberOfInUseHandle, _numberOfOutOfServiceHandle, _numberOfReservedHandle, _lastUpdateTimestampHandle);
  intReleaseFfiHandleNullable(_numberOfConnectorsHandle);
  stringReleaseFfiHandleNullable(_chargeModeHandle);
  stringReleaseFfiHandleNullable(_voltsRangeHandle);
  intReleaseFfiHandleNullable(_phasesHandle);
  stringReleaseFfiHandleNullable(_ampsRangeHandle);
  intReleaseFfiHandleNullable(_numberOfAvailableHandle);
  intReleaseFfiHandleNullable(_numberOfInUseHandle);
  intReleaseFfiHandleNullable(_numberOfOutOfServiceHandle);
  intReleaseFfiHandleNullable(_numberOfReservedHandle);
  stringReleaseFfiHandleNullable(_lastUpdateTimestampHandle);
  return _result;
}

EvChargingPointExperimental sdkSearchEvchargingpointexperimentalFromFfi(Pointer<Void> handle) {
  final _numberOfConnectorsHandle = _sdkSearchEvchargingpointexperimentalGetFieldnumberOfConnectors(handle);
  final _chargeModeHandle = _sdkSearchEvchargingpointexperimentalGetFieldchargeMode(handle);
  final _voltsRangeHandle = _sdkSearchEvchargingpointexperimentalGetFieldvoltsRange(handle);
  final _phasesHandle = _sdkSearchEvchargingpointexperimentalGetFieldphases(handle);
  final _ampsRangeHandle = _sdkSearchEvchargingpointexperimentalGetFieldampsRange(handle);
  final _numberOfAvailableHandle = _sdkSearchEvchargingpointexperimentalGetFieldnumberOfAvailable(handle);
  final _numberOfInUseHandle = _sdkSearchEvchargingpointexperimentalGetFieldnumberOfInUse(handle);
  final _numberOfOutOfServiceHandle = _sdkSearchEvchargingpointexperimentalGetFieldnumberOfOutOfService(handle);
  final _numberOfReservedHandle = _sdkSearchEvchargingpointexperimentalGetFieldnumberOfReserved(handle);
  final _lastUpdateTimestampHandle = _sdkSearchEvchargingpointexperimentalGetFieldlastUpdateTimestamp(handle);
  try {
    return EvChargingPointExperimental(
      intFromFfiNullable(_numberOfConnectorsHandle), 
      stringFromFfiNullable(_chargeModeHandle), 
      stringFromFfiNullable(_voltsRangeHandle), 
      intFromFfiNullable(_phasesHandle), 
      stringFromFfiNullable(_ampsRangeHandle), 
      intFromFfiNullable(_numberOfAvailableHandle), 
      intFromFfiNullable(_numberOfInUseHandle), 
      intFromFfiNullable(_numberOfOutOfServiceHandle), 
      intFromFfiNullable(_numberOfReservedHandle), 
      stringFromFfiNullable(_lastUpdateTimestampHandle)
    );
  } finally {
    intReleaseFfiHandleNullable(_numberOfConnectorsHandle);
    stringReleaseFfiHandleNullable(_chargeModeHandle);
    stringReleaseFfiHandleNullable(_voltsRangeHandle);
    intReleaseFfiHandleNullable(_phasesHandle);
    stringReleaseFfiHandleNullable(_ampsRangeHandle);
    intReleaseFfiHandleNullable(_numberOfAvailableHandle);
    intReleaseFfiHandleNullable(_numberOfInUseHandle);
    intReleaseFfiHandleNullable(_numberOfOutOfServiceHandle);
    intReleaseFfiHandleNullable(_numberOfReservedHandle);
    stringReleaseFfiHandleNullable(_lastUpdateTimestampHandle);
  }
}

void sdkSearchEvchargingpointexperimentalReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchEvchargingpointexperimentalReleaseHandle(handle);

// Nullable EvChargingPointExperimental

final _sdkSearchEvchargingpointexperimentalCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPointExperimental_create_handle_nullable'));
final _sdkSearchEvchargingpointexperimentalReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPointExperimental_release_handle_nullable'));
final _sdkSearchEvchargingpointexperimentalGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPointExperimental_get_value_nullable'));

Pointer<Void> sdkSearchEvchargingpointexperimentalToFfiNullable(EvChargingPointExperimental? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchEvchargingpointexperimentalToFfi(value);
  final result = _sdkSearchEvchargingpointexperimentalCreateHandleNullable(_handle);
  sdkSearchEvchargingpointexperimentalReleaseFfiHandle(_handle);
  return result;
}

EvChargingPointExperimental? sdkSearchEvchargingpointexperimentalFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchEvchargingpointexperimentalGetValueNullable(handle);
  final result = sdkSearchEvchargingpointexperimentalFromFfi(_handle);
  sdkSearchEvchargingpointexperimentalReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchEvchargingpointexperimentalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchEvchargingpointexperimentalReleaseHandleNullable(handle);

// End of EvChargingPointExperimental "private" section.

