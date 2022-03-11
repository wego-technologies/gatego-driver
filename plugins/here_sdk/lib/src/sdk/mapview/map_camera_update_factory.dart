// Copyright (c) 2019-2022 HERE Global B.V. and its affiliate(s).
// All rights reserved.
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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/anchor2_d.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates_update.dart';
import 'package:here_sdk/src/sdk/core/geo_orientation_update.dart';
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/core/rectangle2_d.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera_update.dart';
import 'package:here_sdk/src/sdk/mapview/map_measure.dart';
import 'package:meta/meta.dart';

/// Factory for creating MapCameraUpdate to change map's camera
abstract class MapCameraUpdateFactory {

  /// Creates an update to position the map camera to look at the given target,
  /// preserving the current orientation at look-at target and map measure.
  ///
  /// Any target sub-element value that is not finite will be excluded from the update.
  ///
  /// [target] The look-at target position in geodetic coordinates.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate lookAtPoint(GeoCoordinatesUpdate target) => $prototype.lookAtPoint(target);
  /// Creates an update to position the map camera to look at the given target with the given
  /// orientation preserving the current map measure (zoom level/distance/scale)
  /// Any target or orientation sub-element value that is not finite will be excluded from the update.
  ///
  /// [target] The look-at target position in geodetic coordinates.
  ///
  /// [orientation] Geodetic orientation at look-at target.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate lookAtPointWithOrientation(GeoCoordinatesUpdate target, GeoOrientationUpdate orientation) => $prototype.lookAtPointWithOrientation(target, orientation);
  /// Creates an update to position the map camera to look at the given target with the given
  /// map measure preserving the current orientation at look-at target.
  ///
  /// Any target sub-element value that is not finite will be excluded from the update.
  /// If the map measure is not valid, the current map camera distance to the target point is preserved.
  ///
  /// [target] The look-at target position in geodetic coordinates.
  ///
  /// [measure] The desired map measure.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate lookAtPointWithMeasure(GeoCoordinatesUpdate target, MapMeasure measure) => $prototype.lookAtPointWithMeasure(target, measure);
  /// Creates an update to position the map camera to look at the given target with the given
  /// orientation and map measure.
  ///
  /// Any target or orientation sub-element value that is not finite will be excluded from the update.
  /// If the map measure is not valid, the current map camera distance to the target point is preserved.
  ///
  /// [target] The look-at target position in geodetic coordinates.
  ///
  /// [orientation] Geodetic orientation at look-at target.
  ///
  /// [measure] The desired map measure.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate lookAtPointWithGeoOrientationAndMeasure(GeoCoordinatesUpdate target, GeoOrientationUpdate orientation, MapMeasure measure) => $prototype.lookAtPointWithGeoOrientationAndMeasure(target, orientation, measure);
  /// Create an update to look at the given geo locations and fit them inside the given rectangle,
  /// obeying a map measure limit.
  ///
  /// If points parameter is empty, no update will be applied to the camera.
  /// If view rectangle is not valid, fully or partially out of viewport bounds, the viewport bounds will be used instead.
  /// Orientation sub-elements that are not finite will be excluded from the update.
  /// If measure limit is not valid, no update will be applied to the map camera.
  ///
  /// [points] Array of points in geodetic space that should be visible inside the given view rectangle.
  /// For each point, an invalid altitude is clamped to 0m MSL.
  ///
  /// [viewRectangle] View rectangle in viewport pixel coordinates.
  ///
  /// [orientation] Geodetic orientation at the new calculated target point.
  ///
  /// [measureLimit] Map measure limit:
  /// - as distance: the minimum distance from map camera to earth surface at the center of the view rectangle in meters.
  ///   The map camera should not be positioned closer to the center of view rectangle than this.
  /// - as zoom level: the maximum zoom level for the new map camera state. Internally converted to minimum distance
  ///   from map camera to earth surface at the center of view rectangle in meters. This is not the zoom level for
  ///   the calculated lookAt target point. Can be used to not zoom closer than a given level.
  /// - as scale: the minimum scale for the new map camera state. Internally converted to minimum distance
  ///   from map camera to earth surface at the center of view rectangle in meters. This is not the scale for
  ///   the calculated lookAt target point.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate lookAtPoints(List<GeoCoordinates> points, Rectangle2D viewRectangle, GeoOrientationUpdate orientation, MapMeasure measureLimit) => $prototype.lookAtPoints(points, viewRectangle, orientation, measureLimit);
  /// Creates an update to position the camera to look at the given target with the given
  /// orientation and obeying map measure limits, so that the given geo locations are inside the given rectangle.
  ///
  /// Such position update can possibly not be found.
  /// Any target or orientation sub-element value that is not finite will be excluded from the update.
  /// If points parameter is empty, no update will be applied to the map camera.
  /// If view rectangle is not valid, fully or partially out of viewport bounds, the viewport bounds will be used instead.
  /// If map measures are not valid, no update will be applied to the map camera.
  ///
  /// [target] The look-at target position in geodetic coordinates.
  ///
  /// [orientation] Geodetic orientation at look-at target.
  ///
  /// [points] Array of points in geodetic space that should be visible inside the given view rectangle.
  /// For each point, an invalid altitude is clamped to 0m MSL.
  ///
  /// [viewRectangle] View rectangle in viewport coordinates inside which the geographical points are displayed.
  ///
  /// [minMeasure] Minimum map measure:
  /// - as distance: the minimum distance from map camera to earth surface at the look-at target in meters.
  ///   The map camera should not be positioned closer to target than this.
  /// - as zoom level: the maximum zoom level for the new map camera state. Internally converted to minimum distance
  ///   from map camera to earth surface at the look-at target in meters.
  ///   Can be used to not zoom closer than a given level.
  /// - as scale: the minimum scale for the new map camera state. Internally converted to minimum distance
  ///   from map camera to earth surface at the look-at target in meters.
  ///
  /// [maxMeasure] Maximum map measure:
  /// - as distance: the maximum distance from map camera to earth surface at the look-at target in meters.
  ///   The map camera should not be positioned further from target than this.
  /// - as zoom level: the minimum zoom level for the new map camera state. Internally converted to minimum distance
  ///   from map camera to earth surface at the look-at target in meters.
  ///   Can be used to not zoom further than a given level.
  /// - as scale: the maximum scale for the new map camera state. Internally converted to minimum distance
  ///   from map camera to earth surface at the look-at target in meters.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate lookAtTargetAndPoints(GeoCoordinatesUpdate target, GeoOrientationUpdate orientation, List<GeoCoordinates> points, Rectangle2D viewRectangle, MapMeasure minMeasure, MapMeasure maxMeasure) => $prototype.lookAtTargetAndPoints(target, orientation, points, viewRectangle, minMeasure, maxMeasure);
  /// Create an update to look at the given geo-box and fit it inside the given rectangle.
  ///
  /// If geoBox is not valid, no update will be applied to the map camera.
  /// If view rectangle is not valid, fully or partially out of viewport bounds, the viewport bounds will be used instead.
  /// Orientation sub-elements that are not finite will be excluded from the update.
  /// In cases where it is not possible to find a solution for the given parameters,
  /// the resulting MapCameraUpdate will not change the map camera.
  ///
  /// [target] Geodetic box that should be visible inside the given view rectangle.
  /// For each corner of the box, an invalid altitude is clamped to 0m MSL.
  ///
  /// [orientation] Geodetic orientation at the target point.
  ///
  /// [viewRectangle] View rectangle in viewport pixel coordinates.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate lookAtAreaWithGeoOrientationAndViewRectangle(GeoBox target, GeoOrientationUpdate orientation, Rectangle2D viewRectangle) => $prototype.lookAtAreaWithGeoOrientationAndViewRectangle(target, orientation, viewRectangle);
  /// Creates an update to look at the given geo-box and fit it inside the given rectangle,
  /// preserving current orientation and zooming at the center of view rectangle.
  ///
  /// If geoBox is not valid, no update will be applied to the map camera.
  /// If view rectangle is not valid, fully or partially out of viewport bounds, the viewport bounds will be used instead.
  /// In cases where it is not possible to find a solution for the given parameters,
  /// the resulting MapCameraUpdate will not change the map camera.
  ///
  /// [target] Geodetic box that should be visible inside the given view rectangle.
  /// For each corner of the box, an invalid altitude is clamped to 0m MSL.
  ///
  /// [viewRectangle] View rectangle in viewport pixel coordinates.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate lookAtAreaWithViewRectangle(GeoBox target, Rectangle2D viewRectangle) => $prototype.lookAtAreaWithViewRectangle(target, viewRectangle);
  /// Creates an update to look at the given geo-box,
  /// preserving current orientation and zooming at the center of viewport.
  ///
  /// If geoBox is not valid, no update will be applied to the map camera.
  ///
  /// [target] Geodetic box that should be visible inside the viewport rectangle.
  /// For each corner of the box, an invalid altitude is clamped to 0m MSL.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate lookAtArea(GeoBox target) => $prototype.lookAtArea(target);
  /// Creates an update to pan map camera over the map by the specified number of pixels
  /// in the x and y direction starting from current principal point position.
  ///
  /// [xOffset] X offset in pixels
  ///
  /// [yOffset] Y offset in pixels
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate panBy(double xOffset, double yOffset) => $prototype.panBy(xOffset, yOffset);
  /// Creates an update to orbit map camera around a pixel origin by specified geodetic orientation delta.
  ///
  /// If the origin cannot be converted to geo coordinates, no update will be applied to the map camera.
  /// Orientation elements that are not valid will be excluded from the update.
  /// Resulting bearing values are wrapped around degrees range \[0, 360\].
  /// Resulting tilt values are clamped inside degrees range \[0, 180\].
  /// Resulting roll values are wrapped around degrees range \[-180, 180\].
  ///
  /// [delta] Geodetic orientation delta update.
  ///
  /// [origin] Screen pixel origin of rotation.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate orbitBy(GeoOrientationUpdate delta, Point2D origin) => $prototype.orbitBy(delta, origin);
  /// Creates an update to change map camera orientation by specified geodetic orientation delta.
  ///
  /// Orientation elements that are not valid will be excluded from the update.
  /// Resulting bearing values are wrapped around degrees range \[0, 360\].
  /// Resulting tilt values are clamped inside degrees range \[0, 180\].
  /// Resulting roll values are wrapped around degrees range \[-180, 180\].
  ///
  /// [delta] Geodetic orientation delta update.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate rotateBy(GeoOrientationUpdate delta) => $prototype.rotateBy(delta);
  /// Creates an update to zoom map camera by a given factor preserving a given focus point.
  ///
  /// Values greater than 1 zoom in map camera, by moving it closer to the ground; less than 1 - zoom out,
  /// which moves map camera further.
  /// If factor is zero, negative or not finite, no update will be applied to the map camera.
  /// If the focusPoint is not inside the viewport bounds, then the current principal point will be used.
  ///
  /// [factor] Zooming factor.
  ///
  /// [origin] Pixel location on the screen to use as zoom origin.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate zoomBy(double factor, Point2D origin) => $prototype.zoomBy(factor, origin);
  /// Creates an update to move map camera's viewpoint to a particular zoom level by adjusting its position.
  ///
  /// If zoomLevel is not finite, no update will be applied to the map camera.
  ///
  /// [zoomLevel] The desired zoom level.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate zoomTo(double zoomLevel) => $prototype.zoomTo(zoomLevel);
  /// Creates an update to change the map camera's principal point (where the view vector intersects
  /// the image plane - default is the center of the view).
  ///
  /// Point values are in screen coordinates
  /// and values that fall outside of the viewport, are clamped.
  /// (0,0) is top left of the viewport.
  ///
  /// [principalPoint] Principal point in absolute viewport pixel coordinates.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate setPrincipalPoint(Point2D principalPoint) => $prototype.setPrincipalPoint(principalPoint);
  /// Creates an update to change the map camera's principal point offset (where the view vector
  /// intersects the image plane - default is (0.5, 0.5)).
  ///
  /// If the principalPointOffset is outside \[0,1\] interval, it is clamped.
  /// (0,0) is top left of the viewport, (1,1) is bottom right.
  ///
  /// [principalPointOffset] Principal point in normalized coordinates \[0,1\].
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  @Deprecated("Will be removed in v4.13.0. Please use [MapCameraUpdateFactory.setNormalizedPrincipalPoint] instead.")

  static MapCameraUpdate setPrincipalPointOffset(Point2D principalPointOffset) => $prototype.setPrincipalPointOffset(principalPointOffset);
  /// Creates an update to change the map camera's principal point (where the view vector
  /// intersects the image plane - default is (0.5, 0.5)).
  ///
  /// Point values are in normalized screen coordinates.
  /// If the principalPoint is outside \[0,1\] interval, it is clamped.
  /// (0,0) is top left of the viewport, (1,1) is bottom right.
  ///
  /// [principalPoint] Principal point in normalized screen coordinates.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate setNormalizedPrincipalPoint(Anchor2D principalPoint) => $prototype.setNormalizedPrincipalPoint(principalPoint);
  /// Creates an update to change the vertical field of view of the map camera.
  ///
  /// If verticalFieldOfView is not finite, no update will be applied to the map camera.
  ///
  /// [verticalFieldOfView] Vertical field of view in degrees.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate setVerticalFieldOfView(double verticalFieldOfView) => $prototype.setVerticalFieldOfView(verticalFieldOfView);
  /// Creates an update to change the focal length of the map camera
  /// Note: Changing the focal also affects the field of view, but not vice versa.
  ///
  /// If focalLength is not finite, no update will be applied to the map camera.
  ///
  /// [focalLength] Focal length in pixels.
  ///
  /// Returns [MapCameraUpdate]. MapCameraUpdate instance.
  ///
  static MapCameraUpdate setFocalLength(double focalLength) => $prototype.setFocalLength(focalLength);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapCameraUpdateFactory$Impl(Pointer<Void>.fromAddress(0));
}


// MapCameraUpdateFactory "private" section, not exported.

final _sdkMapviewMapcameraupdatefactoryRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapCameraUpdateFactory_register_finalizer'));
final _sdkMapviewMapcameraupdatefactoryCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraUpdateFactory_copy_handle'));
final _sdkMapviewMapcameraupdatefactoryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraUpdateFactory_release_handle'));





















/// @nodoc
@visibleForTesting
class MapCameraUpdateFactory$Impl extends __lib.NativeBase implements MapCameraUpdateFactory {

  MapCameraUpdateFactory$Impl(Pointer<Void> handle) : super(handle);

  MapCameraUpdate lookAtPoint(GeoCoordinatesUpdate target) {
    final _lookAtPointFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_lookAt__GeoCoordinatesUpdate'));
    final _targetHandle = sdkCoreGeocoordinatesupdateToFfi(target);
    final __resultHandle = _lookAtPointFfi(__lib.LibraryContext.isolateId, _targetHandle);
    sdkCoreGeocoordinatesupdateReleaseFfiHandle(_targetHandle);
    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate lookAtPointWithOrientation(GeoCoordinatesUpdate target, GeoOrientationUpdate orientation) {
    final _lookAtPointWithOrientationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_lookAt__GeoCoordinatesUpdate_GeoOrientationUpdate'));
    final _targetHandle = sdkCoreGeocoordinatesupdateToFfi(target);
    final _orientationHandle = sdkCoreGeoorientationupdateToFfi(orientation);
    final __resultHandle = _lookAtPointWithOrientationFfi(__lib.LibraryContext.isolateId, _targetHandle, _orientationHandle);
    sdkCoreGeocoordinatesupdateReleaseFfiHandle(_targetHandle);
    sdkCoreGeoorientationupdateReleaseFfiHandle(_orientationHandle);
    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate lookAtPointWithMeasure(GeoCoordinatesUpdate target, MapMeasure measure) {
    final _lookAtPointWithMeasureFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_lookAt__GeoCoordinatesUpdate_MapMeasure'));
    final _targetHandle = sdkCoreGeocoordinatesupdateToFfi(target);
    final _measureHandle = sdkMapviewMapmeasureToFfi(measure);
    final __resultHandle = _lookAtPointWithMeasureFfi(__lib.LibraryContext.isolateId, _targetHandle, _measureHandle);
    sdkCoreGeocoordinatesupdateReleaseFfiHandle(_targetHandle);
    sdkMapviewMapmeasureReleaseFfiHandle(_measureHandle);
    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate lookAtPointWithGeoOrientationAndMeasure(GeoCoordinatesUpdate target, GeoOrientationUpdate orientation, MapMeasure measure) {
    final _lookAtPointWithGeoOrientationAndMeasureFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_lookAt__GeoCoordinatesUpdate_GeoOrientationUpdate_MapMeasure'));
    final _targetHandle = sdkCoreGeocoordinatesupdateToFfi(target);
    final _orientationHandle = sdkCoreGeoorientationupdateToFfi(orientation);
    final _measureHandle = sdkMapviewMapmeasureToFfi(measure);
    final __resultHandle = _lookAtPointWithGeoOrientationAndMeasureFfi(__lib.LibraryContext.isolateId, _targetHandle, _orientationHandle, _measureHandle);
    sdkCoreGeocoordinatesupdateReleaseFfiHandle(_targetHandle);
    sdkCoreGeoorientationupdateReleaseFfiHandle(_orientationHandle);
    sdkMapviewMapmeasureReleaseFfiHandle(_measureHandle);
    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate lookAtPoints(List<GeoCoordinates> points, Rectangle2D viewRectangle, GeoOrientationUpdate orientation, MapMeasure measureLimit) {
    final _lookAtPointsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_lookAt__ListOf_sdk_core_GeoCoordinates_Rectangle2D_GeoOrientationUpdate_MapMeasure'));
    final _pointsHandle = harpSdkBindingslistofSdkCoreGeocoordinatesToFfi(points);
    final _viewRectangleHandle = sdkCoreRectangle2dToFfi(viewRectangle);
    final _orientationHandle = sdkCoreGeoorientationupdateToFfi(orientation);
    final _measureLimitHandle = sdkMapviewMapmeasureToFfi(measureLimit);
    final __resultHandle = _lookAtPointsFfi(__lib.LibraryContext.isolateId, _pointsHandle, _viewRectangleHandle, _orientationHandle, _measureLimitHandle);
    harpSdkBindingslistofSdkCoreGeocoordinatesReleaseFfiHandle(_pointsHandle);
    sdkCoreRectangle2dReleaseFfiHandle(_viewRectangleHandle);
    sdkCoreGeoorientationupdateReleaseFfiHandle(_orientationHandle);
    sdkMapviewMapmeasureReleaseFfiHandle(_measureLimitHandle);
    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate lookAtTargetAndPoints(GeoCoordinatesUpdate target, GeoOrientationUpdate orientation, List<GeoCoordinates> points, Rectangle2D viewRectangle, MapMeasure minMeasure, MapMeasure maxMeasure) {
    final _lookAtTargetAndPointsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_lookAt__GeoCoordinatesUpdate_GeoOrientationUpdate_ListOf_sdk_core_GeoCoordinates_Rectangle2D_MapMeasure_MapMeasure'));
    final _targetHandle = sdkCoreGeocoordinatesupdateToFfi(target);
    final _orientationHandle = sdkCoreGeoorientationupdateToFfi(orientation);
    final _pointsHandle = harpSdkBindingslistofSdkCoreGeocoordinatesToFfi(points);
    final _viewRectangleHandle = sdkCoreRectangle2dToFfi(viewRectangle);
    final _minMeasureHandle = sdkMapviewMapmeasureToFfi(minMeasure);
    final _maxMeasureHandle = sdkMapviewMapmeasureToFfi(maxMeasure);
    final __resultHandle = _lookAtTargetAndPointsFfi(__lib.LibraryContext.isolateId, _targetHandle, _orientationHandle, _pointsHandle, _viewRectangleHandle, _minMeasureHandle, _maxMeasureHandle);
    sdkCoreGeocoordinatesupdateReleaseFfiHandle(_targetHandle);
    sdkCoreGeoorientationupdateReleaseFfiHandle(_orientationHandle);
    harpSdkBindingslistofSdkCoreGeocoordinatesReleaseFfiHandle(_pointsHandle);
    sdkCoreRectangle2dReleaseFfiHandle(_viewRectangleHandle);
    sdkMapviewMapmeasureReleaseFfiHandle(_minMeasureHandle);
    sdkMapviewMapmeasureReleaseFfiHandle(_maxMeasureHandle);
    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate lookAtAreaWithGeoOrientationAndViewRectangle(GeoBox target, GeoOrientationUpdate orientation, Rectangle2D viewRectangle) {
    final _lookAtAreaWithGeoOrientationAndViewRectangleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_lookAt__GeoBox_GeoOrientationUpdate_Rectangle2D'));
    final _targetHandle = sdkCoreGeoboxToFfi(target);
    final _orientationHandle = sdkCoreGeoorientationupdateToFfi(orientation);
    final _viewRectangleHandle = sdkCoreRectangle2dToFfi(viewRectangle);
    final __resultHandle = _lookAtAreaWithGeoOrientationAndViewRectangleFfi(__lib.LibraryContext.isolateId, _targetHandle, _orientationHandle, _viewRectangleHandle);
    sdkCoreGeoboxReleaseFfiHandle(_targetHandle);
    sdkCoreGeoorientationupdateReleaseFfiHandle(_orientationHandle);
    sdkCoreRectangle2dReleaseFfiHandle(_viewRectangleHandle);
    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate lookAtAreaWithViewRectangle(GeoBox target, Rectangle2D viewRectangle) {
    final _lookAtAreaWithViewRectangleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_lookAt__GeoBox_Rectangle2D'));
    final _targetHandle = sdkCoreGeoboxToFfi(target);
    final _viewRectangleHandle = sdkCoreRectangle2dToFfi(viewRectangle);
    final __resultHandle = _lookAtAreaWithViewRectangleFfi(__lib.LibraryContext.isolateId, _targetHandle, _viewRectangleHandle);
    sdkCoreGeoboxReleaseFfiHandle(_targetHandle);
    sdkCoreRectangle2dReleaseFfiHandle(_viewRectangleHandle);
    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate lookAtArea(GeoBox target) {
    final _lookAtAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_lookAt__GeoBox'));
    final _targetHandle = sdkCoreGeoboxToFfi(target);
    final __resultHandle = _lookAtAreaFfi(__lib.LibraryContext.isolateId, _targetHandle);
    sdkCoreGeoboxReleaseFfiHandle(_targetHandle);
    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate panBy(double xOffset, double yOffset) {
    final _panByFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_panBy__Double_Double'));
    final _xOffsetHandle = (xOffset);
    final _yOffsetHandle = (yOffset);
    final __resultHandle = _panByFfi(__lib.LibraryContext.isolateId, _xOffsetHandle, _yOffsetHandle);


    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate orbitBy(GeoOrientationUpdate delta, Point2D origin) {
    final _orbitByFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_orbitBy__GeoOrientationUpdate_Point2D'));
    final _deltaHandle = sdkCoreGeoorientationupdateToFfi(delta);
    final _originHandle = sdkCorePoint2dToFfi(origin);
    final __resultHandle = _orbitByFfi(__lib.LibraryContext.isolateId, _deltaHandle, _originHandle);
    sdkCoreGeoorientationupdateReleaseFfiHandle(_deltaHandle);
    sdkCorePoint2dReleaseFfiHandle(_originHandle);
    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate rotateBy(GeoOrientationUpdate delta) {
    final _rotateByFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_rotateBy__GeoOrientationUpdate'));
    final _deltaHandle = sdkCoreGeoorientationupdateToFfi(delta);
    final __resultHandle = _rotateByFfi(__lib.LibraryContext.isolateId, _deltaHandle);
    sdkCoreGeoorientationupdateReleaseFfiHandle(_deltaHandle);
    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate zoomBy(double factor, Point2D origin) {
    final _zoomByFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Pointer<Void>), Pointer<Void> Function(int, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_zoomBy__Double_Point2D'));
    final _factorHandle = (factor);
    final _originHandle = sdkCorePoint2dToFfi(origin);
    final __resultHandle = _zoomByFfi(__lib.LibraryContext.isolateId, _factorHandle, _originHandle);

    sdkCorePoint2dReleaseFfiHandle(_originHandle);
    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate zoomTo(double zoomLevel) {
    final _zoomToFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double), Pointer<Void> Function(int, double)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_zoomTo__Double'));
    final _zoomLevelHandle = (zoomLevel);
    final __resultHandle = _zoomToFfi(__lib.LibraryContext.isolateId, _zoomLevelHandle);

    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate setPrincipalPoint(Point2D principalPoint) {
    final _setPrincipalPointFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_setPrincipalPoint__Point2D'));
    final _principalPointHandle = sdkCorePoint2dToFfi(principalPoint);
    final __resultHandle = _setPrincipalPointFfi(__lib.LibraryContext.isolateId, _principalPointHandle);
    sdkCorePoint2dReleaseFfiHandle(_principalPointHandle);
    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate setPrincipalPointOffset(Point2D principalPointOffset) {
    final _setPrincipalPointOffsetFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_setPrincipalPointOffset__Point2D'));
    final _principalPointOffsetHandle = sdkCorePoint2dToFfi(principalPointOffset);
    final __resultHandle = _setPrincipalPointOffsetFfi(__lib.LibraryContext.isolateId, _principalPointOffsetHandle);
    sdkCorePoint2dReleaseFfiHandle(_principalPointOffsetHandle);
    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate setNormalizedPrincipalPoint(Anchor2D principalPoint) {
    final _setNormalizedPrincipalPointFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_setNormalizedPrincipalPoint__Anchor2D'));
    final _principalPointHandle = sdkCoreAnchor2dToFfi(principalPoint);
    final __resultHandle = _setNormalizedPrincipalPointFfi(__lib.LibraryContext.isolateId, _principalPointHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_principalPointHandle);
    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate setVerticalFieldOfView(double verticalFieldOfView) {
    final _setVerticalFieldOfViewFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double), Pointer<Void> Function(int, double)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_setVerticalFieldOfView__Double'));
    final _verticalFieldOfViewHandle = (verticalFieldOfView);
    final __resultHandle = _setVerticalFieldOfViewFfi(__lib.LibraryContext.isolateId, _verticalFieldOfViewHandle);

    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraUpdate setFocalLength(double focalLength) {
    final _setFocalLengthFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double), Pointer<Void> Function(int, double)>('here_sdk_sdk_mapview_MapCameraUpdateFactory_setFocalLength__Double'));
    final _focalLengthHandle = (focalLength);
    final __resultHandle = _setFocalLengthFfi(__lib.LibraryContext.isolateId, _focalLengthHandle);

    try {
      return sdkMapviewMapcameraupdateFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraupdateReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkMapviewMapcameraupdatefactoryToFfi(MapCameraUpdateFactory value) =>
  _sdkMapviewMapcameraupdatefactoryCopyHandle((value as __lib.NativeBase).handle);

MapCameraUpdateFactory sdkMapviewMapcameraupdatefactoryFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapCameraUpdateFactory) return instance;

  final _copiedHandle = _sdkMapviewMapcameraupdatefactoryCopyHandle(handle);
  final result = MapCameraUpdateFactory$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapcameraupdatefactoryRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapcameraupdatefactoryReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcameraupdatefactoryReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcameraupdatefactoryToFfiNullable(MapCameraUpdateFactory? value) =>
  value != null ? sdkMapviewMapcameraupdatefactoryToFfi(value) : Pointer<Void>.fromAddress(0);

MapCameraUpdateFactory? sdkMapviewMapcameraupdatefactoryFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcameraupdatefactoryFromFfi(handle) : null;

void sdkMapviewMapcameraupdatefactoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcameraupdatefactoryReleaseHandle(handle);

// End of MapCameraUpdateFactory "private" section.

