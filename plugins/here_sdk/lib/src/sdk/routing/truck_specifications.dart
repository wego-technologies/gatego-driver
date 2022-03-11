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
import 'package:here_sdk/src/sdk/routing/truck_type.dart' as sdk_routing;
import 'package:here_sdk/src/sdk/transport/truck_type.dart' as sdk_transport;

/// Truck specifications such as dimensions and weight.

class TruckSpecifications {
  /// Truck weight including trailers and shipped goods in kilograms. The provided value
  /// must be greater than or equal to 0. When not set, possible weight restrictions will not be
  /// taken into consideration for route calculation. By default, it is not set.
  int? grossWeightInKilograms;

  /// Truck weight per axle in kilograms. The provided value must be greater or equal to 0.
  /// When not set, possible weight per axle restrictions will not be taken into
  /// consideration for route calculation. By default, it is not set.
  int? weightPerAxleInKilograms;

  /// Truck height in centimeters. The provided value must be in the range \[0, 5000\]. When not
  /// set, possible height restrictions will not be taken into consideration for route
  /// calculation. By default, it is not set.
  int? heightInCentimeters;

  /// Truck width in centimeters. The provided value must be in the range \[0, 5000\]. When not
  /// set, possible width restrictions will not be taken into consideration for route
  /// calculation. By default, it is not set.
  int? widthInCentimeters;

  /// Truck length in centimeters. The provided value must be in the range \[0, 30000\]. When
  /// not set, possible length restrictions will not be taken into consideration for route
  /// calculation. By default, it is not set.
  int? lengthInCentimeters;

  /// Defines total number of axles in the vehicle. The provided value must be greater than or
  /// equal to 2. When not set, possible axle count restrictions will not be taken into
  /// consideration for route calculation. By default, it is not set.
  int? axleCount;

  /// Defines number of trailers attached to the vehicle. The provided value must be in the range
  /// \[0, 255\]. When not set, possible trailer count restrictions will not be taken into consideration
  /// for route calculation. By default, it is not set.
  int? trailerCount;

  /// Defines the type of truck. By default, it is [TruckType.straight].
  @Deprecated("Will be removed in v4.12.0. Please use [TruckSpecifications.truckType] instead.")
  sdk_routing.TruckType type;

  /// Defines the type of truck. By default, it is [TruckType.straight].
  sdk_transport.TruckType truckType;

  /// A flag indicating whether the truck is light enough to be classified more as a car than as a truck.
  /// A light truck exempts from many legal restrictions for normal trucks. Restrictions related to the physical
  /// dimensions of the truck, or its cargo, however, still apply. A light trucks are fully supported in Japan and is
  /// experimental in other regions. Default value is false and truck routing will proceed as normal
  bool isTruckLight;

  TruckSpecifications([int? grossWeightInKilograms = null, int? weightPerAxleInKilograms = null, int? heightInCentimeters = null, int? widthInCentimeters = null, int? lengthInCentimeters = null, int? axleCount = null, int? trailerCount = null, sdk_routing.TruckType type = sdk_routing.TruckType.straight, sdk_transport.TruckType truckType = sdk_transport.TruckType.straight, bool isTruckLight = false])
    : grossWeightInKilograms = grossWeightInKilograms, weightPerAxleInKilograms = weightPerAxleInKilograms, heightInCentimeters = heightInCentimeters, widthInCentimeters = widthInCentimeters, lengthInCentimeters = lengthInCentimeters, axleCount = axleCount, trailerCount = trailerCount, type = type, truckType = truckType, isTruckLight = isTruckLight;
  TruckSpecifications.withDefaults()
    : grossWeightInKilograms = null, weightPerAxleInKilograms = null, heightInCentimeters = null, widthInCentimeters = null, lengthInCentimeters = null, axleCount = null, trailerCount = null, type = sdk_routing.TruckType.straight, truckType = sdk_transport.TruckType.straight, isTruckLight = false;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TruckSpecifications) return false;
    TruckSpecifications _other = other;
    return grossWeightInKilograms == _other.grossWeightInKilograms &&
        weightPerAxleInKilograms == _other.weightPerAxleInKilograms &&
        heightInCentimeters == _other.heightInCentimeters &&
        widthInCentimeters == _other.widthInCentimeters &&
        lengthInCentimeters == _other.lengthInCentimeters &&
        axleCount == _other.axleCount &&
        trailerCount == _other.trailerCount &&
        type == _other.type &&
        truckType == _other.truckType &&
        isTruckLight == _other.isTruckLight;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + grossWeightInKilograms.hashCode;
    result = 31 * result + weightPerAxleInKilograms.hashCode;
    result = 31 * result + heightInCentimeters.hashCode;
    result = 31 * result + widthInCentimeters.hashCode;
    result = 31 * result + lengthInCentimeters.hashCode;
    result = 31 * result + axleCount.hashCode;
    result = 31 * result + trailerCount.hashCode;
    result = 31 * result + type.hashCode;
    result = 31 * result + truckType.hashCode;
    result = 31 * result + isTruckLight.hashCode;
    return result;
  }
}


// TruckSpecifications "private" section, not exported.

final _sdkRoutingTruckspecificationsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint32, Uint32, Uint8),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, int, int)
  >('here_sdk_sdk_routing_TruckSpecifications_create_handle'));
final _sdkRoutingTruckspecificationsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_release_handle'));
final _sdkRoutingTruckspecificationsGetFieldgrossWeightInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_grossWeightInKilograms'));
final _sdkRoutingTruckspecificationsGetFieldweightPerAxleInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_weightPerAxleInKilograms'));
final _sdkRoutingTruckspecificationsGetFieldheightInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_heightInCentimeters'));
final _sdkRoutingTruckspecificationsGetFieldwidthInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_widthInCentimeters'));
final _sdkRoutingTruckspecificationsGetFieldlengthInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_lengthInCentimeters'));
final _sdkRoutingTruckspecificationsGetFieldaxleCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_axleCount'));
final _sdkRoutingTruckspecificationsGetFieldtrailerCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_trailerCount'));
final _sdkRoutingTruckspecificationsGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_type'));
final _sdkRoutingTruckspecificationsGetFieldtruckType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_truckType'));
final _sdkRoutingTruckspecificationsGetFieldisTruckLight = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_isTruckLight'));



Pointer<Void> sdkRoutingTruckspecificationsToFfi(TruckSpecifications value) {
  final _grossWeightInKilogramsHandle = intToFfiNullable(value.grossWeightInKilograms);
  final _weightPerAxleInKilogramsHandle = intToFfiNullable(value.weightPerAxleInKilograms);
  final _heightInCentimetersHandle = intToFfiNullable(value.heightInCentimeters);
  final _widthInCentimetersHandle = intToFfiNullable(value.widthInCentimeters);
  final _lengthInCentimetersHandle = intToFfiNullable(value.lengthInCentimeters);
  final _axleCountHandle = intToFfiNullable(value.axleCount);
  final _trailerCountHandle = intToFfiNullable(value.trailerCount);
  final _typeHandle = sdk_routing.sdkRoutingTrucktypeToFfi(value.type);
  final _truckTypeHandle = sdk_transport.sdkTransportTrucktypeToFfi(value.truckType);
  final _isTruckLightHandle = booleanToFfi(value.isTruckLight);
  final _result = _sdkRoutingTruckspecificationsCreateHandle(_grossWeightInKilogramsHandle, _weightPerAxleInKilogramsHandle, _heightInCentimetersHandle, _widthInCentimetersHandle, _lengthInCentimetersHandle, _axleCountHandle, _trailerCountHandle, _typeHandle, _truckTypeHandle, _isTruckLightHandle);
  intReleaseFfiHandleNullable(_grossWeightInKilogramsHandle);
  intReleaseFfiHandleNullable(_weightPerAxleInKilogramsHandle);
  intReleaseFfiHandleNullable(_heightInCentimetersHandle);
  intReleaseFfiHandleNullable(_widthInCentimetersHandle);
  intReleaseFfiHandleNullable(_lengthInCentimetersHandle);
  intReleaseFfiHandleNullable(_axleCountHandle);
  intReleaseFfiHandleNullable(_trailerCountHandle);
  sdk_routing.sdkRoutingTrucktypeReleaseFfiHandle(_typeHandle);
  sdk_transport.sdkTransportTrucktypeReleaseFfiHandle(_truckTypeHandle);
  booleanReleaseFfiHandle(_isTruckLightHandle);
  return _result;
}

TruckSpecifications sdkRoutingTruckspecificationsFromFfi(Pointer<Void> handle) {
  final _grossWeightInKilogramsHandle = _sdkRoutingTruckspecificationsGetFieldgrossWeightInKilograms(handle);
  final _weightPerAxleInKilogramsHandle = _sdkRoutingTruckspecificationsGetFieldweightPerAxleInKilograms(handle);
  final _heightInCentimetersHandle = _sdkRoutingTruckspecificationsGetFieldheightInCentimeters(handle);
  final _widthInCentimetersHandle = _sdkRoutingTruckspecificationsGetFieldwidthInCentimeters(handle);
  final _lengthInCentimetersHandle = _sdkRoutingTruckspecificationsGetFieldlengthInCentimeters(handle);
  final _axleCountHandle = _sdkRoutingTruckspecificationsGetFieldaxleCount(handle);
  final _trailerCountHandle = _sdkRoutingTruckspecificationsGetFieldtrailerCount(handle);
  final _typeHandle = _sdkRoutingTruckspecificationsGetFieldtype(handle);
  final _truckTypeHandle = _sdkRoutingTruckspecificationsGetFieldtruckType(handle);
  final _isTruckLightHandle = _sdkRoutingTruckspecificationsGetFieldisTruckLight(handle);
  try {
    return TruckSpecifications(
      intFromFfiNullable(_grossWeightInKilogramsHandle), 
      intFromFfiNullable(_weightPerAxleInKilogramsHandle), 
      intFromFfiNullable(_heightInCentimetersHandle), 
      intFromFfiNullable(_widthInCentimetersHandle), 
      intFromFfiNullable(_lengthInCentimetersHandle), 
      intFromFfiNullable(_axleCountHandle), 
      intFromFfiNullable(_trailerCountHandle), 
      sdk_routing.sdkRoutingTrucktypeFromFfi(_typeHandle), 
      sdk_transport.sdkTransportTrucktypeFromFfi(_truckTypeHandle), 
      booleanFromFfi(_isTruckLightHandle)
    );
  } finally {
    intReleaseFfiHandleNullable(_grossWeightInKilogramsHandle);
    intReleaseFfiHandleNullable(_weightPerAxleInKilogramsHandle);
    intReleaseFfiHandleNullable(_heightInCentimetersHandle);
    intReleaseFfiHandleNullable(_widthInCentimetersHandle);
    intReleaseFfiHandleNullable(_lengthInCentimetersHandle);
    intReleaseFfiHandleNullable(_axleCountHandle);
    intReleaseFfiHandleNullable(_trailerCountHandle);
    sdk_routing.sdkRoutingTrucktypeReleaseFfiHandle(_typeHandle);
    sdk_transport.sdkTransportTrucktypeReleaseFfiHandle(_truckTypeHandle);
    booleanReleaseFfiHandle(_isTruckLightHandle);
  }
}

void sdkRoutingTruckspecificationsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingTruckspecificationsReleaseHandle(handle);

// Nullable TruckSpecifications

final _sdkRoutingTruckspecificationsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_create_handle_nullable'));
final _sdkRoutingTruckspecificationsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_release_handle_nullable'));
final _sdkRoutingTruckspecificationsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_value_nullable'));

Pointer<Void> sdkRoutingTruckspecificationsToFfiNullable(TruckSpecifications? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTruckspecificationsToFfi(value);
  final result = _sdkRoutingTruckspecificationsCreateHandleNullable(_handle);
  sdkRoutingTruckspecificationsReleaseFfiHandle(_handle);
  return result;
}

TruckSpecifications? sdkRoutingTruckspecificationsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTruckspecificationsGetValueNullable(handle);
  final result = sdkRoutingTruckspecificationsFromFfi(_handle);
  sdkRoutingTruckspecificationsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTruckspecificationsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTruckspecificationsReleaseHandleNullable(handle);

// End of TruckSpecifications "private" section.

