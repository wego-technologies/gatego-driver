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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/core/rectangle2_d.dart';
import 'package:here_sdk/src/sdk/core/size2_d.dart';
import 'package:here_sdk/src/sdk/gestures/gestures.dart';
import 'package:here_sdk/src/sdk/mapview/here_map_controller_core.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera.dart';
import 'package:here_sdk/src/sdk/mapview/map_context.dart';
import 'package:here_sdk/src/sdk/mapview/map_scene.dart';
import 'package:here_sdk/src/sdk/mapview/map_view_lifecycle_listener.dart';
import 'package:here_sdk/src/sdk/mapview/pick_map_features_result.dart';
import 'package:here_sdk/src/sdk/mapview/pick_map_items_result.dart';
import 'package:here_sdk/src/sdk/mapview/watermark_placement.dart';

/// Represents the available public API from  MapView.
abstract class MapViewBase {
  /// Represents the available public API from  MapView.

  factory MapViewBase(
    GeoCoordinates? Function(Point2D) viewToGeoCoordinatesLambda,
    Point2D? Function(GeoCoordinates) geoToViewCoordinatesLambda,
    void Function(WatermarkPlacement, int) setWatermarkPositionLambda,
    void Function(MapViewLifecycleListener) addLifecycleListenerLambda,
    void Function(MapViewLifecycleListener) removeLifecycleListenerLambda,
    void Function(Point2D, double, MapViewBasePickMapItemsCallback) pickMapItemsLambda,
    void Function(Rectangle2D, MapViewBasePickMapFeaturesCallback) pickMapFeaturesLambda,
    MapCamera Function() cameraGetLambda,
    Gestures Function() gesturesGetLambda,
    MapScene Function() mapSceneGetLambda,
    MapContext Function() mapContextGetLambda,
    HereMapControllerCore Function() hereMapControllerCoreGetLambda,
    Size2D Function() viewportSizeGetLambda,
    int Function() frameRateGetLambda,
    void Function(int) frameRateSetLambda,
    double Function() pixelScaleGetLambda
  ) => MapViewBase$Lambdas(
    viewToGeoCoordinatesLambda,
    geoToViewCoordinatesLambda,
    setWatermarkPositionLambda,
    addLifecycleListenerLambda,
    removeLifecycleListenerLambda,
    pickMapItemsLambda,
    pickMapFeaturesLambda,
    cameraGetLambda,
    gesturesGetLambda,
    mapSceneGetLambda,
    mapContextGetLambda,
    hereMapControllerCoreGetLambda,
    viewportSizeGetLambda,
    frameRateGetLambda,
    frameRateSetLambda,
    pixelScaleGetLambda
  );

  /// Converts view coordinates to geographical coordinates.
  ///
  /// If the MapView does not have a rendered surface attached,
  /// it will return `null`. This happens before a map scene is loaded
  /// or after the map view has been destroyed.
  ///
  /// [viewCoordinates] Point on the screen to convert.
  ///
  /// Returns [GeoCoordinates?]. The converted GeoCoordinate or `null` if there is no rendered
  /// surface attached.
  ///
  GeoCoordinates? viewToGeoCoordinates(Point2D viewCoordinates);
  /// Converts geographical coordinates to view coordinates.
  ///
  /// View coordinates might be outside of current viewport, i.e. result might contain values
  /// less than zero or greater than view's dimensions. If the MapView does not have a rendered
  /// surface attached, it will return `null`. This happens before a map scene is loaded
  /// or after the map view has been destroyed.
  ///
  /// [geoCoordinates] Geographical coordinates to convert.
  ///
  /// Returns [Point2D?]. The converted point on the map or `null` in cases described in
  /// the method description.
  ///
  Point2D? geoToViewCoordinates(GeoCoordinates geoCoordinates);
  /// Sets the HERE logo watermark location within the map view.
  ///
  /// Defaults to [WatermarkPlacement.bottomRight].
  /// It is recommended to change the default placement only when it
  /// is required due to overlapping UI elements.
  /// The margin will only be applied if the placement is equal to
  /// [WatermarkPlacement.bottomCenter].
  /// If the map view is smaller then half of the total screen size
  /// either horizontally or vertically then the watermark remains in
  /// the default position (bottom right). For map views that are smaller
  /// then 250 dip in width and height the watermark will not be shown.
  ///
  /// [placement] Placement of HERE logo watermark. For more details please see
  /// [WatermarkPlacement].
  ///
  /// [bottomCenterMargin] An optional margin for the distance to the bottom measured in physical pixels.
  /// The value zero corresponds to the default margin. The margin will always be
  /// set to zero (default margin) if the placement is not equal to
  /// [WatermarkPlacement.bottomCenter].
  ///
  void setWatermarkPosition(WatermarkPlacement placement, int bottomCenterMargin);
  /// Adds a [MapViewLifecycleListener] to this map view.
  ///
  /// Adding the same object multiple times has no effect.
  ///
  /// [lifecycleListener] An object to be notified of lifecycle events.
  ///
  void addLifecycleListener(MapViewLifecycleListener lifecycleListener);
  /// Removes a [MapViewLifecycleListener] from this map view.
  ///
  /// Trying to remove an object that was not added or was removed before
  /// has no effect.
  ///
  /// [lifecycleListener] An object to stop being notified of lifecycle events.
  ///
  void removeLifecycleListener(MapViewLifecycleListener lifecycleListener);
  /// Returns all map items located inside the specified pick area.
  ///
  /// The pick area is a circle
  /// defined by a center point and radius.
  ///
  /// [centerPoint] The center point of the pick area, in view coordinates.
  ///
  /// [radius] The radius of the pick area, in pixels.
  ///
  /// [callback] Callback to call with the result. This will be called on main thread when the operation
  /// has completed.
  ///
  void pickMapItems(Point2D centerPoint, double radius, MapViewBasePickMapItemsCallback callback);
  /// Returns all map features located inside the specified pick area.
  ///
  /// Pickable map features
  /// currently consist of embedded carto POI markers that are available on the map, by default.
  /// Only visible POIs can be picked, i.e. only
  /// those which categories were not hidden by `MapScene.setPoiVisibility` and those which aren't
  /// covered by any custom marker. The pick area is defined by a rectangle in view coordinates.
  ///
  /// Note: Map items that are added by the user can be picked with
  /// [MapViewBase.pickMapItems] instead.
  ///
  /// [viewRectangle] The rectangle inside which the objects should be picked in view coordinates.
  ///
  /// [callback] Callback to call with the result. This will be called on main thread when the operation
  /// has completed.
  ///
  void pickMapFeatures(Rectangle2D viewRectangle, MapViewBasePickMapFeaturesCallback callback);
  /// Gets the camera to control the view for the map.
  MapCamera get camera;

  /// Gets the gestures control object.
  Gestures get gestures;

  /// Gets the map scene associated with this map view.
  MapScene get mapScene;

  /// Gets the map context associated with this map view.
  MapContext get mapContext;

  /// Gets the [HereMapControllerCore] associated with this map view.
  HereMapControllerCore get hereMapControllerCore;

  /// Gets the viewport size in physical pixels. If the MapView does not have a rendered
  /// surface attached, Size2D with zero width and height is returned.
  Size2D get viewportSize;

  /// Gets maximum render frame rate in frames per second. The default value is 60 frames per second.
  int get frameRate;
  /// Sets maximum render frame rate in frames per second. Setting to 0 disables automatic rendering for this view. Setting negative values has no effect.
  set frameRate(int value);

  /// Gets the pixel scale factor used by this MapView.
  ///
  /// It is used to support screen resolution and size independence.
  /// This value is a derivative of the device's screen pixel density and is a direct analog of
  ///
  /// devicePixelRatio from FlutterView, ViewConfiguration or MediaQueryData.
  /// It can be used to translate between physical pixels and
  ///
  /// logical pixels
  /// according to the formula:
  ///
  /// logical_pixels = pixels / pixel_scale.
  double get pixelScale;

}

/// Callback after pick map items operation has completed.
///
/// If the pick operation failed,
/// `null` will be returned.
typedef MapViewBasePickMapItemsCallback = void Function(PickMapItemsResult?);

// MapViewBasePickMapItemsCallback "private" section, not exported.

final _sdkMapviewMapviewbasePickmapitemscallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_register_finalizer'));
final _sdkMapviewMapviewbasePickmapitemscallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_copy_handle'));
final _sdkMapviewMapviewbasePickmapitemscallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_release_handle'));
final _sdkMapviewMapviewbasePickmapitemscallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_create_proxy'));

class MapViewBasePickMapItemsCallback$Impl {
  final Pointer<Void> handle;
  MapViewBasePickMapItemsCallback$Impl(this.handle);

  void call(PickMapItemsResult? p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_call__PickMapItemsResult_'));
    final _p0Handle = sdkMapviewPickmapitemsresultToFfiNullable(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    sdkMapviewPickmapitemsresultReleaseFfiHandleNullable(_p0Handle);

  }

}

int _sdkMapviewMapviewbasePickmapitemscallbackcallStatic(Object _obj, Pointer<Void> p0) {
  
  try {
    (_obj as MapViewBasePickMapItemsCallback)(sdkMapviewPickmapitemsresultFromFfiNullable(p0));
  } finally {
    sdkMapviewPickmapitemsresultReleaseFfiHandleNullable(p0);
  }
  return 0;
}

Pointer<Void> sdkMapviewMapviewbasePickmapitemscallbackToFfi(MapViewBasePickMapItemsCallback value) =>
  _sdkMapviewMapviewbasePickmapitemscallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_sdkMapviewMapviewbasePickmapitemscallbackcallStatic, __lib.unknownError)
  );

MapViewBasePickMapItemsCallback sdkMapviewMapviewbasePickmapitemscallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkMapviewMapviewbasePickmapitemscallbackCopyHandle(handle);
  final _impl = MapViewBasePickMapItemsCallback$Impl(_copiedHandle);
  final result = (PickMapItemsResult? p0) => _impl.call(p0);
  _sdkMapviewMapviewbasePickmapitemscallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapviewbasePickmapitemscallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapviewbasePickmapitemscallbackReleaseHandle(handle);

// Nullable MapViewBasePickMapItemsCallback

final _sdkMapviewMapviewbasePickmapitemscallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_create_handle_nullable'));
final _sdkMapviewMapviewbasePickmapitemscallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_release_handle_nullable'));
final _sdkMapviewMapviewbasePickmapitemscallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_get_value_nullable'));

Pointer<Void> sdkMapviewMapviewbasePickmapitemscallbackToFfiNullable(MapViewBasePickMapItemsCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapviewbasePickmapitemscallbackToFfi(value);
  final result = _sdkMapviewMapviewbasePickmapitemscallbackCreateHandleNullable(_handle);
  sdkMapviewMapviewbasePickmapitemscallbackReleaseFfiHandle(_handle);
  return result;
}

MapViewBasePickMapItemsCallback? sdkMapviewMapviewbasePickmapitemscallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapviewbasePickmapitemscallbackGetValueNullable(handle);
  final result = sdkMapviewMapviewbasePickmapitemscallbackFromFfi(_handle);
  sdkMapviewMapviewbasePickmapitemscallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapviewbasePickmapitemscallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapviewbasePickmapitemscallbackReleaseHandleNullable(handle);

// End of MapViewBasePickMapItemsCallback "private" section.
/// Callback after pick map features operation has completed.
///
/// If the pick operation failed,
/// `null` will be returned.
typedef MapViewBasePickMapFeaturesCallback = void Function(PickMapFeaturesResult?);

// MapViewBasePickMapFeaturesCallback "private" section, not exported.

final _sdkMapviewMapviewbasePickmapfeaturescallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapFeaturesCallback_register_finalizer'));
final _sdkMapviewMapviewbasePickmapfeaturescallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapFeaturesCallback_copy_handle'));
final _sdkMapviewMapviewbasePickmapfeaturescallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapFeaturesCallback_release_handle'));
final _sdkMapviewMapviewbasePickmapfeaturescallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapFeaturesCallback_create_proxy'));

class MapViewBasePickMapFeaturesCallback$Impl {
  final Pointer<Void> handle;
  MapViewBasePickMapFeaturesCallback$Impl(this.handle);

  void call(PickMapFeaturesResult? p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_PickMapFeaturesCallback_call__PickMapFeaturesResult_'));
    final _p0Handle = sdkMapviewPickmapfeaturesresultToFfiNullable(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    sdkMapviewPickmapfeaturesresultReleaseFfiHandleNullable(_p0Handle);

  }

}

int _sdkMapviewMapviewbasePickmapfeaturescallbackcallStatic(Object _obj, Pointer<Void> p0) {
  
  try {
    (_obj as MapViewBasePickMapFeaturesCallback)(sdkMapviewPickmapfeaturesresultFromFfiNullable(p0));
  } finally {
    sdkMapviewPickmapfeaturesresultReleaseFfiHandleNullable(p0);
  }
  return 0;
}

Pointer<Void> sdkMapviewMapviewbasePickmapfeaturescallbackToFfi(MapViewBasePickMapFeaturesCallback value) =>
  _sdkMapviewMapviewbasePickmapfeaturescallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_sdkMapviewMapviewbasePickmapfeaturescallbackcallStatic, __lib.unknownError)
  );

MapViewBasePickMapFeaturesCallback sdkMapviewMapviewbasePickmapfeaturescallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkMapviewMapviewbasePickmapfeaturescallbackCopyHandle(handle);
  final _impl = MapViewBasePickMapFeaturesCallback$Impl(_copiedHandle);
  final result = (PickMapFeaturesResult? p0) => _impl.call(p0);
  _sdkMapviewMapviewbasePickmapfeaturescallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapviewbasePickmapfeaturescallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapviewbasePickmapfeaturescallbackReleaseHandle(handle);

// Nullable MapViewBasePickMapFeaturesCallback

final _sdkMapviewMapviewbasePickmapfeaturescallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapFeaturesCallback_create_handle_nullable'));
final _sdkMapviewMapviewbasePickmapfeaturescallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapFeaturesCallback_release_handle_nullable'));
final _sdkMapviewMapviewbasePickmapfeaturescallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapFeaturesCallback_get_value_nullable'));

Pointer<Void> sdkMapviewMapviewbasePickmapfeaturescallbackToFfiNullable(MapViewBasePickMapFeaturesCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapviewbasePickmapfeaturescallbackToFfi(value);
  final result = _sdkMapviewMapviewbasePickmapfeaturescallbackCreateHandleNullable(_handle);
  sdkMapviewMapviewbasePickmapfeaturescallbackReleaseFfiHandle(_handle);
  return result;
}

MapViewBasePickMapFeaturesCallback? sdkMapviewMapviewbasePickmapfeaturescallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapviewbasePickmapfeaturescallbackGetValueNullable(handle);
  final result = sdkMapviewMapviewbasePickmapfeaturescallbackFromFfi(_handle);
  sdkMapviewMapviewbasePickmapfeaturescallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapviewbasePickmapfeaturescallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapviewbasePickmapfeaturescallbackReleaseHandleNullable(handle);

// End of MapViewBasePickMapFeaturesCallback "private" section.

// MapViewBase "private" section, not exported.

final _sdkMapviewMapviewbaseRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapViewBase_register_finalizer'));
final _sdkMapviewMapviewbaseCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_copy_handle'));
final _sdkMapviewMapviewbaseReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_release_handle'));
final _sdkMapviewMapviewbaseCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_mapview_MapViewBase_create_proxy'));
final _sdkMapviewMapviewbaseGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_get_type_id'));








class MapViewBase$Lambdas implements MapViewBase {
  GeoCoordinates? Function(Point2D) viewToGeoCoordinatesLambda;
  Point2D? Function(GeoCoordinates) geoToViewCoordinatesLambda;
  void Function(WatermarkPlacement, int) setWatermarkPositionLambda;
  void Function(MapViewLifecycleListener) addLifecycleListenerLambda;
  void Function(MapViewLifecycleListener) removeLifecycleListenerLambda;
  void Function(Point2D, double, MapViewBasePickMapItemsCallback) pickMapItemsLambda;
  void Function(Rectangle2D, MapViewBasePickMapFeaturesCallback) pickMapFeaturesLambda;
  MapCamera Function() cameraGetLambda;
  Gestures Function() gesturesGetLambda;
  MapScene Function() mapSceneGetLambda;
  MapContext Function() mapContextGetLambda;
  HereMapControllerCore Function() hereMapControllerCoreGetLambda;
  Size2D Function() viewportSizeGetLambda;
  int Function() frameRateGetLambda;
  void Function(int) frameRateSetLambda;
  double Function() pixelScaleGetLambda;

  MapViewBase$Lambdas(
    this.viewToGeoCoordinatesLambda,
    this.geoToViewCoordinatesLambda,
    this.setWatermarkPositionLambda,
    this.addLifecycleListenerLambda,
    this.removeLifecycleListenerLambda,
    this.pickMapItemsLambda,
    this.pickMapFeaturesLambda,
    this.cameraGetLambda,
    this.gesturesGetLambda,
    this.mapSceneGetLambda,
    this.mapContextGetLambda,
    this.hereMapControllerCoreGetLambda,
    this.viewportSizeGetLambda,
    this.frameRateGetLambda,
    this.frameRateSetLambda,
    this.pixelScaleGetLambda
  );

  @override
  GeoCoordinates? viewToGeoCoordinates(Point2D viewCoordinates) =>
    viewToGeoCoordinatesLambda(viewCoordinates);
  @override
  Point2D? geoToViewCoordinates(GeoCoordinates geoCoordinates) =>
    geoToViewCoordinatesLambda(geoCoordinates);
  @override
  void setWatermarkPosition(WatermarkPlacement placement, int bottomCenterMargin) =>
    setWatermarkPositionLambda(placement, bottomCenterMargin);
  @override
  void addLifecycleListener(MapViewLifecycleListener lifecycleListener) =>
    addLifecycleListenerLambda(lifecycleListener);
  @override
  void removeLifecycleListener(MapViewLifecycleListener lifecycleListener) =>
    removeLifecycleListenerLambda(lifecycleListener);
  @override
  void pickMapItems(Point2D centerPoint, double radius, MapViewBasePickMapItemsCallback callback) =>
    pickMapItemsLambda(centerPoint, radius, callback);
  @override
  void pickMapFeatures(Rectangle2D viewRectangle, MapViewBasePickMapFeaturesCallback callback) =>
    pickMapFeaturesLambda(viewRectangle, callback);
  @override
  MapCamera get camera => cameraGetLambda();
  @override
  Gestures get gestures => gesturesGetLambda();
  @override
  MapScene get mapScene => mapSceneGetLambda();
  @override
  MapContext get mapContext => mapContextGetLambda();
  @override
  HereMapControllerCore get hereMapControllerCore => hereMapControllerCoreGetLambda();
  @override
  Size2D get viewportSize => viewportSizeGetLambda();
  @override
  int get frameRate => frameRateGetLambda();
  @override
  set frameRate(int value) => frameRateSetLambda(value);
  @override
  double get pixelScale => pixelScaleGetLambda();
}

class MapViewBase$Impl extends __lib.NativeBase implements MapViewBase {

  MapViewBase$Impl(Pointer<Void> handle) : super(handle);

  @override
  GeoCoordinates? viewToGeoCoordinates(Point2D viewCoordinates) {
    final _viewToGeoCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_viewToGeoCoordinates__Point2D'));
    final _viewCoordinatesHandle = sdkCorePoint2dToFfi(viewCoordinates);
    final _handle = this.handle;
    final __resultHandle = _viewToGeoCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _viewCoordinatesHandle);
    sdkCorePoint2dReleaseFfiHandle(_viewCoordinatesHandle);
    try {
      return sdkCoreGeocoordinatesFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  Point2D? geoToViewCoordinates(GeoCoordinates geoCoordinates) {
    final _geoToViewCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_geoToViewCoordinates__GeoCoordinates'));
    final _geoCoordinatesHandle = sdkCoreGeocoordinatesToFfi(geoCoordinates);
    final _handle = this.handle;
    final __resultHandle = _geoToViewCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _geoCoordinatesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_geoCoordinatesHandle);
    try {
      return sdkCorePoint2dFromFfiNullable(__resultHandle);
    } finally {
      sdkCorePoint2dReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  void setWatermarkPosition(WatermarkPlacement placement, int bottomCenterMargin) {
    final _setWatermarkPositionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Uint32), void Function(Pointer<Void>, int, int, int)>('here_sdk_sdk_mapview_MapViewBase_setWatermarkPosition__WatermarkPlacement_UInt'));
    final _placementHandle = sdkMapviewWatermarkplacementToFfi(placement);
    final _bottomCenterMarginHandle = (bottomCenterMargin);
    final _handle = this.handle;
    _setWatermarkPositionFfi(_handle, __lib.LibraryContext.isolateId, _placementHandle, _bottomCenterMarginHandle);
    sdkMapviewWatermarkplacementReleaseFfiHandle(_placementHandle);


  }

  @override
  void addLifecycleListener(MapViewLifecycleListener lifecycleListener) {
    final _addLifecycleListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_addLifecycleListener__MapViewLifecycleListener'));
    final _lifecycleListenerHandle = sdkMapviewMapviewlifecyclelistenerToFfi(lifecycleListener);
    final _handle = this.handle;
    _addLifecycleListenerFfi(_handle, __lib.LibraryContext.isolateId, _lifecycleListenerHandle);
    sdkMapviewMapviewlifecyclelistenerReleaseFfiHandle(_lifecycleListenerHandle);

  }

  @override
  void removeLifecycleListener(MapViewLifecycleListener lifecycleListener) {
    final _removeLifecycleListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_removeLifecycleListener__MapViewLifecycleListener'));
    final _lifecycleListenerHandle = sdkMapviewMapviewlifecyclelistenerToFfi(lifecycleListener);
    final _handle = this.handle;
    _removeLifecycleListenerFfi(_handle, __lib.LibraryContext.isolateId, _lifecycleListenerHandle);
    sdkMapviewMapviewlifecyclelistenerReleaseFfiHandle(_lifecycleListenerHandle);

  }

  @override
  void pickMapItems(Point2D centerPoint, double radius, MapViewBasePickMapItemsCallback callback) {
    final _pickMapItemsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Double, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_pickMapItems__Point2D_Double_PickMapItemsCallback'));
    final _centerPointHandle = sdkCorePoint2dToFfi(centerPoint);
    final _radiusHandle = (radius);
    final _callbackHandle = sdkMapviewMapviewbasePickmapitemscallbackToFfi(callback);
    final _handle = this.handle;
    _pickMapItemsFfi(_handle, __lib.LibraryContext.isolateId, _centerPointHandle, _radiusHandle, _callbackHandle);
    sdkCorePoint2dReleaseFfiHandle(_centerPointHandle);

    sdkMapviewMapviewbasePickmapitemscallbackReleaseFfiHandle(_callbackHandle);

  }

  @override
  void pickMapFeatures(Rectangle2D viewRectangle, MapViewBasePickMapFeaturesCallback callback) {
    final _pickMapFeaturesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_pickMapFeatures__Rectangle2D_PickMapFeaturesCallback'));
    final _viewRectangleHandle = sdkCoreRectangle2dToFfi(viewRectangle);
    final _callbackHandle = sdkMapviewMapviewbasePickmapfeaturescallbackToFfi(callback);
    final _handle = this.handle;
    _pickMapFeaturesFfi(_handle, __lib.LibraryContext.isolateId, _viewRectangleHandle, _callbackHandle);
    sdkCoreRectangle2dReleaseFfiHandle(_viewRectangleHandle);
    sdkMapviewMapviewbasePickmapfeaturescallbackReleaseFfiHandle(_callbackHandle);

  }

  /// Gets the camera to control the view for the map.
  MapCamera get camera {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_camera_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapcameraFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraReleaseFfiHandle(__resultHandle);

    }

  }


  /// Gets the gestures control object.
  Gestures get gestures {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_gestures_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkGesturesGesturesFromFfi(__resultHandle);
    } finally {
      sdkGesturesGesturesReleaseFfiHandle(__resultHandle);

    }

  }


  /// Gets the map scene associated with this map view.
  MapScene get mapScene {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_mapScene_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapsceneFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapsceneReleaseFfiHandle(__resultHandle);

    }

  }


  /// Gets the map context associated with this map view.
  MapContext get mapContext {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_mapContext_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapcontextFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcontextReleaseFfiHandle(__resultHandle);

    }

  }


  /// Gets the [HereMapControllerCore] associated with this map view.
  HereMapControllerCore get hereMapControllerCore {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_hereMap_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewHeremapFromFfi(__resultHandle);
    } finally {
      sdkMapviewHeremapReleaseFfiHandle(__resultHandle);

    }

  }


  /// Gets the viewport size in physical pixels. If the MapView does not have a rendered
  /// surface attached, Size2D with zero width and height is returned.
  Size2D get viewportSize {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_viewportSize_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreSize2dFromFfi(__resultHandle);
    } finally {
      sdkCoreSize2dReleaseFfiHandle(__resultHandle);

    }

  }


  /// Gets maximum render frame rate in frames per second. The default value is 60 frames per second.
  int get frameRate {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_frameRate_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  /// Sets maximum render frame rate in frames per second. Setting to 0 disables automatic rendering for this view. Setting negative values has no effect.
  set frameRate(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapViewBase_frameRate_set__Int'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  /// Gets the pixel scale factor used by this MapView.
  ///
  /// It is used to support screen resolution and size independence.
  /// This value is a derivative of the device's screen pixel density and is a direct analog of
  ///
  /// devicePixelRatio from FlutterView, ViewConfiguration or MediaQueryData.
  /// It can be used to translate between physical pixels and
  ///
  /// logical pixels
  /// according to the formula:
  ///
  /// logical_pixels = pixels / pixel_scale.
  double get pixelScale {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_pixelScale_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }



}

int _sdkMapviewMapviewbaseviewToGeoCoordinatesStatic(Object _obj, Pointer<Void> viewCoordinates, Pointer<Pointer<Void>> _result) {
  GeoCoordinates? _resultObject;
  try {
    _resultObject = (_obj as MapViewBase).viewToGeoCoordinates(sdkCorePoint2dFromFfi(viewCoordinates));
    _result.value = sdkCoreGeocoordinatesToFfiNullable(_resultObject);
  } finally {
    sdkCorePoint2dReleaseFfiHandle(viewCoordinates);
  }
  return 0;
}
int _sdkMapviewMapviewbasegeoToViewCoordinatesStatic(Object _obj, Pointer<Void> geoCoordinates, Pointer<Pointer<Void>> _result) {
  Point2D? _resultObject;
  try {
    _resultObject = (_obj as MapViewBase).geoToViewCoordinates(sdkCoreGeocoordinatesFromFfi(geoCoordinates));
    _result.value = sdkCorePoint2dToFfiNullable(_resultObject);
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandle(geoCoordinates);
  }
  return 0;
}
int _sdkMapviewMapviewbasesetWatermarkPositionStatic(Object _obj, int placement, int bottomCenterMargin) {

  try {
    (_obj as MapViewBase).setWatermarkPosition(sdkMapviewWatermarkplacementFromFfi(placement), (bottomCenterMargin));
  } finally {
    sdkMapviewWatermarkplacementReleaseFfiHandle(placement);
    
  }
  return 0;
}
int _sdkMapviewMapviewbaseaddLifecycleListenerStatic(Object _obj, Pointer<Void> lifecycleListener) {

  try {
    (_obj as MapViewBase).addLifecycleListener(sdkMapviewMapviewlifecyclelistenerFromFfi(lifecycleListener));
  } finally {
    sdkMapviewMapviewlifecyclelistenerReleaseFfiHandle(lifecycleListener);
  }
  return 0;
}
int _sdkMapviewMapviewbaseremoveLifecycleListenerStatic(Object _obj, Pointer<Void> lifecycleListener) {

  try {
    (_obj as MapViewBase).removeLifecycleListener(sdkMapviewMapviewlifecyclelistenerFromFfi(lifecycleListener));
  } finally {
    sdkMapviewMapviewlifecyclelistenerReleaseFfiHandle(lifecycleListener);
  }
  return 0;
}
int _sdkMapviewMapviewbasepickMapItemsStatic(Object _obj, Pointer<Void> centerPoint, double radius, Pointer<Void> callback) {

  try {
    (_obj as MapViewBase).pickMapItems(sdkCorePoint2dFromFfi(centerPoint), (radius), sdkMapviewMapviewbasePickmapitemscallbackFromFfi(callback));
  } finally {
    sdkCorePoint2dReleaseFfiHandle(centerPoint);
    
    sdkMapviewMapviewbasePickmapitemscallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkMapviewMapviewbasepickMapFeaturesStatic(Object _obj, Pointer<Void> viewRectangle, Pointer<Void> callback) {

  try {
    (_obj as MapViewBase).pickMapFeatures(sdkCoreRectangle2dFromFfi(viewRectangle), sdkMapviewMapviewbasePickmapfeaturescallbackFromFfi(callback));
  } finally {
    sdkCoreRectangle2dReleaseFfiHandle(viewRectangle);
    sdkMapviewMapviewbasePickmapfeaturescallbackReleaseFfiHandle(callback);
  }
  return 0;
}

int _sdkMapviewMapviewbasecameraGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkMapviewMapcameraToFfi((_obj as MapViewBase).camera);
  return 0;
}
int _sdkMapviewMapviewbasegesturesGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkGesturesGesturesToFfi((_obj as MapViewBase).gestures);
  return 0;
}
int _sdkMapviewMapviewbasemapSceneGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkMapviewMapsceneToFfi((_obj as MapViewBase).mapScene);
  return 0;
}
int _sdkMapviewMapviewbasemapContextGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkMapviewMapcontextToFfi((_obj as MapViewBase).mapContext);
  return 0;
}
int _sdkMapviewMapviewbasehereMapControllerCoreGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkMapviewHeremapToFfi((_obj as MapViewBase).hereMapControllerCore);
  return 0;
}
int _sdkMapviewMapviewbaseviewportSizeGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkCoreSize2dToFfi((_obj as MapViewBase).viewportSize);
  return 0;
}
int _sdkMapviewMapviewbaseframeRateGetStatic(Object _obj, Pointer<Int32> _result) {
  _result.value = ((_obj as MapViewBase).frameRate);
  return 0;
}

int _sdkMapviewMapviewbaseframeRateSetStatic(Object _obj, int _value) {
  try {
    (_obj as MapViewBase).frameRate =
      (_value);
  } finally {
    
  }
  return 0;
}
int _sdkMapviewMapviewbasepixelScaleGetStatic(Object _obj, Pointer<Double> _result) {
  _result.value = ((_obj as MapViewBase).pixelScale);
  return 0;
}

Pointer<Void> sdkMapviewMapviewbaseToFfi(MapViewBase value) {
  if (value is __lib.NativeBase) return _sdkMapviewMapviewbaseCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkMapviewMapviewbaseCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkMapviewMapviewbaseviewToGeoCoordinatesStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkMapviewMapviewbasegeoToViewCoordinatesStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint32, Uint32)>(_sdkMapviewMapviewbasesetWatermarkPositionStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkMapviewMapviewbaseaddLifecycleListenerStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkMapviewMapviewbaseremoveLifecycleListenerStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Double, Pointer<Void>)>(_sdkMapviewMapviewbasepickMapItemsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkMapviewMapviewbasepickMapFeaturesStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkMapviewMapviewbasecameraGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkMapviewMapviewbasegesturesGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkMapviewMapviewbasemapSceneGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkMapviewMapviewbasemapContextGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkMapviewMapviewbasehereMapControllerCoreGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkMapviewMapviewbaseviewportSizeGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Int32>)>(_sdkMapviewMapviewbaseframeRateGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Int32)>(_sdkMapviewMapviewbaseframeRateSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Double>)>(_sdkMapviewMapviewbasepixelScaleGetStatic, __lib.unknownError)
  );

  return result;
}

MapViewBase sdkMapviewMapviewbaseFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapViewBase) return instance;

  final _typeIdHandle = _sdkMapviewMapviewbaseGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMapviewbaseCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapViewBase$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapviewbaseRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapviewbaseReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapviewbaseReleaseHandle(handle);

Pointer<Void> sdkMapviewMapviewbaseToFfiNullable(MapViewBase? value) =>
  value != null ? sdkMapviewMapviewbaseToFfi(value) : Pointer<Void>.fromAddress(0);

MapViewBase? sdkMapviewMapviewbaseFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapviewbaseFromFfi(handle) : null;

void sdkMapviewMapviewbaseReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapviewbaseReleaseHandle(handle);

// End of MapViewBase "private" section.

