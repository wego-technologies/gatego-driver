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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/animation/easing_function.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera_animation.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera_keyframe_track.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera_update.dart';
import 'package:meta/meta.dart';

/// Factory for creating MapCameraAnimation objects to change map's camera over time.
abstract class MapCameraAnimationFactory {

  /// Creates a MapCameraAnimation to gradually update the camera properties within a specified
  /// duration from its current values to the ones defined in the [MapCameraAnimationFactory.createAnimationFromUpdate.cameraUpdate].
  ///
  /// [cameraUpdate] Update which should be applied to the map camera.
  ///
  /// [duration] Duration of the animation. Negative duration results in no camera change when applied.
  ///
  /// [easingFunction] Easing function to apply.
  ///
  /// Returns [MapCameraAnimation]. MapCameraAnimation instance
  ///
  static MapCameraAnimation createAnimationFromUpdate(MapCameraUpdate cameraUpdate, Duration duration, EasingFunction easingFunction) => $prototype.createAnimationFromUpdate(cameraUpdate, duration, easingFunction);
  /// Creates a MapCameraAnimation for a movement defined by the supplied [MapCameraAnimationFactory.createAnimationFromKeyframeTrack.track].
  ///
  /// Returns [MapCameraAnimation]. MapCameraAnimation instance
  ///
  static MapCameraAnimation createAnimationFromKeyframeTrack(MapCameraKeyframeTrack track) => $prototype.createAnimationFromKeyframeTrack(track);
  /// Creates a MapCameraAnimation for a movement defined by the supplied list of [MapCameraAnimationFactory.createAnimationFromKeyframeTracks.tracks].
  ///
  /// Keyframe tracks specify how the map camera properties change during the animation.
  /// For the animation to be possible, no two different tracks can
  /// affect the same map camera property. The input tracks are validated with that in mind.
  ///
  /// However, the following cases can only be detected at the time when animation is started:
  /// - Changing altitude of camera position also changes camera look-at distance
  ///   and at high altitudes, also camera look-at orientation.
  /// - Changing tilt of camera orientation also changes camera look-at distance
  ///   and camera look-at target.
  /// - Changing bearing of camera orientation also changes
  ///   camera look-at target if current tilt is not 0.
  /// - Changing tilt or bearing of camera look-at orientation also changes
  ///   camera position.
  /// - Changing camera look-at orientation also changes camera look-at distance
  ///   if tilt is not 0.
  ///
  /// Returns [MapCameraAnimation]. MapCameraAnimation instance
  ///
  static MapCameraAnimation createAnimationFromKeyframeTracks(List<MapCameraKeyframeTrack> tracks) => $prototype.createAnimationFromKeyframeTracks(tracks);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapCameraAnimationFactory$Impl(Pointer<Void>.fromAddress(0));
}


// MapCameraAnimationFactory "private" section, not exported.

final _sdkMapviewMapcameraanimationfactoryRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapCameraAnimationFactory_register_finalizer'));
final _sdkMapviewMapcameraanimationfactoryCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimationFactory_copy_handle'));
final _sdkMapviewMapcameraanimationfactoryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimationFactory_release_handle'));




final _createAnimationFromKeyframeTracksReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimationFactory_createAnimation__ListOf_sdk_mapview_MapCameraKeyframeTrack_return_release_handle'));
final _createAnimationFromKeyframeTracksReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimationFactory_createAnimation__ListOf_sdk_mapview_MapCameraKeyframeTrack_return_get_result'));
final _createAnimationFromKeyframeTracksReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimationFactory_createAnimation__ListOf_sdk_mapview_MapCameraKeyframeTrack_return_get_error'));
final _createAnimationFromKeyframeTracksReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimationFactory_createAnimation__ListOf_sdk_mapview_MapCameraKeyframeTrack_return_has_error'));


/// @nodoc
@visibleForTesting
class MapCameraAnimationFactory$Impl extends __lib.NativeBase implements MapCameraAnimationFactory {

  MapCameraAnimationFactory$Impl(Pointer<Void> handle) : super(handle);

  MapCameraAnimation createAnimationFromUpdate(MapCameraUpdate cameraUpdate, Duration duration, EasingFunction easingFunction) {
    final _createAnimationFromUpdateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint64, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapCameraAnimationFactory_createAnimation__MapCameraUpdate_Duration_EasingFunction'));
    final _cameraUpdateHandle = sdkMapviewMapcameraupdateToFfi(cameraUpdate);
    final _durationHandle = durationToFfi(duration);
    final _easingFunctionHandle = sdkAnimationEasingfunctionToFfi(easingFunction);
    final __resultHandle = _createAnimationFromUpdateFfi(__lib.LibraryContext.isolateId, _cameraUpdateHandle, _durationHandle, _easingFunctionHandle);
    sdkMapviewMapcameraupdateReleaseFfiHandle(_cameraUpdateHandle);
    durationReleaseFfiHandle(_durationHandle);
    sdkAnimationEasingfunctionReleaseFfiHandle(_easingFunctionHandle);
    try {
      return sdkMapviewMapcameraanimationFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraanimationReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraAnimation createAnimationFromKeyframeTrack(MapCameraKeyframeTrack track) {
    final _createAnimationFromKeyframeTrackFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraAnimationFactory_createAnimation__MapCameraKeyframeTrack'));
    final _trackHandle = sdkMapviewMapcamerakeyframetrackToFfi(track);
    final __resultHandle = _createAnimationFromKeyframeTrackFfi(__lib.LibraryContext.isolateId, _trackHandle);
    sdkMapviewMapcamerakeyframetrackReleaseFfiHandle(_trackHandle);
    try {
      return sdkMapviewMapcameraanimationFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraanimationReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraAnimation createAnimationFromKeyframeTracks(List<MapCameraKeyframeTrack> tracks) {
    final _createAnimationFromKeyframeTracksFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraAnimationFactory_createAnimation__ListOf_sdk_mapview_MapCameraKeyframeTrack'));
    final _tracksHandle = harpSdkBindingslistofSdkMapviewMapcamerakeyframetrackToFfi(tracks);
    final __callResultHandle = _createAnimationFromKeyframeTracksFfi(__lib.LibraryContext.isolateId, _tracksHandle);
    harpSdkBindingslistofSdkMapviewMapcamerakeyframetrackReleaseFfiHandle(_tracksHandle);
    if (_createAnimationFromKeyframeTracksReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _createAnimationFromKeyframeTracksReturnGetError(__callResultHandle);
        _createAnimationFromKeyframeTracksReturnReleaseHandle(__callResultHandle);
        try {
          throw MapCameraAnimationInstantiationException(sdkMapviewMapcameraanimationInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapcameraanimationInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _createAnimationFromKeyframeTracksReturnGetResult(__callResultHandle);
    _createAnimationFromKeyframeTracksReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMapviewMapcameraanimationFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraanimationReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkMapviewMapcameraanimationfactoryToFfi(MapCameraAnimationFactory value) =>
  _sdkMapviewMapcameraanimationfactoryCopyHandle((value as __lib.NativeBase).handle);

MapCameraAnimationFactory sdkMapviewMapcameraanimationfactoryFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapCameraAnimationFactory) return instance;

  final _copiedHandle = _sdkMapviewMapcameraanimationfactoryCopyHandle(handle);
  final result = MapCameraAnimationFactory$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapcameraanimationfactoryRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapcameraanimationfactoryReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcameraanimationfactoryReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcameraanimationfactoryToFfiNullable(MapCameraAnimationFactory? value) =>
  value != null ? sdkMapviewMapcameraanimationfactoryToFfi(value) : Pointer<Void>.fromAddress(0);

MapCameraAnimationFactory? sdkMapviewMapcameraanimationfactoryFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcameraanimationfactoryFromFfi(handle) : null;

void sdkMapviewMapcameraanimationfactoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcameraanimationfactoryReleaseHandle(handle);

// End of MapCameraAnimationFactory "private" section.

