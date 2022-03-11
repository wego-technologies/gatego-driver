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
import 'package:here_sdk/src/sdk/animation/anchor2_d_keyframe.dart';
import 'package:here_sdk/src/sdk/animation/easing_function.dart';
import 'package:here_sdk/src/sdk/animation/geo_coordinates_keyframe.dart';
import 'package:here_sdk/src/sdk/animation/geo_orientation_keyframe.dart';
import 'package:here_sdk/src/sdk/animation/keyframe_interpolation_mode.dart';
import 'package:here_sdk/src/sdk/animation/point2_d_keyframe.dart';
import 'package:here_sdk/src/sdk/animation/scalar_keyframe.dart';
import 'package:meta/meta.dart';

/// Stores keyframes for interpolation of a camera property using a specific easing function
/// and interpolation mode.
///
/// Can only hold keyframes of a single type.
abstract class MapCameraKeyframeTrack {

  /// Gets a copy of the scalar keyframes or nothing if this is not a scalar keyframe track.
  ///
  List<ScalarKeyframe>? getScalarKeyframes();
  /// Gets a copy of the point 2d keyframes or nothing if this is not a point 2d keyframe track.
  ///
  List<Point2DKeyframe>? getPoint2DKeyframes();
  /// Gets a copy of the anchor 2d keyframes or nothing if this is not an anchor 2d keyframe track.
  ///
  List<Anchor2DKeyframe>? getAnchor2DKeyframes();
  /// Gets a copy of the geo coordinates keyframes or nothing if this is not a geo coordinates keyframe track.
  ///
  List<GeoCoordinatesKeyframe>? getGeoCoordinatesKeyframes();
  /// Gets a copy of the geo orientation keyframes or nothing if this is not a geo orientation keyframe track.
  ///
  List<GeoOrientationKeyframe>? getGeoOrientationKeyframes();
  /// Creates a map camera look-at distance keyframe track.
  ///
  /// It enables animations of the distance
  /// from the map camera to the target point that the camera looks at in meters. The values will
  /// be clamped according to the minimum and maximum zoom levels set for the map camera.
  ///
  /// [keyframes] The list of keyframes that specify how the camera property is changed.
  /// Keyframe time offsets are considered to be relative to the previous keyframe
  /// in the list or relative to the start of the animation if the current keyframe
  /// is first in the list.
  /// Time offset of the first keyframe in the list should be 0, otherwise an error occurs
  /// and creation of the keyframe track will fail.
  ///
  /// [easingFunction] The easing function to apply during keyframe interpolation.
  ///
  /// [interpolationMode] The type of interpolation done between keyframe values.
  ///
  /// Returns [MapCameraKeyframeTrack]. A keyframe track over the distance from the map camera to its target.
  ///
  static MapCameraKeyframeTrack lookAtDistance(List<ScalarKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) => $prototype.lookAtDistance(keyframes, easingFunction, interpolationMode);
  /// Creates a map camera look-at target keyframe track.
  ///
  /// It enables animations over the
  /// geographical coordinates of the target point that the map camera is looking at. Setting the
  /// altitude is optional defaulting to ground level.
  ///
  /// [keyframes] The list of keyframes that specify how the camera property is changed.
  /// Keyframe time offsets are considered to be relative to the previous keyframe
  /// in the list or relative to the start of the animation if the current keyframe
  /// is first in the list.
  /// Time offset of the first keyframe in the list should be 0, otherwise an error occurs
  /// and creation of the keyframe track will fail.
  ///
  /// [easingFunction] The easing function to apply during keyframe interpolation.
  ///
  /// [interpolationMode] The type of interpolation done between keyframe values.
  ///
  /// Returns [MapCameraKeyframeTrack]. A keyframe track over the map camera target coordinates.
  ///
  static MapCameraKeyframeTrack lookAtTarget(List<GeoCoordinatesKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) => $prototype.lookAtTarget(keyframes, easingFunction, interpolationMode);
  /// Creates a map camera look-at orientation keyframe track.
  ///
  /// It enables animations over the
  /// orientation of the map camera target (bearing and tilt).
  ///
  /// [keyframes] The list of keyframes that specify how the camera property is changed.
  /// Keyframe time offsets are considered to be relative to the previous keyframe
  /// in the list or relative to the start of the animation if the current keyframe
  /// is first in the list.
  /// Time offset of the first keyframe in the list should be 0, otherwise an error occurs
  /// and creation of the keyframe track will fail.
  ///
  /// [easingFunction] The easing function to apply during keyframe interpolation.
  ///
  /// [interpolationMode] The type of interpolation done between keyframe values.
  ///
  /// Returns [MapCameraKeyframeTrack]. A keyframe track over the map camera target orientation.
  ///
  static MapCameraKeyframeTrack lookAtOrientation(List<GeoOrientationKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) => $prototype.lookAtOrientation(keyframes, easingFunction, interpolationMode);
  /// Creates a map camera principal point keyframe track.
  ///
  /// It enables animations on the point
  /// where the map camera's target is placed in view coordinates. (0,0) is top left of the
  /// viewport, (viewport width, viewport height) is bottom right.
  ///
  /// [keyframes] The list of keyframes that specify how the camera property is changed.
  /// Point values must be in screen (pixel) coordinates with origin (0,0) in the top left of the viewport.
  /// Point values outside of viewport boundaries will be clamped to the viewport boundaries during animation.
  /// Keyframe time offsets are considered to be relative to the previous keyframe
  /// in the list or relative to the start of the animation if the current keyframe
  /// is first in the list.
  /// Time offset of the first keyframe in the list should be 0, otherwise an error occurs
  /// and creation of the keyframe track will fail.
  ///
  /// [easingFunction] The easing function to apply during keyframe interpolation.
  ///
  /// [interpolationMode] The type of interpolation done between keyframe values.
  ///
  /// Returns [MapCameraKeyframeTrack]. A keyframe track over the principal point.
  ///
  static MapCameraKeyframeTrack principalPoint(List<Point2DKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) => $prototype.principalPoint(keyframes, easingFunction, interpolationMode);
  /// Creates a map camera principal point keyframe track.
  ///
  /// It enables animations on the point
  /// where the map camera's target is placed in normalized view coordinates. (0,0) is top left of
  /// the viewport, (1, 1) is bottom right.
  ///
  /// [keyframes] The list of keyframes that specify how the camera property is changed.
  /// Point values must be in normalized screen coordinates with origin (0,0) in the top left and (1,1) in the bottom right of the viewport.
  /// Point values outside of viewport boundaries will be clamped to the viewport boundaries during animation.
  /// Keyframe time offsets are considered to be relative to the previous keyframe
  /// in the list or relative to the start of the animation if the current keyframe
  /// is first in the list.
  /// Time offset of the first keyframe in the list should be 0, otherwise an error occurs
  /// and creation of the keyframe track will fail.
  ///
  /// [easingFunction] The easing function to apply during keyframe interpolation.
  ///
  /// [interpolationMode] The type of interpolation done between keyframe values.
  ///
  static MapCameraKeyframeTrack normalizedPrincipalPoint(List<Anchor2DKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) => $prototype.normalizedPrincipalPoint(keyframes, easingFunction, interpolationMode);
  /// Creates a map camera field-of-view keyframe track.
  ///
  /// It enables animations over the angle of
  /// the field of view captured by the map camera in degrees. Values will be clamped to a range
  /// from 0 to 180.
  ///
  /// [keyframes] The list of keyframes that specify how the camera property is changed.
  /// Keyframe time offsets are considered to be relative to the previous keyframe
  /// in the list or relative to the start of the animation if the current keyframe
  /// is first in the list.
  /// Time offset of the first keyframe in the list should be 0, otherwise an error occurs
  /// and creation of the keyframe track will fail.
  ///
  /// [easingFunction] The easing function to apply during keyframe interpolation.
  ///
  /// [interpolationMode] The type of interpolation done between keyframe values.
  ///
  /// Returns [MapCameraKeyframeTrack]. A keyframe track over the map camera field-of-view.
  ///
  static MapCameraKeyframeTrack fieldOfView(List<ScalarKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) => $prototype.fieldOfView(keyframes, easingFunction, interpolationMode);
  /// Creates a map camera focal length keyframe track.
  ///
  /// It enables animations over the focal length
  /// which describes the distance between the lens and the focused image on the sensor of the
  /// virtual map camera in pixels. It is clamped from 0 to plus infinity.
  ///
  /// [keyframes] The list of keyframes that specify how the camera property is changed.
  /// Keyframe time offsets are considered to be relative to the previous keyframe
  /// in the list or relative to the start of the animation if the current keyframe
  /// is first in the list.
  /// Time offset of the first keyframe in the list should be 0, otherwise an error occurs
  /// and creation of the keyframe track will fail.
  ///
  /// [easingFunction] The easing function to apply during keyframe interpolation.
  ///
  /// [interpolationMode] The type of interpolation done between keyframe values.
  ///
  /// Returns [MapCameraKeyframeTrack]. A keyframe track over the map camera focal length.
  ///
  static MapCameraKeyframeTrack focalLength(List<ScalarKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) => $prototype.focalLength(keyframes, easingFunction, interpolationMode);
  EasingFunction get easingFunction;

  KeyframeInterpolationMode get interpolationMode;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapCameraKeyframeTrack$Impl(Pointer<Void>.fromAddress(0));
}

/// Describes a reason for failing to create a MapCameraKeyframeTrack.
enum MapCameraKeyframeTrackInstantiationErrorCode {
    /// List of keyframes is empty.
    emptyKeyframeList,
    /// Invalid keyframe duration value.
    invalidKeyframeDuration
}

// MapCameraKeyframeTrackInstantiationErrorCode "private" section, not exported.

int sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeToFfi(MapCameraKeyframeTrackInstantiationErrorCode value) {
  switch (value) {
  case MapCameraKeyframeTrackInstantiationErrorCode.emptyKeyframeList:
    return 1;
  case MapCameraKeyframeTrackInstantiationErrorCode.invalidKeyframeDuration:
    return 2;
  default:
    throw StateError("Invalid enum value $value for MapCameraKeyframeTrackInstantiationErrorCode enum.");
  }
}

MapCameraKeyframeTrackInstantiationErrorCode sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return MapCameraKeyframeTrackInstantiationErrorCode.emptyKeyframeList;
  case 2:
    return MapCameraKeyframeTrackInstantiationErrorCode.invalidKeyframeDuration;
  default:
    throw StateError("Invalid numeric value $handle for MapCameraKeyframeTrackInstantiationErrorCode enum.");
  }
}

void sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeReleaseFfiHandle(int handle) {}

final _sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_InstantiationErrorCode_create_handle_nullable'));
final _sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_InstantiationErrorCode_release_handle_nullable'));
final _sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeToFfiNullable(MapCameraKeyframeTrackInstantiationErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeToFfi(value);
  final result = _sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeCreateHandleNullable(_handle);
  sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

MapCameraKeyframeTrackInstantiationErrorCode? sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeGetValueNullable(handle);
  final result = sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeFromFfi(_handle);
  sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeReleaseHandleNullable(handle);

// End of MapCameraKeyframeTrackInstantiationErrorCode "private" section.
/// Thrown when a problem occurs while trying to create [MapCameraKeyframeTrack].
class MapCameraKeyframeTrackInstantiationException implements Exception {
  final MapCameraKeyframeTrackInstantiationErrorCode error;
  MapCameraKeyframeTrackInstantiationException(this.error);
}

// MapCameraKeyframeTrack "private" section, not exported.

final _sdkMapviewMapcamerakeyframetrackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_register_finalizer'));
final _sdkMapviewMapcamerakeyframetrackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_copy_handle'));
final _sdkMapviewMapcamerakeyframetrackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_release_handle'));







final _lookAtDistanceReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_lookAtDistance__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_release_handle'));
final _lookAtDistanceReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_lookAtDistance__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_result'));
final _lookAtDistanceReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_lookAtDistance__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_error'));
final _lookAtDistanceReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_lookAtDistance__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_has_error'));


final _lookAtTargetReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_lookAtTarget__ListOf_sdk_animation_GeoCoordinatesKeyframe_EasingFunction_KeyframeInterpolationMode_return_release_handle'));
final _lookAtTargetReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_lookAtTarget__ListOf_sdk_animation_GeoCoordinatesKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_result'));
final _lookAtTargetReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_lookAtTarget__ListOf_sdk_animation_GeoCoordinatesKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_error'));
final _lookAtTargetReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_lookAtTarget__ListOf_sdk_animation_GeoCoordinatesKeyframe_EasingFunction_KeyframeInterpolationMode_return_has_error'));


final _lookAtOrientationReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_lookAtOrientation__ListOf_sdk_animation_GeoOrientationKeyframe_EasingFunction_KeyframeInterpolationMode_return_release_handle'));
final _lookAtOrientationReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_lookAtOrientation__ListOf_sdk_animation_GeoOrientationKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_result'));
final _lookAtOrientationReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_lookAtOrientation__ListOf_sdk_animation_GeoOrientationKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_error'));
final _lookAtOrientationReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_lookAtOrientation__ListOf_sdk_animation_GeoOrientationKeyframe_EasingFunction_KeyframeInterpolationMode_return_has_error'));


final _principalPointReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_principalPoint__ListOf_sdk_animation_Point2DKeyframe_EasingFunction_KeyframeInterpolationMode_return_release_handle'));
final _principalPointReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_principalPoint__ListOf_sdk_animation_Point2DKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_result'));
final _principalPointReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_principalPoint__ListOf_sdk_animation_Point2DKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_error'));
final _principalPointReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_principalPoint__ListOf_sdk_animation_Point2DKeyframe_EasingFunction_KeyframeInterpolationMode_return_has_error'));


final _normalizedPrincipalPointReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_normalizedPrincipalPoint__ListOf_sdk_animation_Anchor2DKeyframe_EasingFunction_KeyframeInterpolationMode_return_release_handle'));
final _normalizedPrincipalPointReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_normalizedPrincipalPoint__ListOf_sdk_animation_Anchor2DKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_result'));
final _normalizedPrincipalPointReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_normalizedPrincipalPoint__ListOf_sdk_animation_Anchor2DKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_error'));
final _normalizedPrincipalPointReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_normalizedPrincipalPoint__ListOf_sdk_animation_Anchor2DKeyframe_EasingFunction_KeyframeInterpolationMode_return_has_error'));


final _fieldOfViewReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_fieldOfView__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_release_handle'));
final _fieldOfViewReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_fieldOfView__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_result'));
final _fieldOfViewReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_fieldOfView__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_error'));
final _fieldOfViewReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_fieldOfView__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_has_error'));


final _focalLengthReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_focalLength__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_release_handle'));
final _focalLengthReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_focalLength__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_result'));
final _focalLengthReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_focalLength__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_error'));
final _focalLengthReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraKeyframeTrack_focalLength__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_has_error'));


/// @nodoc
@visibleForTesting
class MapCameraKeyframeTrack$Impl extends __lib.NativeBase implements MapCameraKeyframeTrack {

  MapCameraKeyframeTrack$Impl(Pointer<Void> handle) : super(handle);

  @override
  List<ScalarKeyframe>? getScalarKeyframes() {
    final _getScalarKeyframesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraKeyframeTrack_getScalarKeyframes'));
    final _handle = this.handle;
    final __resultHandle = _getScalarKeyframesFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingslistofSdkAnimationScalarkeyframeFromFfiNullable(__resultHandle);
    } finally {
      harpSdkBindingslistofSdkAnimationScalarkeyframeReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  List<Point2DKeyframe>? getPoint2DKeyframes() {
    final _getPoint2DKeyframesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraKeyframeTrack_getPoint2DKeyframes'));
    final _handle = this.handle;
    final __resultHandle = _getPoint2DKeyframesFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingslistofSdkAnimationPoint2dkeyframeFromFfiNullable(__resultHandle);
    } finally {
      harpSdkBindingslistofSdkAnimationPoint2dkeyframeReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  List<Anchor2DKeyframe>? getAnchor2DKeyframes() {
    final _getAnchor2DKeyframesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraKeyframeTrack_getAnchor2DKeyframes'));
    final _handle = this.handle;
    final __resultHandle = _getAnchor2DKeyframesFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingslistofSdkAnimationAnchor2dkeyframeFromFfiNullable(__resultHandle);
    } finally {
      harpSdkBindingslistofSdkAnimationAnchor2dkeyframeReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  List<GeoCoordinatesKeyframe>? getGeoCoordinatesKeyframes() {
    final _getGeoCoordinatesKeyframesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraKeyframeTrack_getGeoCoordinatesKeyframes'));
    final _handle = this.handle;
    final __resultHandle = _getGeoCoordinatesKeyframesFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingslistofSdkAnimationGeocoordinateskeyframeFromFfiNullable(__resultHandle);
    } finally {
      harpSdkBindingslistofSdkAnimationGeocoordinateskeyframeReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  List<GeoOrientationKeyframe>? getGeoOrientationKeyframes() {
    final _getGeoOrientationKeyframesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraKeyframeTrack_getGeoOrientationKeyframes'));
    final _handle = this.handle;
    final __resultHandle = _getGeoOrientationKeyframesFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingslistofSdkAnimationGeoorientationkeyframeFromFfiNullable(__resultHandle);
    } finally {
      harpSdkBindingslistofSdkAnimationGeoorientationkeyframeReleaseFfiHandleNullable(__resultHandle);

    }

  }

  MapCameraKeyframeTrack lookAtDistance(List<ScalarKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) {
    final _lookAtDistanceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapCameraKeyframeTrack_lookAtDistance__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode'));
    final _keyframesHandle = harpSdkBindingslistofSdkAnimationScalarkeyframeToFfi(keyframes);
    final _easingFunctionHandle = sdkAnimationEasingfunctionToFfi(easingFunction);
    final _interpolationModeHandle = sdkAnimationKeyframeinterpolationmodeToFfi(interpolationMode);
    final __callResultHandle = _lookAtDistanceFfi(__lib.LibraryContext.isolateId, _keyframesHandle, _easingFunctionHandle, _interpolationModeHandle);
    harpSdkBindingslistofSdkAnimationScalarkeyframeReleaseFfiHandle(_keyframesHandle);
    sdkAnimationEasingfunctionReleaseFfiHandle(_easingFunctionHandle);
    sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(_interpolationModeHandle);
    if (_lookAtDistanceReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _lookAtDistanceReturnGetError(__callResultHandle);
        _lookAtDistanceReturnReleaseHandle(__callResultHandle);
        try {
          throw MapCameraKeyframeTrackInstantiationException(sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _lookAtDistanceReturnGetResult(__callResultHandle);
    _lookAtDistanceReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMapviewMapcamerakeyframetrackFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcamerakeyframetrackReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraKeyframeTrack lookAtTarget(List<GeoCoordinatesKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) {
    final _lookAtTargetFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapCameraKeyframeTrack_lookAtTarget__ListOf_sdk_animation_GeoCoordinatesKeyframe_EasingFunction_KeyframeInterpolationMode'));
    final _keyframesHandle = harpSdkBindingslistofSdkAnimationGeocoordinateskeyframeToFfi(keyframes);
    final _easingFunctionHandle = sdkAnimationEasingfunctionToFfi(easingFunction);
    final _interpolationModeHandle = sdkAnimationKeyframeinterpolationmodeToFfi(interpolationMode);
    final __callResultHandle = _lookAtTargetFfi(__lib.LibraryContext.isolateId, _keyframesHandle, _easingFunctionHandle, _interpolationModeHandle);
    harpSdkBindingslistofSdkAnimationGeocoordinateskeyframeReleaseFfiHandle(_keyframesHandle);
    sdkAnimationEasingfunctionReleaseFfiHandle(_easingFunctionHandle);
    sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(_interpolationModeHandle);
    if (_lookAtTargetReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _lookAtTargetReturnGetError(__callResultHandle);
        _lookAtTargetReturnReleaseHandle(__callResultHandle);
        try {
          throw MapCameraKeyframeTrackInstantiationException(sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _lookAtTargetReturnGetResult(__callResultHandle);
    _lookAtTargetReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMapviewMapcamerakeyframetrackFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcamerakeyframetrackReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraKeyframeTrack lookAtOrientation(List<GeoOrientationKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) {
    final _lookAtOrientationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapCameraKeyframeTrack_lookAtOrientation__ListOf_sdk_animation_GeoOrientationKeyframe_EasingFunction_KeyframeInterpolationMode'));
    final _keyframesHandle = harpSdkBindingslistofSdkAnimationGeoorientationkeyframeToFfi(keyframes);
    final _easingFunctionHandle = sdkAnimationEasingfunctionToFfi(easingFunction);
    final _interpolationModeHandle = sdkAnimationKeyframeinterpolationmodeToFfi(interpolationMode);
    final __callResultHandle = _lookAtOrientationFfi(__lib.LibraryContext.isolateId, _keyframesHandle, _easingFunctionHandle, _interpolationModeHandle);
    harpSdkBindingslistofSdkAnimationGeoorientationkeyframeReleaseFfiHandle(_keyframesHandle);
    sdkAnimationEasingfunctionReleaseFfiHandle(_easingFunctionHandle);
    sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(_interpolationModeHandle);
    if (_lookAtOrientationReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _lookAtOrientationReturnGetError(__callResultHandle);
        _lookAtOrientationReturnReleaseHandle(__callResultHandle);
        try {
          throw MapCameraKeyframeTrackInstantiationException(sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _lookAtOrientationReturnGetResult(__callResultHandle);
    _lookAtOrientationReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMapviewMapcamerakeyframetrackFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcamerakeyframetrackReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraKeyframeTrack principalPoint(List<Point2DKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) {
    final _principalPointFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapCameraKeyframeTrack_principalPoint__ListOf_sdk_animation_Point2DKeyframe_EasingFunction_KeyframeInterpolationMode'));
    final _keyframesHandle = harpSdkBindingslistofSdkAnimationPoint2dkeyframeToFfi(keyframes);
    final _easingFunctionHandle = sdkAnimationEasingfunctionToFfi(easingFunction);
    final _interpolationModeHandle = sdkAnimationKeyframeinterpolationmodeToFfi(interpolationMode);
    final __callResultHandle = _principalPointFfi(__lib.LibraryContext.isolateId, _keyframesHandle, _easingFunctionHandle, _interpolationModeHandle);
    harpSdkBindingslistofSdkAnimationPoint2dkeyframeReleaseFfiHandle(_keyframesHandle);
    sdkAnimationEasingfunctionReleaseFfiHandle(_easingFunctionHandle);
    sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(_interpolationModeHandle);
    if (_principalPointReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _principalPointReturnGetError(__callResultHandle);
        _principalPointReturnReleaseHandle(__callResultHandle);
        try {
          throw MapCameraKeyframeTrackInstantiationException(sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _principalPointReturnGetResult(__callResultHandle);
    _principalPointReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMapviewMapcamerakeyframetrackFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcamerakeyframetrackReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraKeyframeTrack normalizedPrincipalPoint(List<Anchor2DKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) {
    final _normalizedPrincipalPointFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapCameraKeyframeTrack_normalizedPrincipalPoint__ListOf_sdk_animation_Anchor2DKeyframe_EasingFunction_KeyframeInterpolationMode'));
    final _keyframesHandle = harpSdkBindingslistofSdkAnimationAnchor2dkeyframeToFfi(keyframes);
    final _easingFunctionHandle = sdkAnimationEasingfunctionToFfi(easingFunction);
    final _interpolationModeHandle = sdkAnimationKeyframeinterpolationmodeToFfi(interpolationMode);
    final __callResultHandle = _normalizedPrincipalPointFfi(__lib.LibraryContext.isolateId, _keyframesHandle, _easingFunctionHandle, _interpolationModeHandle);
    harpSdkBindingslistofSdkAnimationAnchor2dkeyframeReleaseFfiHandle(_keyframesHandle);
    sdkAnimationEasingfunctionReleaseFfiHandle(_easingFunctionHandle);
    sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(_interpolationModeHandle);
    if (_normalizedPrincipalPointReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _normalizedPrincipalPointReturnGetError(__callResultHandle);
        _normalizedPrincipalPointReturnReleaseHandle(__callResultHandle);
        try {
          throw MapCameraKeyframeTrackInstantiationException(sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _normalizedPrincipalPointReturnGetResult(__callResultHandle);
    _normalizedPrincipalPointReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMapviewMapcamerakeyframetrackFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcamerakeyframetrackReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraKeyframeTrack fieldOfView(List<ScalarKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) {
    final _fieldOfViewFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapCameraKeyframeTrack_fieldOfView__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode'));
    final _keyframesHandle = harpSdkBindingslistofSdkAnimationScalarkeyframeToFfi(keyframes);
    final _easingFunctionHandle = sdkAnimationEasingfunctionToFfi(easingFunction);
    final _interpolationModeHandle = sdkAnimationKeyframeinterpolationmodeToFfi(interpolationMode);
    final __callResultHandle = _fieldOfViewFfi(__lib.LibraryContext.isolateId, _keyframesHandle, _easingFunctionHandle, _interpolationModeHandle);
    harpSdkBindingslistofSdkAnimationScalarkeyframeReleaseFfiHandle(_keyframesHandle);
    sdkAnimationEasingfunctionReleaseFfiHandle(_easingFunctionHandle);
    sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(_interpolationModeHandle);
    if (_fieldOfViewReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _fieldOfViewReturnGetError(__callResultHandle);
        _fieldOfViewReturnReleaseHandle(__callResultHandle);
        try {
          throw MapCameraKeyframeTrackInstantiationException(sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _fieldOfViewReturnGetResult(__callResultHandle);
    _fieldOfViewReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMapviewMapcamerakeyframetrackFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcamerakeyframetrackReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraKeyframeTrack focalLength(List<ScalarKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) {
    final _focalLengthFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapCameraKeyframeTrack_focalLength__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode'));
    final _keyframesHandle = harpSdkBindingslistofSdkAnimationScalarkeyframeToFfi(keyframes);
    final _easingFunctionHandle = sdkAnimationEasingfunctionToFfi(easingFunction);
    final _interpolationModeHandle = sdkAnimationKeyframeinterpolationmodeToFfi(interpolationMode);
    final __callResultHandle = _focalLengthFfi(__lib.LibraryContext.isolateId, _keyframesHandle, _easingFunctionHandle, _interpolationModeHandle);
    harpSdkBindingslistofSdkAnimationScalarkeyframeReleaseFfiHandle(_keyframesHandle);
    sdkAnimationEasingfunctionReleaseFfiHandle(_easingFunctionHandle);
    sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(_interpolationModeHandle);
    if (_focalLengthReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _focalLengthReturnGetError(__callResultHandle);
        _focalLengthReturnReleaseHandle(__callResultHandle);
        try {
          throw MapCameraKeyframeTrackInstantiationException(sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapcamerakeyframetrackInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _focalLengthReturnGetResult(__callResultHandle);
    _focalLengthReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMapviewMapcamerakeyframetrackFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcamerakeyframetrackReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  EasingFunction get easingFunction {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraKeyframeTrack_easingFunction_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkAnimationEasingfunctionFromFfi(__resultHandle);
    } finally {
      sdkAnimationEasingfunctionReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  KeyframeInterpolationMode get interpolationMode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraKeyframeTrack_interpolationMode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkAnimationKeyframeinterpolationmodeFromFfi(__resultHandle);
    } finally {
      sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkMapviewMapcamerakeyframetrackToFfi(MapCameraKeyframeTrack value) =>
  _sdkMapviewMapcamerakeyframetrackCopyHandle((value as __lib.NativeBase).handle);

MapCameraKeyframeTrack sdkMapviewMapcamerakeyframetrackFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapCameraKeyframeTrack) return instance;

  final _copiedHandle = _sdkMapviewMapcamerakeyframetrackCopyHandle(handle);
  final result = MapCameraKeyframeTrack$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapcamerakeyframetrackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapcamerakeyframetrackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcamerakeyframetrackReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcamerakeyframetrackToFfiNullable(MapCameraKeyframeTrack? value) =>
  value != null ? sdkMapviewMapcamerakeyframetrackToFfi(value) : Pointer<Void>.fromAddress(0);

MapCameraKeyframeTrack? sdkMapviewMapcamerakeyframetrackFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcamerakeyframetrackFromFfi(handle) : null;

void sdkMapviewMapcamerakeyframetrackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcamerakeyframetrackReleaseHandle(handle);

// End of MapCameraKeyframeTrack "private" section.

