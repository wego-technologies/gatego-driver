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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/search/contact.dart';
import 'package:here_sdk/src/sdk/search/e_v_charging_pool.dart';
import 'package:here_sdk/src/sdk/search/opening_hours.dart';
import 'package:here_sdk/src/sdk/search/place_category.dart';
import 'package:here_sdk/src/sdk/search/supplier_reference.dart';
import 'package:here_sdk/src/sdk/search/web_editorial.dart';
import 'package:here_sdk/src/sdk/search/web_image.dart';
import 'package:here_sdk/src/sdk/search/web_rating.dart';
import 'package:meta/meta.dart';


/// Contains details of a specific place, such as contact information,
/// opening hours and assigned categories.

class Details {
  /// The list of contact information of the place.
  List<Contact> contacts;

  /// The list of opening hours information of the place (not available in result of suggest request).
  List<OpeningHours> openingHours;

  /// The list of categories assigned to this place.
  List<PlaceCategory> categories;

  /// The list of images associated with the place.
  /// The images are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.
  List<WebImage> images;

  /// The list of editorials associated with the place.
  /// The editorials are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.
  List<WebEditorial> editorials;

  /// The list of ratings associated with the place.
  /// The ratings are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.
  List<WebRating> ratings;

  /// The list of supplier references to this place.
  /// The references are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.
  List<SupplierReference> references;

  /// EV charging pool details. It is available only for a place that is a charging pool
  /// for electric vehicles. Charging stations data are only available to users with
  /// valid contracts with HERE.
  /// This is a BETA feature and thus there can be bugs and unexpected behavior.
  EVChargingPool? evChargingPool;

  Details(List<Contact> contacts, List<OpeningHours> openingHours, List<PlaceCategory> categories, List<WebImage> images, List<WebEditorial> editorials, List<WebRating> ratings, List<SupplierReference> references, [EVChargingPool? evChargingPool = null])
    : contacts = contacts, openingHours = openingHours, categories = categories, images = images, editorials = editorials, ratings = ratings, references = references, evChargingPool = evChargingPool;
  Details.withDefaults(List<Contact> contacts, List<OpeningHours> openingHours, List<PlaceCategory> categories, List<WebImage> images, List<WebEditorial> editorials, List<WebRating> ratings, List<SupplierReference> references)
    : contacts = contacts, openingHours = openingHours, categories = categories, images = images, editorials = editorials, ratings = ratings, references = references, evChargingPool = null;
  /// Gets the list of primary categories assigned to this place.
  ///
  /// Returns [List<PlaceCategory>]. List of categories.
  ///
  List<PlaceCategory> getPrimaryCategories() => $prototype.getPrimaryCategories(this);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Details) return false;
    Details _other = other;
    return DeepCollectionEquality().equals(contacts, _other.contacts) &&
        DeepCollectionEquality().equals(openingHours, _other.openingHours) &&
        DeepCollectionEquality().equals(categories, _other.categories) &&
        DeepCollectionEquality().equals(images, _other.images) &&
        DeepCollectionEquality().equals(editorials, _other.editorials) &&
        DeepCollectionEquality().equals(ratings, _other.ratings) &&
        DeepCollectionEquality().equals(references, _other.references) &&
        evChargingPool == _other.evChargingPool;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(contacts);
    result = 31 * result + DeepCollectionEquality().hash(openingHours);
    result = 31 * result + DeepCollectionEquality().hash(categories);
    result = 31 * result + DeepCollectionEquality().hash(images);
    result = 31 * result + DeepCollectionEquality().hash(editorials);
    result = 31 * result + DeepCollectionEquality().hash(ratings);
    result = 31 * result + DeepCollectionEquality().hash(references);
    result = 31 * result + evChargingPool.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Details$Impl();
}


// Details "private" section, not exported.

final _sdkSearchDetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_Details_create_handle'));
final _sdkSearchDetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_release_handle'));
final _sdkSearchDetailsGetFieldcontacts = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_contacts'));
final _sdkSearchDetailsGetFieldopeningHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_openingHours'));
final _sdkSearchDetailsGetFieldcategories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_categories'));
final _sdkSearchDetailsGetFieldimages = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_images'));
final _sdkSearchDetailsGetFieldeditorials = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_editorials'));
final _sdkSearchDetailsGetFieldratings = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_ratings'));
final _sdkSearchDetailsGetFieldreferences = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_references'));
final _sdkSearchDetailsGetFieldevChargingPool = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_evChargingPool'));



/// @nodoc
@visibleForTesting
class Details$Impl {
  List<PlaceCategory> getPrimaryCategories(Details $that) {
    final _getPrimaryCategoriesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Details_getPrimaryCategories'));
    final _handle = sdkSearchDetailsToFfi($that);
    final __resultHandle = _getPrimaryCategoriesFfi(_handle, __lib.LibraryContext.isolateId);
    sdkSearchDetailsReleaseFfiHandle(_handle);
    try {
      return heresdkSearchCommonBindingslistofSdkSearchPlacecategoryFromFfi(__resultHandle);
    } finally {
      heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkSearchDetailsToFfi(Details value) {
  final _contactsHandle = heresdkSearchCommonBindingslistofSdkSearchContactToFfi(value.contacts);
  final _openingHoursHandle = heresdkSearchCommonBindingslistofSdkSearchOpeninghoursToFfi(value.openingHours);
  final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(value.categories);
  final _imagesHandle = heresdkSearchCommonBindingslistofSdkSearchWebimageToFfi(value.images);
  final _editorialsHandle = heresdkSearchCommonBindingslistofSdkSearchWebeditorialToFfi(value.editorials);
  final _ratingsHandle = heresdkSearchCommonBindingslistofSdkSearchWebratingToFfi(value.ratings);
  final _referencesHandle = heresdkSearchCommonBindingslistofSdkSearchSupplierreferenceToFfi(value.references);
  final _evChargingPoolHandle = sdkSearchEvchargingpoolToFfiNullable(value.evChargingPool);
  final _result = _sdkSearchDetailsCreateHandle(_contactsHandle, _openingHoursHandle, _categoriesHandle, _imagesHandle, _editorialsHandle, _ratingsHandle, _referencesHandle, _evChargingPoolHandle);
  heresdkSearchCommonBindingslistofSdkSearchContactReleaseFfiHandle(_contactsHandle);
  heresdkSearchCommonBindingslistofSdkSearchOpeninghoursReleaseFfiHandle(_openingHoursHandle);
  heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  heresdkSearchCommonBindingslistofSdkSearchWebimageReleaseFfiHandle(_imagesHandle);
  heresdkSearchCommonBindingslistofSdkSearchWebeditorialReleaseFfiHandle(_editorialsHandle);
  heresdkSearchCommonBindingslistofSdkSearchWebratingReleaseFfiHandle(_ratingsHandle);
  heresdkSearchCommonBindingslistofSdkSearchSupplierreferenceReleaseFfiHandle(_referencesHandle);
  sdkSearchEvchargingpoolReleaseFfiHandleNullable(_evChargingPoolHandle);
  return _result;
}

Details sdkSearchDetailsFromFfi(Pointer<Void> handle) {
  final _contactsHandle = _sdkSearchDetailsGetFieldcontacts(handle);
  final _openingHoursHandle = _sdkSearchDetailsGetFieldopeningHours(handle);
  final _categoriesHandle = _sdkSearchDetailsGetFieldcategories(handle);
  final _imagesHandle = _sdkSearchDetailsGetFieldimages(handle);
  final _editorialsHandle = _sdkSearchDetailsGetFieldeditorials(handle);
  final _ratingsHandle = _sdkSearchDetailsGetFieldratings(handle);
  final _referencesHandle = _sdkSearchDetailsGetFieldreferences(handle);
  final _evChargingPoolHandle = _sdkSearchDetailsGetFieldevChargingPool(handle);
  try {
    return Details(
      heresdkSearchCommonBindingslistofSdkSearchContactFromFfi(_contactsHandle), 
      heresdkSearchCommonBindingslistofSdkSearchOpeninghoursFromFfi(_openingHoursHandle), 
      heresdkSearchCommonBindingslistofSdkSearchPlacecategoryFromFfi(_categoriesHandle), 
      heresdkSearchCommonBindingslistofSdkSearchWebimageFromFfi(_imagesHandle), 
      heresdkSearchCommonBindingslistofSdkSearchWebeditorialFromFfi(_editorialsHandle), 
      heresdkSearchCommonBindingslistofSdkSearchWebratingFromFfi(_ratingsHandle), 
      heresdkSearchCommonBindingslistofSdkSearchSupplierreferenceFromFfi(_referencesHandle), 
      sdkSearchEvchargingpoolFromFfiNullable(_evChargingPoolHandle)
    );
  } finally {
    heresdkSearchCommonBindingslistofSdkSearchContactReleaseFfiHandle(_contactsHandle);
    heresdkSearchCommonBindingslistofSdkSearchOpeninghoursReleaseFfiHandle(_openingHoursHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    heresdkSearchCommonBindingslistofSdkSearchWebimageReleaseFfiHandle(_imagesHandle);
    heresdkSearchCommonBindingslistofSdkSearchWebeditorialReleaseFfiHandle(_editorialsHandle);
    heresdkSearchCommonBindingslistofSdkSearchWebratingReleaseFfiHandle(_ratingsHandle);
    heresdkSearchCommonBindingslistofSdkSearchSupplierreferenceReleaseFfiHandle(_referencesHandle);
    sdkSearchEvchargingpoolReleaseFfiHandleNullable(_evChargingPoolHandle);
  }
}

void sdkSearchDetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchDetailsReleaseHandle(handle);

// Nullable Details

final _sdkSearchDetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_create_handle_nullable'));
final _sdkSearchDetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_release_handle_nullable'));
final _sdkSearchDetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_value_nullable'));

Pointer<Void> sdkSearchDetailsToFfiNullable(Details? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchDetailsToFfi(value);
  final result = _sdkSearchDetailsCreateHandleNullable(_handle);
  sdkSearchDetailsReleaseFfiHandle(_handle);
  return result;
}

Details? sdkSearchDetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchDetailsGetValueNullable(handle);
  final result = sdkSearchDetailsFromFfi(_handle);
  sdkSearchDetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchDetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchDetailsReleaseHandleNullable(handle);

// End of Details "private" section.

