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
import 'package:here_sdk/src/sdk/search/ev_charging_point_experimental.dart';
import 'package:here_sdk/src/sdk/search/ev_name_id_experimental.dart';
import 'package:meta/meta.dart';

/// @nodoc
@internal

class EvConnectorExperimental {
  /// The EV charge point operator
  /// @nodoc
  @internal
  String? internalsupplierName;

  /// Id and name element pair representing the connector type in the EV pool group.
  /// For more information on the current connector types, see
  /// https://developer.here.com/documentation/charging-stations/dev_guide/topics/resource-type-connector-types.html
  /// values in the HERE EV Charge Points API.
  /// @nodoc
  @internal
  EvNameIdExperimental? internalconnectorType;

  /// Details on type of power feed with respect to SAE J1772
  /// https://en.wikipedia.org/wiki/SAE_J1772#Charging standard.
  /// @nodoc
  @internal
  EvNameIdExperimental? internalpowerFeedType;

  /// INTERNAL: Charge capacity of the connector.
  /// @nodoc
  @internal
  String? internalchargeCapacity;

  /// INTERNAL: Boolean indicating whether a cable is provided for the connector.
  /// If true, then there is a cable for the connector at the station.
  /// @nodoc
  @internal
  bool? internalfixedCable;

  /// Maximum charge power (in kilowatt) of connectors in connectors group.
  /// @nodoc
  @internal
  double? internalmaxPowerLevel;

  /// Connectors group additional charging information
  /// @nodoc
  @internal
  EvChargingPointExperimental? internalchargingPoint;

  /// INTERNAL: Information about when the facility information was last updated, in ISO 8601 format.
  /// If the time is UTC, a Z is added. If the time is not UTC , then the offset is added as a ?hh:mm value
  /// (for example, 2014-01-14T10:00:00.000+0100).'
  /// example: 2013-12-31T12:00:00.000Z
  /// @nodoc
  @internal
  String? internallastUpdateTimestamp;

  EvConnectorExperimental(this.internalsupplierName, this.internalconnectorType, this.internalpowerFeedType, this.internalchargeCapacity, this.internalfixedCable, this.internalmaxPowerLevel, this.internalchargingPoint, this.internallastUpdateTimestamp);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EvConnectorExperimental) return false;
    EvConnectorExperimental _other = other;
    return internalsupplierName == _other.internalsupplierName &&
        internalconnectorType == _other.internalconnectorType &&
        internalpowerFeedType == _other.internalpowerFeedType &&
        internalchargeCapacity == _other.internalchargeCapacity &&
        internalfixedCable == _other.internalfixedCable &&
        internalmaxPowerLevel == _other.internalmaxPowerLevel &&
        internalchargingPoint == _other.internalchargingPoint &&
        internallastUpdateTimestamp == _other.internallastUpdateTimestamp;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalsupplierName.hashCode;
    result = 31 * result + internalconnectorType.hashCode;
    result = 31 * result + internalpowerFeedType.hashCode;
    result = 31 * result + internalchargeCapacity.hashCode;
    result = 31 * result + internalfixedCable.hashCode;
    result = 31 * result + internalmaxPowerLevel.hashCode;
    result = 31 * result + internalchargingPoint.hashCode;
    result = 31 * result + internallastUpdateTimestamp.hashCode;
    return result;
  }
}


// EvConnectorExperimental "private" section, not exported.

final _sdkSearchEvconnectorexperimentalCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_EvConnectorExperimental_create_handle'));
final _sdkSearchEvconnectorexperimentalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnectorExperimental_release_handle'));
final _sdkSearchEvconnectorexperimentalGetFieldsupplierName = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnectorExperimental_get_field_supplierName'));
final _sdkSearchEvconnectorexperimentalGetFieldconnectorType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnectorExperimental_get_field_connectorType'));
final _sdkSearchEvconnectorexperimentalGetFieldpowerFeedType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnectorExperimental_get_field_powerFeedType'));
final _sdkSearchEvconnectorexperimentalGetFieldchargeCapacity = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnectorExperimental_get_field_chargeCapacity'));
final _sdkSearchEvconnectorexperimentalGetFieldfixedCable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnectorExperimental_get_field_fixedCable'));
final _sdkSearchEvconnectorexperimentalGetFieldmaxPowerLevel = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnectorExperimental_get_field_maxPowerLevel'));
final _sdkSearchEvconnectorexperimentalGetFieldchargingPoint = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnectorExperimental_get_field_chargingPoint'));
final _sdkSearchEvconnectorexperimentalGetFieldlastUpdateTimestamp = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnectorExperimental_get_field_lastUpdateTimestamp'));



Pointer<Void> sdkSearchEvconnectorexperimentalToFfi(EvConnectorExperimental value) {
  final _supplierNameHandle = stringToFfiNullable(value.internalsupplierName);
  final _connectorTypeHandle = sdkSearchEvnameidexperimentalToFfiNullable(value.internalconnectorType);
  final _powerFeedTypeHandle = sdkSearchEvnameidexperimentalToFfiNullable(value.internalpowerFeedType);
  final _chargeCapacityHandle = stringToFfiNullable(value.internalchargeCapacity);
  final _fixedCableHandle = booleanToFfiNullable(value.internalfixedCable);
  final _maxPowerLevelHandle = doubleToFfiNullable(value.internalmaxPowerLevel);
  final _chargingPointHandle = sdkSearchEvchargingpointexperimentalToFfiNullable(value.internalchargingPoint);
  final _lastUpdateTimestampHandle = stringToFfiNullable(value.internallastUpdateTimestamp);
  final _result = _sdkSearchEvconnectorexperimentalCreateHandle(_supplierNameHandle, _connectorTypeHandle, _powerFeedTypeHandle, _chargeCapacityHandle, _fixedCableHandle, _maxPowerLevelHandle, _chargingPointHandle, _lastUpdateTimestampHandle);
  stringReleaseFfiHandleNullable(_supplierNameHandle);
  sdkSearchEvnameidexperimentalReleaseFfiHandleNullable(_connectorTypeHandle);
  sdkSearchEvnameidexperimentalReleaseFfiHandleNullable(_powerFeedTypeHandle);
  stringReleaseFfiHandleNullable(_chargeCapacityHandle);
  booleanReleaseFfiHandleNullable(_fixedCableHandle);
  doubleReleaseFfiHandleNullable(_maxPowerLevelHandle);
  sdkSearchEvchargingpointexperimentalReleaseFfiHandleNullable(_chargingPointHandle);
  stringReleaseFfiHandleNullable(_lastUpdateTimestampHandle);
  return _result;
}

EvConnectorExperimental sdkSearchEvconnectorexperimentalFromFfi(Pointer<Void> handle) {
  final _supplierNameHandle = _sdkSearchEvconnectorexperimentalGetFieldsupplierName(handle);
  final _connectorTypeHandle = _sdkSearchEvconnectorexperimentalGetFieldconnectorType(handle);
  final _powerFeedTypeHandle = _sdkSearchEvconnectorexperimentalGetFieldpowerFeedType(handle);
  final _chargeCapacityHandle = _sdkSearchEvconnectorexperimentalGetFieldchargeCapacity(handle);
  final _fixedCableHandle = _sdkSearchEvconnectorexperimentalGetFieldfixedCable(handle);
  final _maxPowerLevelHandle = _sdkSearchEvconnectorexperimentalGetFieldmaxPowerLevel(handle);
  final _chargingPointHandle = _sdkSearchEvconnectorexperimentalGetFieldchargingPoint(handle);
  final _lastUpdateTimestampHandle = _sdkSearchEvconnectorexperimentalGetFieldlastUpdateTimestamp(handle);
  try {
    return EvConnectorExperimental(
      stringFromFfiNullable(_supplierNameHandle), 
      sdkSearchEvnameidexperimentalFromFfiNullable(_connectorTypeHandle), 
      sdkSearchEvnameidexperimentalFromFfiNullable(_powerFeedTypeHandle), 
      stringFromFfiNullable(_chargeCapacityHandle), 
      booleanFromFfiNullable(_fixedCableHandle), 
      doubleFromFfiNullable(_maxPowerLevelHandle), 
      sdkSearchEvchargingpointexperimentalFromFfiNullable(_chargingPointHandle), 
      stringFromFfiNullable(_lastUpdateTimestampHandle)
    );
  } finally {
    stringReleaseFfiHandleNullable(_supplierNameHandle);
    sdkSearchEvnameidexperimentalReleaseFfiHandleNullable(_connectorTypeHandle);
    sdkSearchEvnameidexperimentalReleaseFfiHandleNullable(_powerFeedTypeHandle);
    stringReleaseFfiHandleNullable(_chargeCapacityHandle);
    booleanReleaseFfiHandleNullable(_fixedCableHandle);
    doubleReleaseFfiHandleNullable(_maxPowerLevelHandle);
    sdkSearchEvchargingpointexperimentalReleaseFfiHandleNullable(_chargingPointHandle);
    stringReleaseFfiHandleNullable(_lastUpdateTimestampHandle);
  }
}

void sdkSearchEvconnectorexperimentalReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchEvconnectorexperimentalReleaseHandle(handle);

// Nullable EvConnectorExperimental

final _sdkSearchEvconnectorexperimentalCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnectorExperimental_create_handle_nullable'));
final _sdkSearchEvconnectorexperimentalReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnectorExperimental_release_handle_nullable'));
final _sdkSearchEvconnectorexperimentalGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnectorExperimental_get_value_nullable'));

Pointer<Void> sdkSearchEvconnectorexperimentalToFfiNullable(EvConnectorExperimental? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchEvconnectorexperimentalToFfi(value);
  final result = _sdkSearchEvconnectorexperimentalCreateHandleNullable(_handle);
  sdkSearchEvconnectorexperimentalReleaseFfiHandle(_handle);
  return result;
}

EvConnectorExperimental? sdkSearchEvconnectorexperimentalFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchEvconnectorexperimentalGetValueNullable(handle);
  final result = sdkSearchEvconnectorexperimentalFromFfi(_handle);
  sdkSearchEvconnectorexperimentalReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchEvconnectorexperimentalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchEvconnectorexperimentalReleaseHandleNullable(handle);

// End of EvConnectorExperimental "private" section.

