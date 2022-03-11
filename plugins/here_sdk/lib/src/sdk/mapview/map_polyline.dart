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
import 'dart:ui' as ui;
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/sdk/core/color.dart';
import 'package:here_sdk/src/sdk/core/geo_polyline.dart';
import 'package:here_sdk/src/sdk/core/metadata.dart';
import 'package:here_sdk/src/sdk/mapview/dash_pattern.dart';
import 'package:here_sdk/src/sdk/mapview/line_cap.dart';
import 'package:meta/meta.dart';

/// A visual representation of a line on the map.
///
/// The geometry to be visualized is represented
/// by an instance of [GeoPolyline].
///
/// To display the map polyline, it needs to be added to the scene using [MapScene.addMapPolyline].
/// To stop displaying it, remove it from the scene using [MapScene.removeMapPolyline].
abstract class MapPolyline {
  /// Creates a new MapPolyline instance containing the geometry passed in.
  ///
  /// [geometry] The list of vertices representing the polyline.
  ///
  /// [widthInPixels] The width in pixels in which to render the polyline.
  ///
  /// [color] The color with which to render the polyline. The alpha value of the color
  /// is currently ignored and set to 255 (solid).
  ///
  factory MapPolyline(GeoPolyline geometry, double widthInPixels, ui.Color color) => $prototype.$init(geometry, widthInPixels, color);
  /// Creates a new MapPolyline instance with an outline.
  ///
  /// The width of the outline comes on top of the polyline width, meaning that a line of
  /// width 10 and outline width of 2 will have a total width of 14 pixels.
  ///
  /// [geometry] The list of vertices representing the polyline.
  ///
  /// [widthInPixels] The width in pixels in which to render the polyline.
  ///
  /// [color] The color with which to render the polyline. The alpha value of the color is
  /// currently ignored and set to 255 (solid).
  ///
  /// [outlineWidthInPixels] The width in pixels of the outline on one side of the polyline. The total width of
  /// the polyline will thus be width_in_pixels + 2 * outline_width_in_pixels.
  ///
  /// [outlineColor] The color used to render the outline. The alpha value of the color is
  /// currently ignored and set to 255 (solid).
  ///
  factory MapPolyline.withOutlineWidthInPixelsAndOutlineColor(GeoPolyline geometry, double widthInPixels, ui.Color color, double outlineWidthInPixels, ui.Color outlineColor) => $prototype.withOutlineWidthInPixelsAndOutlineColor(geometry, widthInPixels, color, outlineWidthInPixels, outlineColor);


  /// @nodoc
  int internalgetId();
  /// Gets current geometry of polyline.
  GeoPolyline get geometry;
  /// Sets new geometry of polyline.
  set geometry(GeoPolyline value);

  /// Gets the Metadata instance attached to this polyline.
  /// This will be  if nothing has been
  /// attached before.
  Metadata? get metadata;
  /// Sets the Metadata instance attached to this polyline.
  set metadata(Metadata? value);

  /// Returns the line caps style of this polyline.
  LineCap get lineCap;
  /// Sets the line caps style.
  set lineCap(LineCap value);

  /// Gets the color of the line.
  ui.Color get lineColor;
  /// Sets the color of the line. Transparency (alpha channel) is not supported
  /// and is always set to 255, regardless of the input value.
  set lineColor(ui.Color value);

  /// Gets the width of the line in pixels.
  double get lineWidth;
  /// Sets the width of the line in pixels. Trying to set to a value of 0 or less
  /// has no effect.
  set lineWidth(double value);

  /// Gets the color of the outline.
  ui.Color get outlineColor;
  /// Sets the color of the outline. Transparency (alpha channel) is not supported
  /// and is always set to 255, regardless of the input value.
  set outlineColor(ui.Color value);

  /// Gets the width the outline in pixels. 0 if there is no outline.
  double get outlineWidth;
  /// Sets the width the outline in pixels. 0 to remove the outline. Trying to set
  /// negative value has no effect.
  set outlineWidth(double value);

  /// Gets currently used dash pattern for this line.
  /// Returns `null` if no pattern is specified.
  DashPattern? get dashPattern;
  /// Sets dash pattern to be used for this line.
  /// Pass `null` to remove the dash pattern.
  set dashPattern(DashPattern? value);

  /// Gets currently used color of the filling between dashes
  /// of a dashed line or `null` if the gaps are to be fully transparent.
  ui.Color? get dashFillColor;
  /// Sets color of the filling between dashes of a dashed line.
  /// Pass `null` to make the gaps fully transparent. Transparency
  /// (alpha channel) is not supported and is always set to 255 regardless
  /// of the input value.
  set dashFillColor(ui.Color? value);

  /// Gets MapPolyline draw order. Default value is 0.
  int get drawOrder;
  /// Sets MapPolyline draw order. Polylines with higher draw order value are drawn
  /// on top of polylines with lower draw order. In case multiple polylines have the same draw order value
  /// then the order in which they were added to the scene matters. Last added polyline is drawn on top.
  /// Allowed range is 0-1023. Values outside this range will be clamped.
  set drawOrder(int value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapPolyline$Impl(Pointer<Void>.fromAddress(0));
}


// MapPolyline "private" section, not exported.

final _sdkMapviewMappolylineRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapPolyline_register_finalizer'));
final _sdkMapviewMappolylineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_copy_handle'));
final _sdkMapviewMappolylineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_release_handle'));





/// @nodoc
@visibleForTesting
class MapPolyline$Impl extends __lib.NativeBase implements MapPolyline {

  MapPolyline$Impl(Pointer<Void> handle) : super(handle);


  MapPolyline $init(GeoPolyline geometry, double widthInPixels, ui.Color color) {
    final _result_handle = _$init(geometry, widthInPixels, color);
    final _result = MapPolyline$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMappolylineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapPolyline withOutlineWidthInPixelsAndOutlineColor(GeoPolyline geometry, double widthInPixels, ui.Color color, double outlineWidthInPixels, ui.Color outlineColor) {
    final _result_handle = _withOutlineWidthInPixelsAndOutlineColor(geometry, widthInPixels, color, outlineWidthInPixels, outlineColor);
    final _result = MapPolyline$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMappolylineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(GeoPolyline geometry, double widthInPixels, ui.Color color) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Double, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_make__GeoPolyline_Double_Color'));
    final _geometryHandle = sdkCoreGeopolylineToFfi(geometry);
    final _widthInPixelsHandle = (widthInPixels);
    final _colorHandle = sdkCoreColorToFfi(color);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _geometryHandle, _widthInPixelsHandle, _colorHandle);
    sdkCoreGeopolylineReleaseFfiHandle(_geometryHandle);

    sdkCoreColorReleaseFfiHandle(_colorHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withOutlineWidthInPixelsAndOutlineColor(GeoPolyline geometry, double widthInPixels, ui.Color color, double outlineWidthInPixels, ui.Color outlineColor) {
    final _withOutlineWidthInPixelsAndOutlineColorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Double, Pointer<Void>, Double, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, double, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_make__GeoPolyline_Double_Color_Double_Color'));
    final _geometryHandle = sdkCoreGeopolylineToFfi(geometry);
    final _widthInPixelsHandle = (widthInPixels);
    final _colorHandle = sdkCoreColorToFfi(color);
    final _outlineWidthInPixelsHandle = (outlineWidthInPixels);
    final _outlineColorHandle = sdkCoreColorToFfi(outlineColor);
    final __resultHandle = _withOutlineWidthInPixelsAndOutlineColorFfi(__lib.LibraryContext.isolateId, _geometryHandle, _widthInPixelsHandle, _colorHandle, _outlineWidthInPixelsHandle, _outlineColorHandle);
    sdkCoreGeopolylineReleaseFfiHandle(_geometryHandle);

    sdkCoreColorReleaseFfiHandle(_colorHandle);

    sdkCoreColorReleaseFfiHandle(_outlineColorHandle);
    return __resultHandle;
  }

  @override
  int internalgetId() {
    final _getIdFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_getId'));
    final _handle = this.handle;
    final __resultHandle = _getIdFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  GeoPolyline get geometry {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_geometry_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeopolylineFromFfi(__resultHandle);
    } finally {
      sdkCoreGeopolylineReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set geometry(GeoPolyline value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_geometry_set__GeoPolyline'));
    final _valueHandle = sdkCoreGeopolylineToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreGeopolylineReleaseFfiHandle(_valueHandle);

  }


  @override
  Metadata? get metadata {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_metadata_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreMetadataFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreMetadataReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set metadata(Metadata? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_metadata_set__Metadata_'));
    final _valueHandle = sdkCoreMetadataToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreMetadataReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  LineCap get lineCap {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_lineCap_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewLinecapFromFfi(__resultHandle);
    } finally {
      sdkMapviewLinecapReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set lineCap(LineCap value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapPolyline_lineCap_set__LineCap'));
    final _valueHandle = sdkMapviewLinecapToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkMapviewLinecapReleaseFfiHandle(_valueHandle);

  }


  @override
  ui.Color get lineColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_lineColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfi(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set lineColor(ui.Color value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_lineColor_set__Color'));
    final _valueHandle = sdkCoreColorToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreColorReleaseFfiHandle(_valueHandle);

  }


  @override
  double get lineWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_lineWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set lineWidth(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapPolyline_lineWidth_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  ui.Color get outlineColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_outlineColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfi(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set outlineColor(ui.Color value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_outlineColor_set__Color'));
    final _valueHandle = sdkCoreColorToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreColorReleaseFfiHandle(_valueHandle);

  }


  @override
  double get outlineWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_outlineWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set outlineWidth(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapPolyline_outlineWidth_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  DashPattern? get dashPattern {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_dashPattern_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewDashpatternFromFfiNullable(__resultHandle);
    } finally {
      sdkMapviewDashpatternReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set dashPattern(DashPattern? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_dashPattern_set__DashPattern_'));
    final _valueHandle = sdkMapviewDashpatternToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkMapviewDashpatternReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  ui.Color? get dashFillColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_dashFillColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set dashFillColor(ui.Color? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_dashFillColor_set__Color_'));
    final _valueHandle = sdkCoreColorToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreColorReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  int get drawOrder {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_drawOrder_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set drawOrder(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapPolyline_drawOrder_set__Int'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }



}

Pointer<Void> sdkMapviewMappolylineToFfi(MapPolyline value) =>
  _sdkMapviewMappolylineCopyHandle((value as __lib.NativeBase).handle);

MapPolyline sdkMapviewMappolylineFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapPolyline) return instance;

  final _copiedHandle = _sdkMapviewMappolylineCopyHandle(handle);
  final result = MapPolyline$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMappolylineRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMappolylineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMappolylineReleaseHandle(handle);

Pointer<Void> sdkMapviewMappolylineToFfiNullable(MapPolyline? value) =>
  value != null ? sdkMapviewMappolylineToFfi(value) : Pointer<Void>.fromAddress(0);

MapPolyline? sdkMapviewMappolylineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMappolylineFromFfi(handle) : null;

void sdkMapviewMappolylineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMappolylineReleaseHandle(handle);

// End of MapPolyline "private" section.

