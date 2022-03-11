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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera.dart';

/// Abstract class for objects that want to get updates whenever the map is redrawn after
/// camera parameters change.
abstract class MapCameraObserver {
  /// Abstract class for objects that want to get updates whenever the map is redrawn after
  /// camera parameters change.

  factory MapCameraObserver(
    void Function(MapCameraState) onCameraUpdatedLambda,

  ) => MapCameraObserver$Lambdas(
    onCameraUpdatedLambda,

  );

  /// Called on the main thread after the map is drawn.
  ///
  /// [cameraState] Camera parameters at the time the map was drawn.
  ///
  void onCameraUpdated(MapCameraState cameraState);
}


// MapCameraObserver "private" section, not exported.

final _sdkMapviewMapcameraobserverRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapCameraObserver_register_finalizer'));
final _sdkMapviewMapcameraobserverCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraObserver_copy_handle'));
final _sdkMapviewMapcameraobserverReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraObserver_release_handle'));
final _sdkMapviewMapcameraobserverCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_mapview_MapCameraObserver_create_proxy'));
final _sdkMapviewMapcameraobserverGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraObserver_get_type_id'));


class MapCameraObserver$Lambdas implements MapCameraObserver {
  void Function(MapCameraState) onCameraUpdatedLambda;

  MapCameraObserver$Lambdas(
    this.onCameraUpdatedLambda,

  );

  @override
  void onCameraUpdated(MapCameraState cameraState) =>
    onCameraUpdatedLambda(cameraState);
}

class MapCameraObserver$Impl extends __lib.NativeBase implements MapCameraObserver {

  MapCameraObserver$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onCameraUpdated(MapCameraState cameraState) {
    final _onCameraUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraObserver_onCameraUpdated__State'));
    final _cameraStateHandle = sdkMapviewMapcameraStateToFfi(cameraState);
    final _handle = this.handle;
    _onCameraUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _cameraStateHandle);
    sdkMapviewMapcameraStateReleaseFfiHandle(_cameraStateHandle);

  }


}

int _sdkMapviewMapcameraobserveronCameraUpdatedStatic(Object _obj, Pointer<Void> cameraState) {

  try {
    (_obj as MapCameraObserver).onCameraUpdated(sdkMapviewMapcameraStateFromFfi(cameraState));
  } finally {
    sdkMapviewMapcameraStateReleaseFfiHandle(cameraState);
  }
  return 0;
}


Pointer<Void> sdkMapviewMapcameraobserverToFfi(MapCameraObserver value) {
  if (value is __lib.NativeBase) return _sdkMapviewMapcameraobserverCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkMapviewMapcameraobserverCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkMapviewMapcameraobserveronCameraUpdatedStatic, __lib.unknownError)
  );

  return result;
}

MapCameraObserver sdkMapviewMapcameraobserverFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapCameraObserver) return instance;

  final _typeIdHandle = _sdkMapviewMapcameraobserverGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMapcameraobserverCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapCameraObserver$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapcameraobserverRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapcameraobserverReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcameraobserverReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcameraobserverToFfiNullable(MapCameraObserver? value) =>
  value != null ? sdkMapviewMapcameraobserverToFfi(value) : Pointer<Void>.fromAddress(0);

MapCameraObserver? sdkMapviewMapcameraobserverFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcameraobserverFromFfi(handle) : null;

void sdkMapviewMapcameraobserverReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcameraobserverReleaseHandle(handle);

// End of MapCameraObserver "private" section.

