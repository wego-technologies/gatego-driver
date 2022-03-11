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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/mapview/map_arrow.dart';
import 'package:here_sdk/src/sdk/mapview/map_error.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker3_d.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker_cluster.dart';
import 'package:here_sdk/src/sdk/mapview/map_polygon.dart';
import 'package:here_sdk/src/sdk/mapview/map_polyline.dart';
import 'package:here_sdk/src/sdk/mapview/map_scheme.dart';
import 'package:here_sdk/src/sdk/mapview/visibility_state.dart';
import 'package:here_sdk/src/sdk/mapview/watermark_style.dart';

/// Represents a map scene and exposes the functionality to manipulate its content.
///
/// Map scene is obtained from the `HereMapController.mapScene` property.
///
/// ## Map schemes
///
/// The content of the displayed map and how it looks is specified by a
/// [MapScheme] which is set when loading a scene with [MapScene.loadSceneForMapScheme].
/// It is also possible to load your own custom map scheme from a file bundled
/// with your application.
///
/// ## Map layers
///
/// Map scheme is organized in layers, which can be controlled using [MapScene.setLayerVisibility].
/// It's possible to change the visibility state of any map layer as long as you know its name,
/// but [MapSceneLayers] provides a set of constants for most frequently used layers. Some of those
/// layers are not supported on all map schemes. Such limitations are stated in their documentation.
///
/// ## User content
///
/// User generated content can be visualised on the map using [MapMarker], [MapPolygon]
/// and [MapPolyline] (collectively referred to as "map items"). Those can be added to and removed
/// from the scene by respective add and remove methods.
abstract class MapScene {

  /// Asynchronously loads a map scene described by a specified map scheme.
  ///
  /// Any previous map scene config will be replaced. The callback is called on the main thread.
  /// Calling this again before completion may result in a [MapError].
  ///
  /// [mapScheme] Map scheme.
  ///
  /// [callback] Optional callback that will receive the result of this operation.
  ///
  void loadSceneForMapScheme(MapScheme mapScheme, MapSceneLoadSceneCallback? callback);
  /// Asynchronously loads a map scene described by a specified json file.
  ///
  /// Any previous map scene config will be replaced. The callback is called on the main thread.
  /// Calling this again before completion may result in a [MapError].
  ///
  /// [configurationFile] Map scheme configuration file. It must contain the whole scene configuration.
  /// In case it contains references to other files, they have to be reachable under
  /// the paths specified in the main configuration file.
  ///
  /// [callback] Optional callback that will receive the result of this operation.
  ///
  void loadSceneFromConfigurationFile(String configurationFile, MapSceneLoadSceneCallback? callback);
  /// Asynchronously loads a map scene described by a specified json file.
  ///
  /// The style of the
  /// HERE watermark matching the map scheme is specified. Any previous map scene config
  /// will be replaced. The callback is called on the main thread. Calling this again before
  /// completion may result in a [MapError].
  ///
  /// [configurationFile] Map scheme configuration file. It must contain the whole scene configuration.
  /// In case it contains references to other files, they have to be reachable under
  /// the paths specified in the main configuration file.
  ///
  /// [watermarkStyle] The style for the HERE watermark, see [WatermarkStyle].
  ///
  /// [callback] Optional callback that will receive the result of this operation.
  ///
  void loadSceneFromConfigurationFileWithWatermarkStyle(String configurationFile, WatermarkStyle watermarkStyle, MapSceneLoadSceneCallback? callback);
  /// Adds a map polyline to this map scene.
  ///
  /// [mapPolyline] The map polyline to be added to this map scene.
  ///
  void addMapPolyline(MapPolyline mapPolyline);
  /// Removes a map polyline from this map scene.
  ///
  /// [mapPolyline] The map polyline to be removed from this map scene.
  ///
  void removeMapPolyline(MapPolyline mapPolyline);
  /// Adds a map arrow to this map scene.
  ///
  /// [mapArrow] The map arrow to be added to this map scene.
  ///
  void addMapArrow(MapArrow mapArrow);
  /// Removes a map arrow from this map scene.
  ///
  /// [mapArrow] The map arrow to be removed from this map scene.
  ///
  void removeMapArrow(MapArrow mapArrow);
  /// Adds a map marker to this map scene.
  ///
  /// Adding the same marker instance multiple times
  /// has no effect. Adding a marker that is already part of a map marker cluster has no effect.
  ///
  /// [marker] The marker to be added to this map scene.
  ///
  void addMapMarker(MapMarker marker);
  /// Adds multiple map markers to this map scene.
  ///
  /// Adding the same marker instances multiple times
  /// has no effect. Adding markers that are already part of a map marker cluster has no effect.
  ///
  /// [markers] The list of markers to be added to this map scene.
  ///
  void addMapMarkers(List<MapMarker> markers);
  /// Removes a map marker from this map scene.
  ///
  /// Removing a marker instance that is not
  /// a part of this scene or belongs to a marker cluster has no effect.
  ///
  /// [marker] The marker to be removed from this map scene.
  ///
  void removeMapMarker(MapMarker marker);
  /// Removes multiple map markers from this map scene.
  ///
  /// Removing marker instances that are not
  /// a part of this scene or belong to a marker cluster has no effect.
  ///
  /// [markers] The list of markers to be removed from this map scene.
  ///
  void removeMapMarkers(List<MapMarker> markers);
  /// Adds a map marker cluster to the map.
  ///
  /// Either the contained individual map markers or the
  /// cluster markers will be displayed. Adding the same map marker cluster instance multiple times
  /// has no effect.
  ///
  /// [cluster] The marker cluster to be added to this map scene.
  ///
  void addMapMarkerCluster(MapMarkerCluster cluster);
  /// Removes a map marker cluster from the map.
  ///
  /// Removing a map marker cluster that is not on this
  /// scene has no effect.
  ///
  /// [cluster] The marker cluster to be removed from this map scene.
  ///
  void removeMapMarkerCluster(MapMarkerCluster cluster);
  /// Adds a 3D map marker to this map scene.
  ///
  /// Does nothing if the marker instance was already added to the scene.
  ///
  /// [marker] The marker to be added to this map scene.
  ///
  void addMapMarker3d(MapMarker3D marker);
  /// Removes a 3D map marker from this map scene.
  ///
  /// Removing a marker instance that is not on this
  /// scene has no effect.
  ///
  /// [marker] The marker to be removed from this map scene.
  ///
  void removeMapMarker3d(MapMarker3D marker);
  /// Adds a map polygon to this map scene.
  ///
  /// [mapPolygon] The map polygon to be added to this map scene.
  ///
  void addMapPolygon(MapPolygon mapPolygon);
  /// Removes a map polygon from this map scene.
  ///
  /// [mapPolygon] The map polygon to be removed from this map scene.
  ///
  void removeMapPolygon(MapPolygon mapPolygon);
  /// Immediately changes the state of a specified map layer.
  ///
  /// This will show or hide it.
  ///
  /// [layerName] The name of the map layer to be changed.
  /// Use constants in [MapSceneLayers] to reference the predefined layers.
  ///
  /// [newState] The new state of the layer.
  ///
  @Deprecated("Will be removed in v4.12.0. Use [MapScene.setLayerVisibility] instead.")

  void setLayerState(String layerName, MapSceneLayerState newState);
  /// Immediately changes the visibility of a specified map layer.
  ///
  /// [layerName] The name of the map layer to be changed.
  /// Use constants in [MapSceneLayers] to reference the predefined layers.
  ///
  /// [visibility] The new visibility state of the layer.
  ///
  void setLayerVisibility(String layerName, VisibilityState visibility);
}

/// Represents the state and thus the visibility of a map layer.
@Deprecated("Will be removed in v4.12.0. Use [VisibilityState] instead.")
enum MapSceneLayerState {
    /// The layer is visible.
    visible,
    /// The layer is hidden. Downloading the data is usually stopped for hidden layers.
    hidden
}

// MapSceneLayerState "private" section, not exported.

int sdkMapviewMapsceneLayerstateToFfi(MapSceneLayerState value) {
  switch (value) {
  case MapSceneLayerState.visible:
    return 0;
  case MapSceneLayerState.hidden:
    return 1;
  default:
    throw StateError("Invalid enum value $value for MapSceneLayerState enum.");
  }
}

MapSceneLayerState sdkMapviewMapsceneLayerstateFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MapSceneLayerState.visible;
  case 1:
    return MapSceneLayerState.hidden;
  default:
    throw StateError("Invalid numeric value $handle for MapSceneLayerState enum.");
  }
}

void sdkMapviewMapsceneLayerstateReleaseFfiHandle(int handle) {}

final _sdkMapviewMapsceneLayerstateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapScene_LayerState_create_handle_nullable'));
final _sdkMapviewMapsceneLayerstateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LayerState_release_handle_nullable'));
final _sdkMapviewMapsceneLayerstateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LayerState_get_value_nullable'));

Pointer<Void> sdkMapviewMapsceneLayerstateToFfiNullable(MapSceneLayerState? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapsceneLayerstateToFfi(value);
  final result = _sdkMapviewMapsceneLayerstateCreateHandleNullable(_handle);
  sdkMapviewMapsceneLayerstateReleaseFfiHandle(_handle);
  return result;
}

MapSceneLayerState? sdkMapviewMapsceneLayerstateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapsceneLayerstateGetValueNullable(handle);
  final result = sdkMapviewMapsceneLayerstateFromFfi(_handle);
  sdkMapviewMapsceneLayerstateReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapsceneLayerstateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapsceneLayerstateReleaseHandleNullable(handle);

// End of MapSceneLayerState "private" section.
/// A collection of map layer identifiers used in the [MapScene.setLayerVisibility] method.

class MapSceneLayers {
  /// 3D representation of buildings. Not supported for [MapScheme.satellite],
  /// [MapScheme.hybridDay] and [MapScheme.hybridNight].
  static final String extrudedBuildings = "heresdk_layer_extruded_buildings";

  /// The 2D footprint of buildings. Not supported for [MapScheme.satellite],
  /// [MapScheme.hybridDay] and [MapScheme.hybridNight].
  static final String buildingFootprints = "heresdk_layer_building_footprints";

  /// Traffic flow speed. Not supported for [MapScheme.satellite].
  static final String trafficFlow = "heresdk_layer_traffic_flow";

  /// Traffic incidents. Not supported for [MapScheme.satellite].
  static final String trafficIncidents = "heresdk_layer_traffic_incidents";

  /// Vehicle restrictions. Not supported for [MapScheme.satellite].
  /// Only supported in HERE SDK Navigate variant.
  static final String vehicleRestrictions = "heresdk_layer_vehicle_restrictions";

  /// Safety and speed cameras. Not supported for [MapScheme.satellite].
  /// Only supported in HERE SDK Navigate variant.
  /// Showing and hiding this layer using [MapScene.setLayerVisibility] will
  /// leave the map unresponsive for a short moment because the scene configuration is reloaded.
  static final String safetyCameras = "heresdk_layer_safety_cameras";

  /// Textured landmarks. Not supported for [MapScheme.satellite],
  /// [MapScheme.hybridDay] and [MapScheme.hybridNight].
  /// Only supported in HERE SDK Navigate variant and requires map version 25 as minimum.
  /// Showing and hiding this layer using [MapScene.setLayerVisibility] will
  /// leave the map unresponsive for a short moment because the scene configuration is reloaded.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  static final String landmarks = "heresdk_layer_landmarks";

}


// MapSceneLayers "private" section, not exported.

final _sdkMapviewMapsceneLayersCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_sdk_mapview_MapScene_Layers_create_handle'));
final _sdkMapviewMapsceneLayersReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_Layers_release_handle'));



Pointer<Void> sdkMapviewMapsceneLayersToFfi(MapSceneLayers value) {
  final _result = _sdkMapviewMapsceneLayersCreateHandle();
  return _result;
}

MapSceneLayers sdkMapviewMapsceneLayersFromFfi(Pointer<Void> handle) {
  try {
    return MapSceneLayers(
    );
  } finally {
  }
}

void sdkMapviewMapsceneLayersReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewMapsceneLayersReleaseHandle(handle);

// Nullable MapSceneLayers

final _sdkMapviewMapsceneLayersCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_Layers_create_handle_nullable'));
final _sdkMapviewMapsceneLayersReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_Layers_release_handle_nullable'));
final _sdkMapviewMapsceneLayersGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_Layers_get_value_nullable'));

Pointer<Void> sdkMapviewMapsceneLayersToFfiNullable(MapSceneLayers? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapsceneLayersToFfi(value);
  final result = _sdkMapviewMapsceneLayersCreateHandleNullable(_handle);
  sdkMapviewMapsceneLayersReleaseFfiHandle(_handle);
  return result;
}

MapSceneLayers? sdkMapviewMapsceneLayersFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapsceneLayersGetValueNullable(handle);
  final result = sdkMapviewMapsceneLayersFromFfi(_handle);
  sdkMapviewMapsceneLayersReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapsceneLayersReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapsceneLayersReleaseHandleNullable(handle);

// End of MapSceneLayers "private" section.
/// Called on the main thread after [MapScene.loadSceneFromConfigurationFileWithWatermarkStyle] has been completed.
typedef MapSceneLoadSceneCallback = void Function(MapError?);

// MapSceneLoadSceneCallback "private" section, not exported.

final _sdkMapviewMapsceneLoadscenecallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_register_finalizer'));
final _sdkMapviewMapsceneLoadscenecallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_copy_handle'));
final _sdkMapviewMapsceneLoadscenecallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_release_handle'));
final _sdkMapviewMapsceneLoadscenecallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_create_proxy'));

class MapSceneLoadSceneCallback$Impl {
  final Pointer<Void> handle;
  MapSceneLoadSceneCallback$Impl(this.handle);

  void call(MapError? p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_call__MapError_'));
    final _p0Handle = sdkMapviewMaperrorToFfiNullable(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    sdkMapviewMaperrorReleaseFfiHandleNullable(_p0Handle);

  }

}

int _sdkMapviewMapsceneLoadscenecallbackcallStatic(Object _obj, Pointer<Void> p0) {
  
  try {
    (_obj as MapSceneLoadSceneCallback)(sdkMapviewMaperrorFromFfiNullable(p0));
  } finally {
    sdkMapviewMaperrorReleaseFfiHandleNullable(p0);
  }
  return 0;
}

Pointer<Void> sdkMapviewMapsceneLoadscenecallbackToFfi(MapSceneLoadSceneCallback value) =>
  _sdkMapviewMapsceneLoadscenecallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_sdkMapviewMapsceneLoadscenecallbackcallStatic, __lib.unknownError)
  );

MapSceneLoadSceneCallback sdkMapviewMapsceneLoadscenecallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkMapviewMapsceneLoadscenecallbackCopyHandle(handle);
  final _impl = MapSceneLoadSceneCallback$Impl(_copiedHandle);
  final result = (MapError? p0) => _impl.call(p0);
  _sdkMapviewMapsceneLoadscenecallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapsceneLoadscenecallbackReleaseHandle(handle);

// Nullable MapSceneLoadSceneCallback

final _sdkMapviewMapsceneLoadscenecallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_create_handle_nullable'));
final _sdkMapviewMapsceneLoadscenecallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_release_handle_nullable'));
final _sdkMapviewMapsceneLoadscenecallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_get_value_nullable'));

Pointer<Void> sdkMapviewMapsceneLoadscenecallbackToFfiNullable(MapSceneLoadSceneCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapsceneLoadscenecallbackToFfi(value);
  final result = _sdkMapviewMapsceneLoadscenecallbackCreateHandleNullable(_handle);
  sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandle(_handle);
  return result;
}

MapSceneLoadSceneCallback? sdkMapviewMapsceneLoadscenecallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapsceneLoadscenecallbackGetValueNullable(handle);
  final result = sdkMapviewMapsceneLoadscenecallbackFromFfi(_handle);
  sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapsceneLoadscenecallbackReleaseHandleNullable(handle);

// End of MapSceneLoadSceneCallback "private" section.

// MapScene "private" section, not exported.

final _sdkMapviewMapsceneRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapScene_register_finalizer'));
final _sdkMapviewMapsceneCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_copy_handle'));
final _sdkMapviewMapsceneReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_release_handle'));





















class MapScene$Impl extends __lib.NativeBase implements MapScene {

  MapScene$Impl(Pointer<Void> handle) : super(handle);

  @override
  void loadSceneForMapScheme(MapScheme mapScheme, MapSceneLoadSceneCallback? callback) {
    final _loadSceneForMapSchemeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Pointer<Void>), void Function(Pointer<Void>, int, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_loadScene__MapScheme_LoadSceneCallback_'));
    final _mapSchemeHandle = sdkMapviewMapschemeToFfi(mapScheme);
    final _callbackHandle = sdkMapviewMapsceneLoadscenecallbackToFfiNullable(callback);
    final _handle = this.handle;
    _loadSceneForMapSchemeFfi(_handle, __lib.LibraryContext.isolateId, _mapSchemeHandle, _callbackHandle);
    sdkMapviewMapschemeReleaseFfiHandle(_mapSchemeHandle);
    sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandleNullable(_callbackHandle);

  }

  @override
  void loadSceneFromConfigurationFile(String configurationFile, MapSceneLoadSceneCallback? callback) {
    final _loadSceneFromConfigurationFileFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_loadScene__String_LoadSceneCallback_'));
    final _configurationFileHandle = stringToFfi(configurationFile);
    final _callbackHandle = sdkMapviewMapsceneLoadscenecallbackToFfiNullable(callback);
    final _handle = this.handle;
    _loadSceneFromConfigurationFileFfi(_handle, __lib.LibraryContext.isolateId, _configurationFileHandle, _callbackHandle);
    stringReleaseFfiHandle(_configurationFileHandle);
    sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandleNullable(_callbackHandle);

  }

  @override
  void loadSceneFromConfigurationFileWithWatermarkStyle(String configurationFile, WatermarkStyle watermarkStyle, MapSceneLoadSceneCallback? callback) {
    final _loadSceneFromConfigurationFileWithWatermarkStyleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_loadScene__String_WatermarkStyle_LoadSceneCallback_'));
    final _configurationFileHandle = stringToFfi(configurationFile);
    final _watermarkStyleHandle = sdkMapviewWatermarkstyleToFfi(watermarkStyle);
    final _callbackHandle = sdkMapviewMapsceneLoadscenecallbackToFfiNullable(callback);
    final _handle = this.handle;
    _loadSceneFromConfigurationFileWithWatermarkStyleFfi(_handle, __lib.LibraryContext.isolateId, _configurationFileHandle, _watermarkStyleHandle, _callbackHandle);
    stringReleaseFfiHandle(_configurationFileHandle);
    sdkMapviewWatermarkstyleReleaseFfiHandle(_watermarkStyleHandle);
    sdkMapviewMapsceneLoadscenecallbackReleaseFfiHandleNullable(_callbackHandle);

  }

  @override
  void addMapPolyline(MapPolyline mapPolyline) {
    final _addMapPolylineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapPolyline__MapPolyline'));
    final _mapPolylineHandle = sdkMapviewMappolylineToFfi(mapPolyline);
    final _handle = this.handle;
    _addMapPolylineFfi(_handle, __lib.LibraryContext.isolateId, _mapPolylineHandle);
    sdkMapviewMappolylineReleaseFfiHandle(_mapPolylineHandle);

  }

  @override
  void removeMapPolyline(MapPolyline mapPolyline) {
    final _removeMapPolylineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapPolyline__MapPolyline'));
    final _mapPolylineHandle = sdkMapviewMappolylineToFfi(mapPolyline);
    final _handle = this.handle;
    _removeMapPolylineFfi(_handle, __lib.LibraryContext.isolateId, _mapPolylineHandle);
    sdkMapviewMappolylineReleaseFfiHandle(_mapPolylineHandle);

  }

  @override
  void addMapArrow(MapArrow mapArrow) {
    final _addMapArrowFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapArrow__MapArrow'));
    final _mapArrowHandle = sdkMapviewMaparrowToFfi(mapArrow);
    final _handle = this.handle;
    _addMapArrowFfi(_handle, __lib.LibraryContext.isolateId, _mapArrowHandle);
    sdkMapviewMaparrowReleaseFfiHandle(_mapArrowHandle);

  }

  @override
  void removeMapArrow(MapArrow mapArrow) {
    final _removeMapArrowFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapArrow__MapArrow'));
    final _mapArrowHandle = sdkMapviewMaparrowToFfi(mapArrow);
    final _handle = this.handle;
    _removeMapArrowFfi(_handle, __lib.LibraryContext.isolateId, _mapArrowHandle);
    sdkMapviewMaparrowReleaseFfiHandle(_mapArrowHandle);

  }

  @override
  void addMapMarker(MapMarker marker) {
    final _addMapMarkerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapMarker__MapMarker'));
    final _markerHandle = sdkMapviewMapmarkerToFfi(marker);
    final _handle = this.handle;
    _addMapMarkerFfi(_handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarkerReleaseFfiHandle(_markerHandle);

  }

  @override
  void addMapMarkers(List<MapMarker> markers) {
    final _addMapMarkersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapMarkers__ListOf_sdk_mapview_MapMarker'));
    final _markersHandle = heresdkMapviewHarpBindingslistofSdkMapviewMapmarkerToFfi(markers);
    final _handle = this.handle;
    _addMapMarkersFfi(_handle, __lib.LibraryContext.isolateId, _markersHandle);
    heresdkMapviewHarpBindingslistofSdkMapviewMapmarkerReleaseFfiHandle(_markersHandle);

  }

  @override
  void removeMapMarker(MapMarker marker) {
    final _removeMapMarkerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapMarker__MapMarker'));
    final _markerHandle = sdkMapviewMapmarkerToFfi(marker);
    final _handle = this.handle;
    _removeMapMarkerFfi(_handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarkerReleaseFfiHandle(_markerHandle);

  }

  @override
  void removeMapMarkers(List<MapMarker> markers) {
    final _removeMapMarkersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapMarkers__ListOf_sdk_mapview_MapMarker'));
    final _markersHandle = heresdkMapviewHarpBindingslistofSdkMapviewMapmarkerToFfi(markers);
    final _handle = this.handle;
    _removeMapMarkersFfi(_handle, __lib.LibraryContext.isolateId, _markersHandle);
    heresdkMapviewHarpBindingslistofSdkMapviewMapmarkerReleaseFfiHandle(_markersHandle);

  }

  @override
  void addMapMarkerCluster(MapMarkerCluster cluster) {
    final _addMapMarkerClusterFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapMarkerCluster__MapMarkerCluster'));
    final _clusterHandle = sdkMapviewMapmarkerclusterToFfi(cluster);
    final _handle = this.handle;
    _addMapMarkerClusterFfi(_handle, __lib.LibraryContext.isolateId, _clusterHandle);
    sdkMapviewMapmarkerclusterReleaseFfiHandle(_clusterHandle);

  }

  @override
  void removeMapMarkerCluster(MapMarkerCluster cluster) {
    final _removeMapMarkerClusterFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapMarkerCluster__MapMarkerCluster'));
    final _clusterHandle = sdkMapviewMapmarkerclusterToFfi(cluster);
    final _handle = this.handle;
    _removeMapMarkerClusterFfi(_handle, __lib.LibraryContext.isolateId, _clusterHandle);
    sdkMapviewMapmarkerclusterReleaseFfiHandle(_clusterHandle);

  }

  @override
  void addMapMarker3d(MapMarker3D marker) {
    final _addMapMarker3dFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapMarker3d__MapMarker3D'));
    final _markerHandle = sdkMapviewMapmarker3dToFfi(marker);
    final _handle = this.handle;
    _addMapMarker3dFfi(_handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarker3dReleaseFfiHandle(_markerHandle);

  }

  @override
  void removeMapMarker3d(MapMarker3D marker) {
    final _removeMapMarker3dFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapMarker3d__MapMarker3D'));
    final _markerHandle = sdkMapviewMapmarker3dToFfi(marker);
    final _handle = this.handle;
    _removeMapMarker3dFfi(_handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarker3dReleaseFfiHandle(_markerHandle);

  }

  @override
  void addMapPolygon(MapPolygon mapPolygon) {
    final _addMapPolygonFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapPolygon__MapPolygon'));
    final _mapPolygonHandle = sdkMapviewMappolygonToFfi(mapPolygon);
    final _handle = this.handle;
    _addMapPolygonFfi(_handle, __lib.LibraryContext.isolateId, _mapPolygonHandle);
    sdkMapviewMappolygonReleaseFfiHandle(_mapPolygonHandle);

  }

  @override
  void removeMapPolygon(MapPolygon mapPolygon) {
    final _removeMapPolygonFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapPolygon__MapPolygon'));
    final _mapPolygonHandle = sdkMapviewMappolygonToFfi(mapPolygon);
    final _handle = this.handle;
    _removeMapPolygonFfi(_handle, __lib.LibraryContext.isolateId, _mapPolygonHandle);
    sdkMapviewMappolygonReleaseFfiHandle(_mapPolygonHandle);

  }

  @override
  void setLayerState(String layerName, MapSceneLayerState newState) {
    final _setLayerStateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint32), void Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapScene_setLayerState__String_LayerState'));
    final _layerNameHandle = stringToFfi(layerName);
    final _newStateHandle = sdkMapviewMapsceneLayerstateToFfi(newState);
    final _handle = this.handle;
    _setLayerStateFfi(_handle, __lib.LibraryContext.isolateId, _layerNameHandle, _newStateHandle);
    stringReleaseFfiHandle(_layerNameHandle);
    sdkMapviewMapsceneLayerstateReleaseFfiHandle(_newStateHandle);

  }

  @override
  void setLayerVisibility(String layerName, VisibilityState visibility) {
    final _setLayerVisibilityFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint32), void Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapScene_setLayerVisibility__String_VisibilityState'));
    final _layerNameHandle = stringToFfi(layerName);
    final _visibilityHandle = sdkMapviewVisibilitystateToFfi(visibility);
    final _handle = this.handle;
    _setLayerVisibilityFfi(_handle, __lib.LibraryContext.isolateId, _layerNameHandle, _visibilityHandle);
    stringReleaseFfiHandle(_layerNameHandle);
    sdkMapviewVisibilitystateReleaseFfiHandle(_visibilityHandle);

  }


}

Pointer<Void> sdkMapviewMapsceneToFfi(MapScene value) =>
  _sdkMapviewMapsceneCopyHandle((value as __lib.NativeBase).handle);

MapScene sdkMapviewMapsceneFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapScene) return instance;

  final _copiedHandle = _sdkMapviewMapsceneCopyHandle(handle);
  final result = MapScene$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapsceneRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapsceneReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapsceneReleaseHandle(handle);

Pointer<Void> sdkMapviewMapsceneToFfiNullable(MapScene? value) =>
  value != null ? sdkMapviewMapsceneToFfi(value) : Pointer<Void>.fromAddress(0);

MapScene? sdkMapviewMapsceneFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapsceneFromFfi(handle) : null;

void sdkMapviewMapsceneReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapsceneReleaseHandle(handle);

// End of MapScene "private" section.

