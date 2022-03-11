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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/log_appender.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_options.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/parameter_configuration.dart';
import 'package:meta/meta.dart';

/// Holds internal services and configurations needed by various HERE SDK modules.
///
/// It is created automatically during the SDK initialization process,
/// but it can also be created programmatically, for example, to set new
/// credentials for a specific module at runtime.
abstract class SDKNativeEngine {
  /// Makes a new instance of SDKNativeEngine using supplied options.
  ///
  /// [options] The options for the new engine.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory SDKNativeEngine(SDKOptions options) => $prototype.make(options);

  /// Overrides HERE SDK access key secret with new value.
  ///
  /// The new credentials will be used for new requests.
  ///
  /// **Note:**
  /// This method can be called from any thread.
  /// Access key ID can be set with constructor of SDKNativeEngine.
  /// New instance of SDKNativeEngine should be used if a new access key ID is required.
  ///
  /// [accessKeySecret] New access key secret.
  ///
  void setAccessKeySecret(String accessKeySecret);
  /// Overrides the token scope of the HERE SDK with new value.
  ///
  /// A new token will be fetched with the set scope and used for future requests.
  /// Setting an empty string will fetch a token for the global scope.
  ///
  /// This method can be called from any thread.
  ///
  /// [scope] New scope for token
  ///
  void setAccessScope(String scope);
  /// Set a custom log appender to receive log message from the SDK.
  ///
  /// This overwrites a previously set appender.
  ///
  /// [appender] New log appender.
  ///
  void setLogAppender(LogAppender appender);
  /// Stops pending requests and closes open files and databases in main thread.
  ///
  /// Dispose signal is sent
  /// to dependent modules. Usage of engine, or dependent modules after calling dispose leads to undefined behavior.
  ///
  /// [finishCallback] the callback which is triggered when operation is finished in main thread.
  ///
  /// @nodoc
  void internaldispose(SDKNativeEngineDisposeCallback finishCallback);
  /// Sets offline mode for SDK, which forbids online connectivity.
  ///
  /// @nodoc
  void internalsetOfflineMode(bool offlineMode);
  /// Gets the options used by this instance of SDKNativeEngine.
  SDKOptions get options;

  /// Gets the shared instance of this SDK engine that can be accessed by any HERE SDK module as the default
  /// engine. This is automatically set as a part of the SDK initialization process.
  static SDKNativeEngine? get sharedInstance => $prototype.sharedInstance;
  /// Sets the shared instance of this SDK engine that can be accessed by any HERE SDK module as the default
  /// engine. This is automatically set as a part of the SDK initialization process.
  static set sharedInstance(SDKNativeEngine? value) { $prototype.sharedInstance = value; }

  /// @nodoc
  @internal
  static ParameterConfiguration get internalparameterConfig => $prototype.internalparameterConfig;
  static set parameterConfig(ParameterConfiguration value) { $prototype.parameterConfig = value; }


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SDKNativeEngine$Impl(Pointer<Void>.fromAddress(0));
}

/// @nodoc
@internal
typedef SDKNativeEngineDisposeCallback = void Function();

// SDKNativeEngineDisposeCallback "private" section, not exported.

final _sdkCoreEngineSdknativeengineDisposecallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_DisposeCallback_register_finalizer'));
final _sdkCoreEngineSdknativeengineDisposecallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_DisposeCallback_copy_handle'));
final _sdkCoreEngineSdknativeengineDisposecallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_DisposeCallback_release_handle'));
final _sdkCoreEngineSdknativeengineDisposecallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_DisposeCallback_create_proxy'));

class SDKNativeEngineDisposeCallback$Impl {
  final Pointer<Void> handle;
  SDKNativeEngineDisposeCallback$Impl(this.handle);

  void internalcall() {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_DisposeCallback_call'));
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId);

  }

}

int _sdkCoreEngineSdknativeengineDisposecallbackcallStatic(Object _obj) {
  
  try {
    (_obj as SDKNativeEngineDisposeCallback)();
  } finally {
  }
  return 0;
}

Pointer<Void> sdkCoreEngineSdknativeengineDisposecallbackToFfi(SDKNativeEngineDisposeCallback value) =>
  _sdkCoreEngineSdknativeengineDisposecallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_sdkCoreEngineSdknativeengineDisposecallbackcallStatic, __lib.unknownError)
  );

SDKNativeEngineDisposeCallback sdkCoreEngineSdknativeengineDisposecallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkCoreEngineSdknativeengineDisposecallbackCopyHandle(handle);
  final _impl = SDKNativeEngineDisposeCallback$Impl(_copiedHandle);
  final result = () => _impl.internalcall();
  _sdkCoreEngineSdknativeengineDisposecallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreEngineSdknativeengineDisposecallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreEngineSdknativeengineDisposecallbackReleaseHandle(handle);

// Nullable SDKNativeEngineDisposeCallback

final _sdkCoreEngineSdknativeengineDisposecallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_DisposeCallback_create_handle_nullable'));
final _sdkCoreEngineSdknativeengineDisposecallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_DisposeCallback_release_handle_nullable'));
final _sdkCoreEngineSdknativeengineDisposecallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_DisposeCallback_get_value_nullable'));

Pointer<Void> sdkCoreEngineSdknativeengineDisposecallbackToFfiNullable(SDKNativeEngineDisposeCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineSdknativeengineDisposecallbackToFfi(value);
  final result = _sdkCoreEngineSdknativeengineDisposecallbackCreateHandleNullable(_handle);
  sdkCoreEngineSdknativeengineDisposecallbackReleaseFfiHandle(_handle);
  return result;
}

SDKNativeEngineDisposeCallback? sdkCoreEngineSdknativeengineDisposecallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineSdknativeengineDisposecallbackGetValueNullable(handle);
  final result = sdkCoreEngineSdknativeengineDisposecallbackFromFfi(_handle);
  sdkCoreEngineSdknativeengineDisposecallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineSdknativeengineDisposecallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineSdknativeengineDisposecallbackReleaseHandleNullable(handle);

// End of SDKNativeEngineDisposeCallback "private" section.

// SDKNativeEngine "private" section, not exported.

final _sdkCoreEngineSdknativeengineRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_register_finalizer'));
final _sdkCoreEngineSdknativeengineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_copy_handle'));
final _sdkCoreEngineSdknativeengineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_release_handle'));


final _makeReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_make__SDKOptions_return_release_handle'));
final _makeReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_make__SDKOptions_return_get_result'));
final _makeReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_make__SDKOptions_return_get_error'));
final _makeReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_make__SDKOptions_return_has_error'));







/// @nodoc
@visibleForTesting
class SDKNativeEngine$Impl extends __lib.NativeBase implements SDKNativeEngine {

  SDKNativeEngine$Impl(Pointer<Void> handle) : super(handle);


  SDKNativeEngine make(SDKOptions options) {
    final _result_handle = _make(options);
    final _result = SDKNativeEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkCoreEngineSdknativeengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make(SDKOptions options) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_make__SDKOptions'));
    final _optionsHandle = sdkCoreEngineSdkoptionsToFfi(options);
    final __callResultHandle = _makeFfi(__lib.LibraryContext.isolateId, _optionsHandle);
    sdkCoreEngineSdkoptionsReleaseFfiHandle(_optionsHandle);
    if (_makeReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _makeReturnGetError(__callResultHandle);
        _makeReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _makeReturnGetResult(__callResultHandle);
    _makeReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  void setAccessKeySecret(String accessKeySecret) {
    final _setAccessKeySecretFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_setAccessKeySecret__String'));
    final _accessKeySecretHandle = stringToFfi(accessKeySecret);
    final _handle = this.handle;
    _setAccessKeySecretFfi(_handle, __lib.LibraryContext.isolateId, _accessKeySecretHandle);
    stringReleaseFfiHandle(_accessKeySecretHandle);

  }

  @override
  void setAccessScope(String scope) {
    final _setAccessScopeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_setAccessScope__String'));
    final _scopeHandle = stringToFfi(scope);
    final _handle = this.handle;
    _setAccessScopeFfi(_handle, __lib.LibraryContext.isolateId, _scopeHandle);
    stringReleaseFfiHandle(_scopeHandle);

  }

  @override
  void setLogAppender(LogAppender appender) {
    final _setLogAppenderFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_setLogAppender__LogAppender'));
    final _appenderHandle = sdkCoreEngineLogappenderToFfi(appender);
    final _handle = this.handle;
    _setLogAppenderFfi(_handle, __lib.LibraryContext.isolateId, _appenderHandle);
    sdkCoreEngineLogappenderReleaseFfiHandle(_appenderHandle);

  }

  @override
  void internaldispose(SDKNativeEngineDisposeCallback finishCallback) {
    final _disposeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_dispose__DisposeCallback'));
    final _finishCallbackHandle = sdkCoreEngineSdknativeengineDisposecallbackToFfi(finishCallback);
    final _handle = this.handle;
    _disposeFfi(_handle, __lib.LibraryContext.isolateId, _finishCallbackHandle);
    sdkCoreEngineSdknativeengineDisposecallbackReleaseFfiHandle(_finishCallbackHandle);

  }

  @override
  void internalsetOfflineMode(bool offlineMode) {
    final _setOfflineModeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_setOfflineMode__Boolean'));
    final _offlineModeHandle = booleanToFfi(offlineMode);
    final _handle = this.handle;
    _setOfflineModeFfi(_handle, __lib.LibraryContext.isolateId, _offlineModeHandle);
    booleanReleaseFfiHandle(_offlineModeHandle);

  }

  @override
  SDKOptions get options {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_options_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }


  SDKNativeEngine? get sharedInstance {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_engine_SDKNativeEngine_sharedInstance_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkCoreEngineSdknativeengineFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreEngineSdknativeengineReleaseFfiHandleNullable(__resultHandle);

    }

  }

  set sharedInstance(SDKNativeEngine? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_sharedInstance_set__SDKNativeEngine_'));
    final _valueHandle = sdkCoreEngineSdknativeengineToFfiNullable(value);
    _setFfi(__lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandleNullable(_valueHandle);

  }


  @internal
  ParameterConfiguration get internalparameterConfig {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_engine_SDKNativeEngine_parameterConfig_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkCoreParameterconfigurationFromFfi(__resultHandle);
    } finally {
      sdkCoreParameterconfigurationReleaseFfiHandle(__resultHandle);

    }

  }

  set parameterConfig(ParameterConfiguration value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_parameterConfig_set__ParameterConfiguration'));
    final _valueHandle = sdkCoreParameterconfigurationToFfi(value);
    _setFfi(__lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreParameterconfigurationReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkCoreEngineSdknativeengineToFfi(SDKNativeEngine value) =>
  _sdkCoreEngineSdknativeengineCopyHandle((value as __lib.NativeBase).handle);

SDKNativeEngine sdkCoreEngineSdknativeengineFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SDKNativeEngine) return instance;

  final _copiedHandle = _sdkCoreEngineSdknativeengineCopyHandle(handle);
  final result = SDKNativeEngine$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkCoreEngineSdknativeengineRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreEngineSdknativeengineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreEngineSdknativeengineReleaseHandle(handle);

Pointer<Void> sdkCoreEngineSdknativeengineToFfiNullable(SDKNativeEngine? value) =>
  value != null ? sdkCoreEngineSdknativeengineToFfi(value) : Pointer<Void>.fromAddress(0);

SDKNativeEngine? sdkCoreEngineSdknativeengineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreEngineSdknativeengineFromFfi(handle) : null;

void sdkCoreEngineSdknativeengineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineSdknativeengineReleaseHandle(handle);

// End of SDKNativeEngine "private" section.

