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
import 'package:meta/meta.dart';

/// A class to configure the list of features which needs to be enable/disable for offline use.
///
/// Disabling a feature for offline use, allows user to reduce the amount of data which needs to be
/// downloaded/prefetched from internet.
/// @nodoc
@internal

class LayerConfiguration {
  /// Specifies feature configuration for enabling list of features.
  /// @nodoc
  @internal
  List<LayerConfigurationFeature> internalenabledFeatures;

  @internal
  LayerConfiguration.withDefaults()
      : internalenabledFeatures = [];
  @internal
  LayerConfiguration(this.internalenabledFeatures);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LayerConfiguration) return false;
    LayerConfiguration _other = other;
    return DeepCollectionEquality().equals(internalenabledFeatures, _other.internalenabledFeatures);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(internalenabledFeatures);
    return result;
  }
}

/// Defines a list of possible map data features that can be enabled / disabled.
///
/// See [SDKOptions.layerConfiguration]
/// By default, all map data layer are enabled.
/// @nodoc
@internal
enum LayerConfigurationFeature {
    /// Additional rendering details like buildings. Only used for the MapView.
    detailRendering,
    /// Map data that is used for map matching during navigation. When not set,
    /// navigation may not work properly when being used offline.
    navigation,
    /// Map data that is used to search. When not set, the OfflineSearchEngine may not
    /// work properly when being used offline.
    offlineSearch,
    /// Map data that is used to calculate routes. When not set, the OfflineRoutingEngine
    /// may not work properly when being used offline.
    offlineRouting,
    /// A basic set of rendering features such as carto POIs.
    /// When disabled, then only a minimal set of rendering features will be used.
    rendering,
    /// Map data that is used to calculate truck routes. When not set,
    /// the OfflineRoutingEngine may not work properly when being used offline to calculate truck routes.
    /// It is also used for map matching during truck navigation.
    /// When not set, truck navigation may not work properly when being used offline.
    truck
}

// LayerConfigurationFeature "private" section, not exported.

int sdkCoreEngineLayerconfigurationFeatureToFfi(LayerConfigurationFeature value) {
  switch (value) {
  case LayerConfigurationFeature.detailRendering:
    return 0;
  case LayerConfigurationFeature.navigation:
    return 1;
  case LayerConfigurationFeature.offlineSearch:
    return 2;
  case LayerConfigurationFeature.offlineRouting:
    return 3;
  case LayerConfigurationFeature.rendering:
    return 4;
  case LayerConfigurationFeature.truck:
    return 5;
  default:
    throw StateError("Invalid enum value $value for LayerConfigurationFeature enum.");
  }
}

LayerConfigurationFeature sdkCoreEngineLayerconfigurationFeatureFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LayerConfigurationFeature.detailRendering;
  case 1:
    return LayerConfigurationFeature.navigation;
  case 2:
    return LayerConfigurationFeature.offlineSearch;
  case 3:
    return LayerConfigurationFeature.offlineRouting;
  case 4:
    return LayerConfigurationFeature.rendering;
  case 5:
    return LayerConfigurationFeature.truck;
  default:
    throw StateError("Invalid numeric value $handle for LayerConfigurationFeature enum.");
  }
}

void sdkCoreEngineLayerconfigurationFeatureReleaseFfiHandle(int handle) {}

final _sdkCoreEngineLayerconfigurationFeatureCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_engine_LayerConfiguration_Feature_create_handle_nullable'));
final _sdkCoreEngineLayerconfigurationFeatureReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_Feature_release_handle_nullable'));
final _sdkCoreEngineLayerconfigurationFeatureGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_Feature_get_value_nullable'));

Pointer<Void> sdkCoreEngineLayerconfigurationFeatureToFfiNullable(LayerConfigurationFeature? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineLayerconfigurationFeatureToFfi(value);
  final result = _sdkCoreEngineLayerconfigurationFeatureCreateHandleNullable(_handle);
  sdkCoreEngineLayerconfigurationFeatureReleaseFfiHandle(_handle);
  return result;
}

LayerConfigurationFeature? sdkCoreEngineLayerconfigurationFeatureFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineLayerconfigurationFeatureGetValueNullable(handle);
  final result = sdkCoreEngineLayerconfigurationFeatureFromFfi(_handle);
  sdkCoreEngineLayerconfigurationFeatureReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineLayerconfigurationFeatureReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineLayerconfigurationFeatureReleaseHandleNullable(handle);

// End of LayerConfigurationFeature "private" section.

// LayerConfiguration "private" section, not exported.

final _sdkCoreEngineLayerconfigurationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_create_handle'));
final _sdkCoreEngineLayerconfigurationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_release_handle'));
final _sdkCoreEngineLayerconfigurationGetFieldenabledFeatures = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_get_field_enabledFeatures'));



Pointer<Void> sdkCoreEngineLayerconfigurationToFfi(LayerConfiguration value) {
  final _enabledFeaturesHandle = heresdkCoreBindingslistofSdkCoreEngineLayerconfigurationFeatureToFfi(value.internalenabledFeatures);
  final _result = _sdkCoreEngineLayerconfigurationCreateHandle(_enabledFeaturesHandle);
  heresdkCoreBindingslistofSdkCoreEngineLayerconfigurationFeatureReleaseFfiHandle(_enabledFeaturesHandle);
  return _result;
}

LayerConfiguration sdkCoreEngineLayerconfigurationFromFfi(Pointer<Void> handle) {
  final _enabledFeaturesHandle = _sdkCoreEngineLayerconfigurationGetFieldenabledFeatures(handle);
  try {
    return LayerConfiguration(
      heresdkCoreBindingslistofSdkCoreEngineLayerconfigurationFeatureFromFfi(_enabledFeaturesHandle)
    );
  } finally {
    heresdkCoreBindingslistofSdkCoreEngineLayerconfigurationFeatureReleaseFfiHandle(_enabledFeaturesHandle);
  }
}

void sdkCoreEngineLayerconfigurationReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreEngineLayerconfigurationReleaseHandle(handle);

// Nullable LayerConfiguration

final _sdkCoreEngineLayerconfigurationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_create_handle_nullable'));
final _sdkCoreEngineLayerconfigurationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_release_handle_nullable'));
final _sdkCoreEngineLayerconfigurationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_get_value_nullable'));

Pointer<Void> sdkCoreEngineLayerconfigurationToFfiNullable(LayerConfiguration? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineLayerconfigurationToFfi(value);
  final result = _sdkCoreEngineLayerconfigurationCreateHandleNullable(_handle);
  sdkCoreEngineLayerconfigurationReleaseFfiHandle(_handle);
  return result;
}

LayerConfiguration? sdkCoreEngineLayerconfigurationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineLayerconfigurationGetValueNullable(handle);
  final result = sdkCoreEngineLayerconfigurationFromFfi(_handle);
  sdkCoreEngineLayerconfigurationReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineLayerconfigurationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineLayerconfigurationReleaseHandleNullable(handle);

// End of LayerConfiguration "private" section.

