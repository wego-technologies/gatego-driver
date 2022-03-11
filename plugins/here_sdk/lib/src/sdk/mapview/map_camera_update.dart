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

/// An update that can be applied to the map camera.
///
/// Creation is done via [MapCameraUpdateFactory].
abstract class MapCameraUpdate {

}


// MapCameraUpdate "private" section, not exported.

final _sdkMapviewMapcameraupdateRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapCameraUpdate_register_finalizer'));
final _sdkMapviewMapcameraupdateCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraUpdate_copy_handle'));
final _sdkMapviewMapcameraupdateReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraUpdate_release_handle'));


class MapCameraUpdate$Impl extends __lib.NativeBase implements MapCameraUpdate {

  MapCameraUpdate$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkMapviewMapcameraupdateToFfi(MapCameraUpdate value) =>
  _sdkMapviewMapcameraupdateCopyHandle((value as __lib.NativeBase).handle);

MapCameraUpdate sdkMapviewMapcameraupdateFromFfi(Pointer<Void> handle) {

  final _copiedHandle = _sdkMapviewMapcameraupdateCopyHandle(handle);
  final result = MapCameraUpdate$Impl(_copiedHandle);
  _sdkMapviewMapcameraupdateRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapcameraupdateReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcameraupdateReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcameraupdateToFfiNullable(MapCameraUpdate? value) =>
  value != null ? sdkMapviewMapcameraupdateToFfi(value) : Pointer<Void>.fromAddress(0);

MapCameraUpdate? sdkMapviewMapcameraupdateFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcameraupdateFromFfi(handle) : null;

void sdkMapviewMapcameraupdateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcameraupdateReleaseHandle(handle);

// End of MapCameraUpdate "private" section.

