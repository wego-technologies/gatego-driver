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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/anchor2_d.dart';
import 'package:here_sdk/src/sdk/mapview/map_image.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker.dart';
import 'package:meta/meta.dart';

/// Groups map markers and enables their clustering to reduce visual clutter when there are many of
/// them in a small area.
///
/// The markers that are close to each other are replaced by a single cluster
/// marker. The markers can be added to a cluster or to a scene, but not to both.
/// To display the cluster on the map, add it to the scene using [MapScene.addMapMarkerCluster].
abstract class MapMarkerCluster {
  /// Creates a new instance of a map marker cluster which is represented as an image.
  ///
  /// [imageStyle] The visual representation for the cluster.
  ///
  factory MapMarkerCluster(MapMarkerClusterImageStyle imageStyle) => $prototype.make(imageStyle);

  /// Adds a map marker to this cluster.
  ///
  /// Adding a marker which is already part of the cluster or
  /// which was already added to the map scene has no effect.
  ///
  void addMapMarker(MapMarker marker);
  /// Adds a list of map markers to this cluster.
  ///
  /// Markers which are already part of the cluster or
  /// which were already added to the map scene will be ignored.
  ///
  void addMapMarkers(List<MapMarker> markers);
  /// Removes a map marker from this cluster.
  ///
  /// Removing a marker which is not part of this cluster has no effect.
  ///
  void removeMapMarker(MapMarker marker);
  /// Removes a list of map markers from this cluster.
  ///
  /// Removing markers which are not part of this cluster has no effect.
  ///
  void removeMapMarkers(List<MapMarker> markers);
  /// Removes all map markers from this cluster.
  ///
  void removeAllMapMarkers();
  List<MapMarker> get markers;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapMarkerCluster$Impl(Pointer<Void>.fromAddress(0));
}

/// Represents a group of map markers belonging to a cluster.
///
/// It contains a list of map markers grouped on map view under single icon of marker cluster or
/// single map marker entry for markers being part of cluster but spread enough not to be grouped.

class MapMarkerClusterGrouping {
  /// List of map markers grouped on map view under map marker cluster icon
  List<MapMarker> markers;

  /// Map marker cluster that [MapMarkerClusterGrouping.markers] belong to.
  MapMarkerCluster parent;

  MapMarkerClusterGrouping(this.markers, this.parent);
}


// MapMarkerClusterGrouping "private" section, not exported.

final _sdkMapviewMapmarkerclusterGroupingCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_Grouping_create_handle'));
final _sdkMapviewMapmarkerclusterGroupingReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_Grouping_release_handle'));
final _sdkMapviewMapmarkerclusterGroupingGetFieldmarkers = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_Grouping_get_field_markers'));
final _sdkMapviewMapmarkerclusterGroupingGetFieldparent = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_Grouping_get_field_parent'));



Pointer<Void> sdkMapviewMapmarkerclusterGroupingToFfi(MapMarkerClusterGrouping value) {
  final _markersHandle = heresdkMapviewHarpBindingslistofSdkMapviewMapmarkerToFfi(value.markers);
  final _parentHandle = sdkMapviewMapmarkerclusterToFfi(value.parent);
  final _result = _sdkMapviewMapmarkerclusterGroupingCreateHandle(_markersHandle, _parentHandle);
  heresdkMapviewHarpBindingslistofSdkMapviewMapmarkerReleaseFfiHandle(_markersHandle);
  sdkMapviewMapmarkerclusterReleaseFfiHandle(_parentHandle);
  return _result;
}

MapMarkerClusterGrouping sdkMapviewMapmarkerclusterGroupingFromFfi(Pointer<Void> handle) {
  final _markersHandle = _sdkMapviewMapmarkerclusterGroupingGetFieldmarkers(handle);
  final _parentHandle = _sdkMapviewMapmarkerclusterGroupingGetFieldparent(handle);
  try {
    return MapMarkerClusterGrouping(
      heresdkMapviewHarpBindingslistofSdkMapviewMapmarkerFromFfi(_markersHandle), 
      sdkMapviewMapmarkerclusterFromFfi(_parentHandle)
    );
  } finally {
    heresdkMapviewHarpBindingslistofSdkMapviewMapmarkerReleaseFfiHandle(_markersHandle);
    sdkMapviewMapmarkerclusterReleaseFfiHandle(_parentHandle);
  }
}

void sdkMapviewMapmarkerclusterGroupingReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewMapmarkerclusterGroupingReleaseHandle(handle);

// Nullable MapMarkerClusterGrouping

final _sdkMapviewMapmarkerclusterGroupingCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_Grouping_create_handle_nullable'));
final _sdkMapviewMapmarkerclusterGroupingReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_Grouping_release_handle_nullable'));
final _sdkMapviewMapmarkerclusterGroupingGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_Grouping_get_value_nullable'));

Pointer<Void> sdkMapviewMapmarkerclusterGroupingToFfiNullable(MapMarkerClusterGrouping? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapmarkerclusterGroupingToFfi(value);
  final result = _sdkMapviewMapmarkerclusterGroupingCreateHandleNullable(_handle);
  sdkMapviewMapmarkerclusterGroupingReleaseFfiHandle(_handle);
  return result;
}

MapMarkerClusterGrouping? sdkMapviewMapmarkerclusterGroupingFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapmarkerclusterGroupingGetValueNullable(handle);
  final result = sdkMapviewMapmarkerclusterGroupingFromFfi(_handle);
  sdkMapviewMapmarkerclusterGroupingReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapmarkerclusterGroupingReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmarkerclusterGroupingReleaseHandleNullable(handle);

// End of MapMarkerClusterGrouping "private" section.
/// This class specifies the visual appearance of a cluster marker.
abstract class MapMarkerClusterImageStyle {
  /// Creates a cluster marker image style using a map image with anchor.
  ///
  /// The anchor is a way of specifying position offset relative to image's dimensions on the
  /// screen. For example, (0, 0) places the top-left corner of the image at the cluster's
  /// position. (1, 1) would place the bottom-right corner of the image at the cluster's
  /// position.
  ///
  /// [image] The map image for the cluster marker.
  ///
  /// [anchor] The anchor point for the marker image which specifies the position offset relative
  /// to the cluster's position.
  ///
  factory MapMarkerClusterImageStyle.withAnchor(MapImage image, Anchor2D anchor) => $prototype.withAnchor(image, anchor);
  /// Creates a marker cluster image representation with default anchor.
  ///
  /// [image] The map image for the cluster marker.
  ///
  factory MapMarkerClusterImageStyle(MapImage image) => $prototype.$init(image);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapMarkerClusterImageStyle$Impl(Pointer<Void>.fromAddress(0));
}


// MapMarkerClusterImageStyle "private" section, not exported.

final _sdkMapviewMapmarkerclusterImagestyleRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapMarkerCluster_ImageStyle_register_finalizer'));
final _sdkMapviewMapmarkerclusterImagestyleCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_ImageStyle_copy_handle'));
final _sdkMapviewMapmarkerclusterImagestyleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_ImageStyle_release_handle'));




/// @nodoc
@visibleForTesting
class MapMarkerClusterImageStyle$Impl extends __lib.NativeBase implements MapMarkerClusterImageStyle {

  MapMarkerClusterImageStyle$Impl(Pointer<Void> handle) : super(handle);


  MapMarkerClusterImageStyle withAnchor(MapImage image, Anchor2D anchor) {
    final _result_handle = _withAnchor(image, anchor);
    final _result = MapMarkerClusterImageStyle$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapmarkerclusterImagestyleRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapMarkerClusterImageStyle $init(MapImage image) {
    final _result_handle = _$init(image);
    final _result = MapMarkerClusterImageStyle$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapmarkerclusterImagestyleRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _withAnchor(MapImage image, Anchor2D anchor) {
    final _withAnchorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarkerCluster_ImageStyle_make__MapImage_Anchor2D'));
    final _imageHandle = sdkMapviewMapimageToFfi(image);
    final _anchorHandle = sdkCoreAnchor2dToFfi(anchor);
    final __resultHandle = _withAnchorFfi(__lib.LibraryContext.isolateId, _imageHandle, _anchorHandle);
    sdkMapviewMapimageReleaseFfiHandle(_imageHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_anchorHandle);
    return __resultHandle;
  }

  static Pointer<Void> _$init(MapImage image) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarkerCluster_ImageStyle_make__MapImage'));
    final _imageHandle = sdkMapviewMapimageToFfi(image);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _imageHandle);
    sdkMapviewMapimageReleaseFfiHandle(_imageHandle);
    return __resultHandle;
  }


}

Pointer<Void> sdkMapviewMapmarkerclusterImagestyleToFfi(MapMarkerClusterImageStyle value) =>
  _sdkMapviewMapmarkerclusterImagestyleCopyHandle((value as __lib.NativeBase).handle);

MapMarkerClusterImageStyle sdkMapviewMapmarkerclusterImagestyleFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapMarkerClusterImageStyle) return instance;

  final _copiedHandle = _sdkMapviewMapmarkerclusterImagestyleCopyHandle(handle);
  final result = MapMarkerClusterImageStyle$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapmarkerclusterImagestyleRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapmarkerclusterImagestyleReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapmarkerclusterImagestyleReleaseHandle(handle);

Pointer<Void> sdkMapviewMapmarkerclusterImagestyleToFfiNullable(MapMarkerClusterImageStyle? value) =>
  value != null ? sdkMapviewMapmarkerclusterImagestyleToFfi(value) : Pointer<Void>.fromAddress(0);

MapMarkerClusterImageStyle? sdkMapviewMapmarkerclusterImagestyleFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapmarkerclusterImagestyleFromFfi(handle) : null;

void sdkMapviewMapmarkerclusterImagestyleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmarkerclusterImagestyleReleaseHandle(handle);

// End of MapMarkerClusterImageStyle "private" section.

// MapMarkerCluster "private" section, not exported.

final _sdkMapviewMapmarkerclusterRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapMarkerCluster_register_finalizer'));
final _sdkMapviewMapmarkerclusterCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_copy_handle'));
final _sdkMapviewMapmarkerclusterReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_release_handle'));








/// @nodoc
@visibleForTesting
class MapMarkerCluster$Impl extends __lib.NativeBase implements MapMarkerCluster {

  MapMarkerCluster$Impl(Pointer<Void> handle) : super(handle);


  MapMarkerCluster make(MapMarkerClusterImageStyle imageStyle) {
    final _result_handle = _make(imageStyle);
    final _result = MapMarkerCluster$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapmarkerclusterRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make(MapMarkerClusterImageStyle imageStyle) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarkerCluster_make__ImageStyle'));
    final _imageStyleHandle = sdkMapviewMapmarkerclusterImagestyleToFfi(imageStyle);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _imageStyleHandle);
    sdkMapviewMapmarkerclusterImagestyleReleaseFfiHandle(_imageStyleHandle);
    return __resultHandle;
  }

  @override
  void addMapMarker(MapMarker marker) {
    final _addMapMarkerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarkerCluster_addMapMarker__MapMarker'));
    final _markerHandle = sdkMapviewMapmarkerToFfi(marker);
    final _handle = this.handle;
    _addMapMarkerFfi(_handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarkerReleaseFfiHandle(_markerHandle);

  }

  @override
  void addMapMarkers(List<MapMarker> markers) {
    final _addMapMarkersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarkerCluster_addMapMarkers__ListOf_sdk_mapview_MapMarker'));
    final _markersHandle = heresdkMapviewHarpBindingslistofSdkMapviewMapmarkerToFfi(markers);
    final _handle = this.handle;
    _addMapMarkersFfi(_handle, __lib.LibraryContext.isolateId, _markersHandle);
    heresdkMapviewHarpBindingslistofSdkMapviewMapmarkerReleaseFfiHandle(_markersHandle);

  }

  @override
  void removeMapMarker(MapMarker marker) {
    final _removeMapMarkerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarkerCluster_removeMapMarker__MapMarker'));
    final _markerHandle = sdkMapviewMapmarkerToFfi(marker);
    final _handle = this.handle;
    _removeMapMarkerFfi(_handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarkerReleaseFfiHandle(_markerHandle);

  }

  @override
  void removeMapMarkers(List<MapMarker> markers) {
    final _removeMapMarkersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarkerCluster_removeMapMarkers__ListOf_sdk_mapview_MapMarker'));
    final _markersHandle = heresdkMapviewHarpBindingslistofSdkMapviewMapmarkerToFfi(markers);
    final _handle = this.handle;
    _removeMapMarkersFfi(_handle, __lib.LibraryContext.isolateId, _markersHandle);
    heresdkMapviewHarpBindingslistofSdkMapviewMapmarkerReleaseFfiHandle(_markersHandle);

  }

  @override
  void removeAllMapMarkers() {
    final _removeAllMapMarkersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarkerCluster_removeAllMapMarkers'));
    final _handle = this.handle;
    _removeAllMapMarkersFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  List<MapMarker> get markers {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarkerCluster_markers_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkMapviewHarpBindingslistofSdkMapviewMapmarkerFromFfi(__resultHandle);
    } finally {
      heresdkMapviewHarpBindingslistofSdkMapviewMapmarkerReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkMapviewMapmarkerclusterToFfi(MapMarkerCluster value) =>
  _sdkMapviewMapmarkerclusterCopyHandle((value as __lib.NativeBase).handle);

MapMarkerCluster sdkMapviewMapmarkerclusterFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapMarkerCluster) return instance;

  final _copiedHandle = _sdkMapviewMapmarkerclusterCopyHandle(handle);
  final result = MapMarkerCluster$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapmarkerclusterRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapmarkerclusterReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapmarkerclusterReleaseHandle(handle);

Pointer<Void> sdkMapviewMapmarkerclusterToFfiNullable(MapMarkerCluster? value) =>
  value != null ? sdkMapviewMapmarkerclusterToFfi(value) : Pointer<Void>.fromAddress(0);

MapMarkerCluster? sdkMapviewMapmarkerclusterFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapmarkerclusterFromFfi(handle) : null;

void sdkMapviewMapmarkerclusterReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmarkerclusterReleaseHandle(handle);

// End of MapMarkerCluster "private" section.

