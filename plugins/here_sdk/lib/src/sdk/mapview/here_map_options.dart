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
import 'package:here_sdk/src/sdk/core/color.dart';
import 'package:here_sdk/src/sdk/mapview/map_projection.dart';

/// Options used for initialization of map view

class HereMapOptions {
  /// Projection of map
  MapProjection projection;

  /// Initial background color that will be shown until MapView is fully initialized
  /// and a scene is loaded.
  ///
  /// Alpha value gets ignored and is assumed as 1.0.
  ui.Color? initialBackgroundColor;

  HereMapOptions(this.projection)
      : initialBackgroundColor = null;
  HereMapOptions.fromColor(this.initialBackgroundColor)
      : projection = MapProjection.globe;
  HereMapOptions.fromProjectionAndColor(this.projection, this.initialBackgroundColor);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HereMapOptions) return false;
    HereMapOptions _other = other;
    return projection == _other.projection &&
        initialBackgroundColor == _other.initialBackgroundColor;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + projection.hashCode;
    result = 31 * result + initialBackgroundColor.hashCode;
    return result;
  }
}


// HereMapOptions "private" section, not exported.

final _sdkMapviewMapviewoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewOptions_create_handle'));
final _sdkMapviewMapviewoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewOptions_release_handle'));
final _sdkMapviewMapviewoptionsGetFieldprojection = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewOptions_get_field_projection'));
final _sdkMapviewMapviewoptionsGetFieldinitialBackgroundColor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewOptions_get_field_initialBackgroundColor'));



Pointer<Void> sdkMapviewMapviewoptionsToFfi(HereMapOptions value) {
  final _projectionHandle = sdkMapviewMapprojectionToFfi(value.projection);
  final _initialBackgroundColorHandle = sdkCoreColorToFfiNullable(value.initialBackgroundColor);
  final _result = _sdkMapviewMapviewoptionsCreateHandle(_projectionHandle, _initialBackgroundColorHandle);
  sdkMapviewMapprojectionReleaseFfiHandle(_projectionHandle);
  sdkCoreColorReleaseFfiHandleNullable(_initialBackgroundColorHandle);
  return _result;
}

HereMapOptions sdkMapviewMapviewoptionsFromFfi(Pointer<Void> handle) {
  final _projectionHandle = _sdkMapviewMapviewoptionsGetFieldprojection(handle);
  final _initialBackgroundColorHandle = _sdkMapviewMapviewoptionsGetFieldinitialBackgroundColor(handle);
  try {
    return HereMapOptions.fromProjectionAndColor(
      sdkMapviewMapprojectionFromFfi(_projectionHandle), 
      sdkCoreColorFromFfiNullable(_initialBackgroundColorHandle)
    );
  } finally {
    sdkMapviewMapprojectionReleaseFfiHandle(_projectionHandle);
    sdkCoreColorReleaseFfiHandleNullable(_initialBackgroundColorHandle);
  }
}

void sdkMapviewMapviewoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewMapviewoptionsReleaseHandle(handle);

// Nullable HereMapOptions

final _sdkMapviewMapviewoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewOptions_create_handle_nullable'));
final _sdkMapviewMapviewoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewOptions_release_handle_nullable'));
final _sdkMapviewMapviewoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewOptions_get_value_nullable'));

Pointer<Void> sdkMapviewMapviewoptionsToFfiNullable(HereMapOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapviewoptionsToFfi(value);
  final result = _sdkMapviewMapviewoptionsCreateHandleNullable(_handle);
  sdkMapviewMapviewoptionsReleaseFfiHandle(_handle);
  return result;
}

HereMapOptions? sdkMapviewMapviewoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapviewoptionsGetValueNullable(handle);
  final result = sdkMapviewMapviewoptionsFromFfi(_handle);
  sdkMapviewMapviewoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapviewoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapviewoptionsReleaseHandleNullable(handle);

// End of HereMapOptions "private" section.

