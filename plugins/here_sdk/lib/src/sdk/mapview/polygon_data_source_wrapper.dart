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
import 'package:meta/meta.dart';

/// @nodoc
@internal
abstract class PolygonDataSourceWrapper {

}


// PolygonDataSourceWrapper "private" section, not exported.

final _sdkMapviewPolygondatasourcewrapperRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_PolygonDataSourceWrapper_register_finalizer'));
final _sdkMapviewPolygondatasourcewrapperCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PolygonDataSourceWrapper_copy_handle'));
final _sdkMapviewPolygondatasourcewrapperReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PolygonDataSourceWrapper_release_handle'));


class PolygonDataSourceWrapper$Impl extends __lib.NativeBase implements PolygonDataSourceWrapper {

  PolygonDataSourceWrapper$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkMapviewPolygondatasourcewrapperToFfi(PolygonDataSourceWrapper value) =>
  _sdkMapviewPolygondatasourcewrapperCopyHandle((value as __lib.NativeBase).handle);

PolygonDataSourceWrapper sdkMapviewPolygondatasourcewrapperFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PolygonDataSourceWrapper) return instance;

  final _copiedHandle = _sdkMapviewPolygondatasourcewrapperCopyHandle(handle);
  final result = PolygonDataSourceWrapper$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewPolygondatasourcewrapperRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewPolygondatasourcewrapperReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewPolygondatasourcewrapperReleaseHandle(handle);

Pointer<Void> sdkMapviewPolygondatasourcewrapperToFfiNullable(PolygonDataSourceWrapper? value) =>
  value != null ? sdkMapviewPolygondatasourcewrapperToFfi(value) : Pointer<Void>.fromAddress(0);

PolygonDataSourceWrapper? sdkMapviewPolygondatasourcewrapperFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewPolygondatasourcewrapperFromFfi(handle) : null;

void sdkMapviewPolygondatasourcewrapperReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewPolygondatasourcewrapperReleaseHandle(handle);

// End of PolygonDataSourceWrapper "private" section.

