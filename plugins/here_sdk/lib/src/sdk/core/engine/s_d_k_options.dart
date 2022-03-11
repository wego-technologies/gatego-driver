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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/layer_configuration.dart';
import 'package:meta/meta.dart';







/// SDKOptions provide an alternative way to set or update the HERE SDK credentials and other
/// parameters at runtime to initialize the [SDKNativeEngine].
///
/// Alternatively, all parameters can be set via
/// plist and/or AndroidManifest file.
/// This also allows to specify additional parameters such as the "FeatureConfiguration" which is only
/// available for users of the Navigate Edition: For more details look into the documentation of
/// the `MapDownloader` class where these parameters are explained.
///
/// The following shows an example of a plist file and an AndroidManifest file:
///
/// Plist file:
///
/// ```xml
/// <key>HERECredentials</key>
/// <dict>
///     <key>AccessKeyId</key>
///     <string>YOUR_ACCESS_KEY_ID</string>
///     <key>AccessKeySecret</key>
///     <string>YOUR_ACCESS_KEY_SECRET</string>
///     <!-- optionally set a project scope if needed -->
///     <key>Scope</key>
///     <string>YOUR_PROJECT_SCOPE</string>
/// </dict>
/// <key>CachePath</key>
/// <string>YOUR_CACHE_PATH</string>
/// <key>CacheSizeInBytes</key>
/// <integer>CACHE_SIZE</integer>
/// <key>PersistentMapStoragePath</key>
/// <string>PERSISTENT_MAP_STORAGE_PATH</string>
/// <key>PoliticalView</key>
/// <string>POLITICAL_VIEW</string>
/// <key>FeatureConfiguration</key>
/// <array>
///     <string>OFFLINE_FEATURE_1</string>
///     <string>OFFLINE_FEATURE_2</string>
/// </array>
/// <key>AutoUpdateOfOnlineCache</key>
/// <false/>
/// ```
///
/// AndroidManifest:
///
/// ```xml
///  <meta-data
///         android:name="com.here.sdk.access_key_id"
///         android:value="YOUR_ACCESS_KEY_ID" />
/// <meta-data
///         android:name="com.here.sdk.access_key_secret"
///         android:value="YOUR_ACCESS_KEY_SECRET" />
/// <!-- optionally set a project scope if needed -->
/// <meta-data
///         android:name="com.here.sdk.access_scope"
///         android:value="YOUR_PROJECT_SCOPE" />
/// <meta-data
///         android:name="com.here.sdk.cache_path"
///         android:value="YOUR_CACHE_PATH" />
/// <meta-data
///         android:name="com.here.sdk.cache_size_in_bytes"
///         android:value="CACHE_SIZE" />
/// <meta-data
///         android:name="com.here.sdk.persistent_map_storage_path"
///         android:value="PERSISTENT_MAP_STORAGE_PATH" />
/// <meta-data
///         android:name="com.here.sdk.political_view"
///         android:value="YOUR_POLITICAL_VIEW" />
/// <meta-data
///         android:name="com.here.sdk.feature_configuration"
///         android:value="OFFLINE_FEATURE_1,OFFLINE_FEATURE_2" />
/// <meta-data
///         android:name="com.here.sdk.auto_update_of_online_cache"
///         android:value="AUTO_UPDATE_ONLINE_CACHE" />
/// ```

class SDKOptions {
  /// Key used for authentication.
  String accessKeyId;

  /// Secret used for authentication.
  String accessKeySecret;

  /// Optional project ID to set the project scope of the login session. Not used if empty.
  /// see also [Manage Projects](https://developer.here.com/documentation/identity-access-management/dev_guide/topics/manage-projects.html)
  /// and [IAM Concepts](https://developer.here.com/documentation/identity-access-management/dev_guide/topics/concepts.html)
  String scope;

  /// Path to be used for caching purposes. This should be the absolute path
  /// to the desired location for which the application has read/write permissions.
  /// The path can be on internal or external storage. If it is not set, the
  /// default path will be used.
  ///
  /// - The default cache path on iOS devices: `<Application_Home>/Library/Caches`
  /// - The default cache path on Android devices: `Context.getCacheDir().getPath()`
  String cachePath;

  /// Desired upper bound of application size in bytes. When cached data exceeds cache_size, least recently used data will be removed.
  /// Default value 256MB
  int cacheSizeInBytes;

  /// Path to store persistent map data. This should be the absolute path
  /// to the desired location for which the application has read/write permissions.
  /// The path can be on internal or external storage. If it is not set, the
  /// default path will be used.
  ///
  /// - The default path on iOS devices: `Application Library directory`
  /// - The default path on Android devices: `Context.getFilesDir().getPath()`
  String persistentMapStoragePath;

  /// Political view of country, three letter country code defined by ISO 3166-1 alpha-3
  /// When set, all map data will respect point of view of this country
  /// NOTE: Leave it empty for international view
  /// This is a BETA feature and thus there can be bugs and unexpected behavior.
  String politicalView;

  /// Desired policy of using online connectivity.
  /// Default value False
  /// @nodoc
  @internal
  bool internalofflineMode;

  /// Defines a list of data features that can be enabled / disabled. Once set to [SDKOptions] when
  /// a new HERE SDK is constructed, it will affect the map cache and offline maps.
  /// When disabling certain features, less data will be prefetched when the map is rendered. Map
  /// data that was already cached will not be removed until the least recently used strategy (LRU)
  /// applies. That means you cannot remove any content from the map cache by updating the
  /// [LayerConfiguration]. However, for new map data, it will be applied.
  /// For offline maps, this [LayerConfiguration] can reduce the download size of all regions.
  /// Note that the [LayerConfiguration] is applied globally to all regions that will be downloaded
  /// in the future. It will not affect already downloaded regions. Updating a region will also
  /// not update the [LayerConfiguration]. Only the [LayerConfiguration] will be used that was set
  /// globally when a region was downloaded for the first time. If you want to update the
  /// [LayerConfiguration] for an already downloaded region, please delete the region and download it again.
  ///
  /// Please also note
  ///
  /// - The [LayerConfiguration] is only applicable for HERE SDK editions that contain the offline maps
  ///   feature such as the _Navigate Edition_. It has no affect on other editions.
  /// - The [LayerConfiguration] cannot be set separately for a region, it will be applied globally
  ///   for all regions that will be downloaded in the future.
  /// - It is not possible to specify a separate [LayerConfiguration] for the map cache and offline maps.
  ///   The [LayerConfiguration] will be always applied to both.
  /// - The [LayerConfiguration] does affect the map cache when a device has connectivity. Even
  ///   when a device has connectivity it will only download the specified layers.
  /// - This is a beta feature and thus there can be bugs and unexpected behavior.
  /// @nodoc
  @internal
  LayerConfiguration internallayerConfiguration;

  /// Migrate to new persistence storage format
  /// @nodoc
  @internal
  bool internalenableMigration;

  /// Parameter to enable the auto update of mutable cache
  bool autoUpdateOfOnlineCache;

  SDKOptions._(this.accessKeyId, this.accessKeySecret, this.scope, this.cachePath, this.cacheSizeInBytes, this.persistentMapStoragePath, this.politicalView, this.internalofflineMode, this.internallayerConfiguration, this.internalenableMigration, this.autoUpdateOfOnlineCache);
  /// Constructs a SDKOptions from access key id.
  ///
  /// Other fields are filled with default values.
  ///
  /// [accessKeyId] Key used for authentication.
  ///
  factory SDKOptions.make(String accessKeyId) => $prototype.make(accessKeyId);
  /// Constructs a SDKOptions from access key id and secret.
  ///
  /// Other fields are filled with default values.
  ///
  /// [accessKeyId] Key used for authentication.
  ///
  /// [accessKeySecret] Secret used for authentication.
  ///
  factory SDKOptions.withAccessKeySecret(String accessKeyId, String accessKeySecret) => $prototype.withAccessKeySecret(accessKeyId, accessKeySecret);
  /// Constructs a SDKOptions from access key id, access key secret and cache_path.
  ///
  /// [accessKeyId] Key used for authentication.
  ///
  /// [accessKeySecret] Secret used for authentication.
  ///
  /// [cachePath] Path to be used for caching purposes. If it is not set,
  ///
  /// is set by default.
  ///
  factory SDKOptions.withAccessKeySecretAndCachePath(String accessKeyId, String accessKeySecret, String cachePath) => $prototype.withAccessKeySecretAndCachePath(accessKeyId, accessKeySecret, cachePath);
  /// Constructs a SDKOptions from access key id, access key secret, cache_path and cache_size.
  ///
  /// [accessKeyId] Key used for authentication.
  ///
  /// [accessKeySecret] Secret used for authentication.
  ///
  /// [cachePath] Path to be used for caching purposes. If it is not set,
  ///
  /// is set by default.
  ///
  /// [cacheSizeInBytes] Desired upper bound of application size in bytes.
  /// When cached data exceeds cache_size, least recently used data will be removed. Default value 256MB.
  ///
  factory SDKOptions.withAccessKeySecretAndCachePathCacheSize(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes) => $prototype.withAccessKeySecretAndCachePathCacheSize(accessKeyId, accessKeySecret, cachePath, cacheSizeInBytes);
  /// Constructs a SDKOptions from access key id, access key secret, cache_path, cache_size and persistent_map_storage_path.
  ///
  /// [accessKeyId] Key used for authentication.
  ///
  /// [accessKeySecret] Secret used for authentication.
  ///
  /// [cachePath] Path to be used for caching purposes. If it is not set,
  ///
  /// is set by default.
  ///
  /// [cacheSizeInBytes] Desired upper bound of application size in bytes.
  /// When cached data exceeds cache_size, least recently used data will be removed. Default value 256MB
  ///
  /// [persistentMapStoragePath] Path to store persistent map downloaded by MapDownloader. If it is not set,
  /// is set by default.
  /// Note: The MapDownloader is not available for the Lite and Explore Edition. For these two editions, this property has no effect and can be ignored.
  ///
  factory SDKOptions.withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPath(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes, String persistentMapStoragePath) => $prototype.withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPath(accessKeyId, accessKeySecret, cachePath, cacheSizeInBytes, persistentMapStoragePath);
  /// Constructs a SDKOptions from access key id, access key secret, cache_path, cache_size and persistent_map_storage_path.
  ///
  /// [accessKeyId] Key used for authentication.
  ///
  /// [accessKeySecret] Secret used for authentication.
  ///
  /// [cachePath] Path to be used for caching purposes. If it is not set,
  ///
  /// is set by default.
  ///
  /// [cacheSizeInBytes] Desired upper bound of application size in bytes.
  /// When cached data exceeds cache_size, least recently used data will be removed. Default value 256MB
  ///
  /// [persistentMapStoragePath] Path to store persistent map downloaded by MapDownloader. If it is not set,
  /// is set by default.
  ///
  /// [politicalView] // Political view for country, defined by ISO 3166-1 alpha-3 code.
  /// This is a BETA feature and thus there can be bugs and unexpected behavior.
  /// Note: The MapDownloader is not available for the Lite and Explore Edition. For these two editions, this property has no effect and can be ignored.
  ///
  factory SDKOptions.withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPathAndPoliticalView(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes, String persistentMapStoragePath, String politicalView) => $prototype.withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPathAndPoliticalView(accessKeyId, accessKeySecret, cachePath, cacheSizeInBytes, persistentMapStoragePath, politicalView);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SDKOptions) return false;
    SDKOptions _other = other;
    return accessKeyId == _other.accessKeyId &&
        accessKeySecret == _other.accessKeySecret &&
        scope == _other.scope &&
        cachePath == _other.cachePath &&
        cacheSizeInBytes == _other.cacheSizeInBytes &&
        persistentMapStoragePath == _other.persistentMapStoragePath &&
        politicalView == _other.politicalView &&
        internalofflineMode == _other.internalofflineMode &&
        internallayerConfiguration == _other.internallayerConfiguration &&
        internalenableMigration == _other.internalenableMigration &&
        autoUpdateOfOnlineCache == _other.autoUpdateOfOnlineCache;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + accessKeyId.hashCode;
    result = 31 * result + accessKeySecret.hashCode;
    result = 31 * result + scope.hashCode;
    result = 31 * result + cachePath.hashCode;
    result = 31 * result + cacheSizeInBytes.hashCode;
    result = 31 * result + persistentMapStoragePath.hashCode;
    result = 31 * result + politicalView.hashCode;
    result = 31 * result + internalofflineMode.hashCode;
    result = 31 * result + internallayerConfiguration.hashCode;
    result = 31 * result + internalenableMigration.hashCode;
    result = 31 * result + autoUpdateOfOnlineCache.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SDKOptions$Impl();
}


// SDKOptions "private" section, not exported.

final _sdkCoreEngineSdkoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Int64, Pointer<Void>, Pointer<Void>, Uint8, Pointer<Void>, Uint8, Uint8),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, Pointer<Void>, Pointer<Void>, int, Pointer<Void>, int, int)
  >('here_sdk_sdk_core_engine_SDKOptions_create_handle'));
final _sdkCoreEngineSdkoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_release_handle'));
final _sdkCoreEngineSdkoptionsGetFieldaccessKeyId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_accessKeyId'));
final _sdkCoreEngineSdkoptionsGetFieldaccessKeySecret = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_accessKeySecret'));
final _sdkCoreEngineSdkoptionsGetFieldscope = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_scope'));
final _sdkCoreEngineSdkoptionsGetFieldcachePath = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_cachePath'));
final _sdkCoreEngineSdkoptionsGetFieldcacheSizeInBytes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_cacheSizeInBytes'));
final _sdkCoreEngineSdkoptionsGetFieldpersistentMapStoragePath = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_persistentMapStoragePath'));
final _sdkCoreEngineSdkoptionsGetFieldpoliticalView = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_politicalView'));
final _sdkCoreEngineSdkoptionsGetFieldofflineMode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_offlineMode'));
final _sdkCoreEngineSdkoptionsGetFieldlayerConfiguration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_layerConfiguration'));
final _sdkCoreEngineSdkoptionsGetFieldenableMigration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_enableMigration'));
final _sdkCoreEngineSdkoptionsGetFieldautoUpdateOfOnlineCache = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_autoUpdateOfOnlineCache'));



/// @nodoc
@visibleForTesting
class SDKOptions$Impl {
  SDKOptions make(String accessKeyId) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKOptions_make__String'));
    final _accessKeyIdHandle = stringToFfi(accessKeyId);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _accessKeyIdHandle);
    stringReleaseFfiHandle(_accessKeyIdHandle);
    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  SDKOptions withAccessKeySecret(String accessKeyId, String accessKeySecret) {
    final _withAccessKeySecretFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKOptions_make__String_String'));
    final _accessKeyIdHandle = stringToFfi(accessKeyId);
    final _accessKeySecretHandle = stringToFfi(accessKeySecret);
    final __resultHandle = _withAccessKeySecretFfi(__lib.LibraryContext.isolateId, _accessKeyIdHandle, _accessKeySecretHandle);
    stringReleaseFfiHandle(_accessKeyIdHandle);
    stringReleaseFfiHandle(_accessKeySecretHandle);
    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  SDKOptions withAccessKeySecretAndCachePath(String accessKeyId, String accessKeySecret, String cachePath) {
    final _withAccessKeySecretAndCachePathFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKOptions_make__String_String_String'));
    final _accessKeyIdHandle = stringToFfi(accessKeyId);
    final _accessKeySecretHandle = stringToFfi(accessKeySecret);
    final _cachePathHandle = stringToFfi(cachePath);
    final __resultHandle = _withAccessKeySecretAndCachePathFfi(__lib.LibraryContext.isolateId, _accessKeyIdHandle, _accessKeySecretHandle, _cachePathHandle);
    stringReleaseFfiHandle(_accessKeyIdHandle);
    stringReleaseFfiHandle(_accessKeySecretHandle);
    stringReleaseFfiHandle(_cachePathHandle);
    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  SDKOptions withAccessKeySecretAndCachePathCacheSize(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes) {
    final _withAccessKeySecretAndCachePathCacheSizeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Int64), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, int)>('here_sdk_sdk_core_engine_SDKOptions_make__String_String_String_Long'));
    final _accessKeyIdHandle = stringToFfi(accessKeyId);
    final _accessKeySecretHandle = stringToFfi(accessKeySecret);
    final _cachePathHandle = stringToFfi(cachePath);
    final _cacheSizeInBytesHandle = (cacheSizeInBytes);
    final __resultHandle = _withAccessKeySecretAndCachePathCacheSizeFfi(__lib.LibraryContext.isolateId, _accessKeyIdHandle, _accessKeySecretHandle, _cachePathHandle, _cacheSizeInBytesHandle);
    stringReleaseFfiHandle(_accessKeyIdHandle);
    stringReleaseFfiHandle(_accessKeySecretHandle);
    stringReleaseFfiHandle(_cachePathHandle);

    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  SDKOptions withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPath(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes, String persistentMapStoragePath) {
    final _withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPathFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Int64, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKOptions_make__String_String_String_Long_String'));
    final _accessKeyIdHandle = stringToFfi(accessKeyId);
    final _accessKeySecretHandle = stringToFfi(accessKeySecret);
    final _cachePathHandle = stringToFfi(cachePath);
    final _cacheSizeInBytesHandle = (cacheSizeInBytes);
    final _persistentMapStoragePathHandle = stringToFfi(persistentMapStoragePath);
    final __resultHandle = _withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPathFfi(__lib.LibraryContext.isolateId, _accessKeyIdHandle, _accessKeySecretHandle, _cachePathHandle, _cacheSizeInBytesHandle, _persistentMapStoragePathHandle);
    stringReleaseFfiHandle(_accessKeyIdHandle);
    stringReleaseFfiHandle(_accessKeySecretHandle);
    stringReleaseFfiHandle(_cachePathHandle);

    stringReleaseFfiHandle(_persistentMapStoragePathHandle);
    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  SDKOptions withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPathAndPoliticalView(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes, String persistentMapStoragePath, String politicalView) {
    final _withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPathAndPoliticalViewFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Int64, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKOptions_make__String_String_String_Long_String_String'));
    final _accessKeyIdHandle = stringToFfi(accessKeyId);
    final _accessKeySecretHandle = stringToFfi(accessKeySecret);
    final _cachePathHandle = stringToFfi(cachePath);
    final _cacheSizeInBytesHandle = (cacheSizeInBytes);
    final _persistentMapStoragePathHandle = stringToFfi(persistentMapStoragePath);
    final _politicalViewHandle = stringToFfi(politicalView);
    final __resultHandle = _withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPathAndPoliticalViewFfi(__lib.LibraryContext.isolateId, _accessKeyIdHandle, _accessKeySecretHandle, _cachePathHandle, _cacheSizeInBytesHandle, _persistentMapStoragePathHandle, _politicalViewHandle);
    stringReleaseFfiHandle(_accessKeyIdHandle);
    stringReleaseFfiHandle(_accessKeySecretHandle);
    stringReleaseFfiHandle(_cachePathHandle);

    stringReleaseFfiHandle(_persistentMapStoragePathHandle);
    stringReleaseFfiHandle(_politicalViewHandle);
    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkCoreEngineSdkoptionsToFfi(SDKOptions value) {
  final _accessKeyIdHandle = stringToFfi(value.accessKeyId);
  final _accessKeySecretHandle = stringToFfi(value.accessKeySecret);
  final _scopeHandle = stringToFfi(value.scope);
  final _cachePathHandle = stringToFfi(value.cachePath);
  final _cacheSizeInBytesHandle = (value.cacheSizeInBytes);
  final _persistentMapStoragePathHandle = stringToFfi(value.persistentMapStoragePath);
  final _politicalViewHandle = stringToFfi(value.politicalView);
  final _offlineModeHandle = booleanToFfi(value.internalofflineMode);
  final _layerConfigurationHandle = sdkCoreEngineLayerconfigurationToFfi(value.internallayerConfiguration);
  final _enableMigrationHandle = booleanToFfi(value.internalenableMigration);
  final _autoUpdateOfOnlineCacheHandle = booleanToFfi(value.autoUpdateOfOnlineCache);
  final _result = _sdkCoreEngineSdkoptionsCreateHandle(_accessKeyIdHandle, _accessKeySecretHandle, _scopeHandle, _cachePathHandle, _cacheSizeInBytesHandle, _persistentMapStoragePathHandle, _politicalViewHandle, _offlineModeHandle, _layerConfigurationHandle, _enableMigrationHandle, _autoUpdateOfOnlineCacheHandle);
  stringReleaseFfiHandle(_accessKeyIdHandle);
  stringReleaseFfiHandle(_accessKeySecretHandle);
  stringReleaseFfiHandle(_scopeHandle);
  stringReleaseFfiHandle(_cachePathHandle);
  
  stringReleaseFfiHandle(_persistentMapStoragePathHandle);
  stringReleaseFfiHandle(_politicalViewHandle);
  booleanReleaseFfiHandle(_offlineModeHandle);
  sdkCoreEngineLayerconfigurationReleaseFfiHandle(_layerConfigurationHandle);
  booleanReleaseFfiHandle(_enableMigrationHandle);
  booleanReleaseFfiHandle(_autoUpdateOfOnlineCacheHandle);
  return _result;
}

SDKOptions sdkCoreEngineSdkoptionsFromFfi(Pointer<Void> handle) {
  final _accessKeyIdHandle = _sdkCoreEngineSdkoptionsGetFieldaccessKeyId(handle);
  final _accessKeySecretHandle = _sdkCoreEngineSdkoptionsGetFieldaccessKeySecret(handle);
  final _scopeHandle = _sdkCoreEngineSdkoptionsGetFieldscope(handle);
  final _cachePathHandle = _sdkCoreEngineSdkoptionsGetFieldcachePath(handle);
  final _cacheSizeInBytesHandle = _sdkCoreEngineSdkoptionsGetFieldcacheSizeInBytes(handle);
  final _persistentMapStoragePathHandle = _sdkCoreEngineSdkoptionsGetFieldpersistentMapStoragePath(handle);
  final _politicalViewHandle = _sdkCoreEngineSdkoptionsGetFieldpoliticalView(handle);
  final _offlineModeHandle = _sdkCoreEngineSdkoptionsGetFieldofflineMode(handle);
  final _layerConfigurationHandle = _sdkCoreEngineSdkoptionsGetFieldlayerConfiguration(handle);
  final _enableMigrationHandle = _sdkCoreEngineSdkoptionsGetFieldenableMigration(handle);
  final _autoUpdateOfOnlineCacheHandle = _sdkCoreEngineSdkoptionsGetFieldautoUpdateOfOnlineCache(handle);
  try {
    return SDKOptions._(
      stringFromFfi(_accessKeyIdHandle), 
      stringFromFfi(_accessKeySecretHandle), 
      stringFromFfi(_scopeHandle), 
      stringFromFfi(_cachePathHandle), 
      (_cacheSizeInBytesHandle), 
      stringFromFfi(_persistentMapStoragePathHandle), 
      stringFromFfi(_politicalViewHandle), 
      booleanFromFfi(_offlineModeHandle), 
      sdkCoreEngineLayerconfigurationFromFfi(_layerConfigurationHandle), 
      booleanFromFfi(_enableMigrationHandle), 
      booleanFromFfi(_autoUpdateOfOnlineCacheHandle)
    );
  } finally {
    stringReleaseFfiHandle(_accessKeyIdHandle);
    stringReleaseFfiHandle(_accessKeySecretHandle);
    stringReleaseFfiHandle(_scopeHandle);
    stringReleaseFfiHandle(_cachePathHandle);
    
    stringReleaseFfiHandle(_persistentMapStoragePathHandle);
    stringReleaseFfiHandle(_politicalViewHandle);
    booleanReleaseFfiHandle(_offlineModeHandle);
    sdkCoreEngineLayerconfigurationReleaseFfiHandle(_layerConfigurationHandle);
    booleanReleaseFfiHandle(_enableMigrationHandle);
    booleanReleaseFfiHandle(_autoUpdateOfOnlineCacheHandle);
  }
}

void sdkCoreEngineSdkoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreEngineSdkoptionsReleaseHandle(handle);

// Nullable SDKOptions

final _sdkCoreEngineSdkoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_create_handle_nullable'));
final _sdkCoreEngineSdkoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_release_handle_nullable'));
final _sdkCoreEngineSdkoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_value_nullable'));

Pointer<Void> sdkCoreEngineSdkoptionsToFfiNullable(SDKOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineSdkoptionsToFfi(value);
  final result = _sdkCoreEngineSdkoptionsCreateHandleNullable(_handle);
  sdkCoreEngineSdkoptionsReleaseFfiHandle(_handle);
  return result;
}

SDKOptions? sdkCoreEngineSdkoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineSdkoptionsGetValueNullable(handle);
  final result = sdkCoreEngineSdkoptionsFromFfi(_handle);
  sdkCoreEngineSdkoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineSdkoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineSdkoptionsReleaseHandleNullable(handle);

// End of SDKOptions "private" section.

