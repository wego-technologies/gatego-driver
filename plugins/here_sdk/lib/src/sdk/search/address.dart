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

/// Information about the address of a location.

class Address {
  /// The city name for the address, for example, "Brooklyn".
  String city;

  /// An ISO-3166-1 (3-letter) country code for the address, for example, "USA".
  String countryCode;

  /// The country name for the address, for example, "United States".
  String country;

  /// The district name for the address.
  /// It is a division of city, typically an administrative unit within a larger city or
  /// a customary name of a city's neighborhood, for example, "Bedford-Stuyvesant".
  String district;

  /// The subdistrict name for the address.
  /// It is a subdivision of a district.
  String subdistrict;

  /// The house name or number for the address, for example, "347".
  String houseNumOrName;

  /// The postal code for the address.
  /// It is an alphanumeric string included in a postal address to facilitate mail sorting, known locally
  /// in various countries throughout the world as a postcode, post code, PIN or ZIP Code, for example, "11233".
  String postalCode;

  /// The state name for the address.
  /// It is code/abbreviation for the state division of a country, for example, "New York".
  String state;

  /// The county name for the address.
  /// It is a division of a state, typically a secondary-level administrative division of a country or equivalent,
  /// for example, "Kings".
  String county;

  /// The street name for the address, for example, "Lewis Ave".
  String street;

  /// The block number for the address. It is part of Japanese addressing system.
  String block;

  /// The sub-block number for the address. It is part of Japanese addressing system.
  String subBlock;

  /// The text for the address, for example, "Secret Garden, 347 Lewis Ave, Brooklyn, NY 11233, United States".
  String addressText;

  Address()
      : city = "", countryCode = "", country = "", district = "", subdistrict = "", houseNumOrName = "", postalCode = "", state = "", county = "", street = "", block = "", subBlock = "", addressText = "";
  @Deprecated("Will be removed in v4.13.0. Please use the default constructor instead.")
  Address.withValues(this.city, this.countryCode, this.country, this.district, this.subdistrict, this.houseNumOrName, this.postalCode, this.state, this.county, this.street, this.block, this.subBlock, this.addressText);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Address) return false;
    Address _other = other;
    return city == _other.city &&
        countryCode == _other.countryCode &&
        country == _other.country &&
        district == _other.district &&
        subdistrict == _other.subdistrict &&
        houseNumOrName == _other.houseNumOrName &&
        postalCode == _other.postalCode &&
        state == _other.state &&
        county == _other.county &&
        street == _other.street &&
        block == _other.block &&
        subBlock == _other.subBlock &&
        addressText == _other.addressText;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + city.hashCode;
    result = 31 * result + countryCode.hashCode;
    result = 31 * result + country.hashCode;
    result = 31 * result + district.hashCode;
    result = 31 * result + subdistrict.hashCode;
    result = 31 * result + houseNumOrName.hashCode;
    result = 31 * result + postalCode.hashCode;
    result = 31 * result + state.hashCode;
    result = 31 * result + county.hashCode;
    result = 31 * result + street.hashCode;
    result = 31 * result + block.hashCode;
    result = 31 * result + subBlock.hashCode;
    result = 31 * result + addressText.hashCode;
    return result;
  }
}


// Address "private" section, not exported.

final _sdkSearchAddressCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_Address_create_handle'));
final _sdkSearchAddressReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_release_handle'));
final _sdkSearchAddressGetFieldcity = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_get_field_city'));
final _sdkSearchAddressGetFieldcountryCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_get_field_countryCode'));
final _sdkSearchAddressGetFieldcountry = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_get_field_country'));
final _sdkSearchAddressGetFielddistrict = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_get_field_district'));
final _sdkSearchAddressGetFieldsubdistrict = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_get_field_subdistrict'));
final _sdkSearchAddressGetFieldhouseNumOrName = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_get_field_houseNumOrName'));
final _sdkSearchAddressGetFieldpostalCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_get_field_postalCode'));
final _sdkSearchAddressGetFieldstate = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_get_field_state'));
final _sdkSearchAddressGetFieldcounty = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_get_field_county'));
final _sdkSearchAddressGetFieldstreet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_get_field_street'));
final _sdkSearchAddressGetFieldblock = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_get_field_block'));
final _sdkSearchAddressGetFieldsubBlock = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_get_field_subBlock'));
final _sdkSearchAddressGetFieldaddressText = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_get_field_addressText'));



Pointer<Void> sdkSearchAddressToFfi(Address value) {
  final _cityHandle = stringToFfi(value.city);
  final _countryCodeHandle = stringToFfi(value.countryCode);
  final _countryHandle = stringToFfi(value.country);
  final _districtHandle = stringToFfi(value.district);
  final _subdistrictHandle = stringToFfi(value.subdistrict);
  final _houseNumOrNameHandle = stringToFfi(value.houseNumOrName);
  final _postalCodeHandle = stringToFfi(value.postalCode);
  final _stateHandle = stringToFfi(value.state);
  final _countyHandle = stringToFfi(value.county);
  final _streetHandle = stringToFfi(value.street);
  final _blockHandle = stringToFfi(value.block);
  final _subBlockHandle = stringToFfi(value.subBlock);
  final _addressTextHandle = stringToFfi(value.addressText);
  final _result = _sdkSearchAddressCreateHandle(_cityHandle, _countryCodeHandle, _countryHandle, _districtHandle, _subdistrictHandle, _houseNumOrNameHandle, _postalCodeHandle, _stateHandle, _countyHandle, _streetHandle, _blockHandle, _subBlockHandle, _addressTextHandle);
  stringReleaseFfiHandle(_cityHandle);
  stringReleaseFfiHandle(_countryCodeHandle);
  stringReleaseFfiHandle(_countryHandle);
  stringReleaseFfiHandle(_districtHandle);
  stringReleaseFfiHandle(_subdistrictHandle);
  stringReleaseFfiHandle(_houseNumOrNameHandle);
  stringReleaseFfiHandle(_postalCodeHandle);
  stringReleaseFfiHandle(_stateHandle);
  stringReleaseFfiHandle(_countyHandle);
  stringReleaseFfiHandle(_streetHandle);
  stringReleaseFfiHandle(_blockHandle);
  stringReleaseFfiHandle(_subBlockHandle);
  stringReleaseFfiHandle(_addressTextHandle);
  return _result;
}

Address sdkSearchAddressFromFfi(Pointer<Void> handle) {
  final _cityHandle = _sdkSearchAddressGetFieldcity(handle);
  final _countryCodeHandle = _sdkSearchAddressGetFieldcountryCode(handle);
  final _countryHandle = _sdkSearchAddressGetFieldcountry(handle);
  final _districtHandle = _sdkSearchAddressGetFielddistrict(handle);
  final _subdistrictHandle = _sdkSearchAddressGetFieldsubdistrict(handle);
  final _houseNumOrNameHandle = _sdkSearchAddressGetFieldhouseNumOrName(handle);
  final _postalCodeHandle = _sdkSearchAddressGetFieldpostalCode(handle);
  final _stateHandle = _sdkSearchAddressGetFieldstate(handle);
  final _countyHandle = _sdkSearchAddressGetFieldcounty(handle);
  final _streetHandle = _sdkSearchAddressGetFieldstreet(handle);
  final _blockHandle = _sdkSearchAddressGetFieldblock(handle);
  final _subBlockHandle = _sdkSearchAddressGetFieldsubBlock(handle);
  final _addressTextHandle = _sdkSearchAddressGetFieldaddressText(handle);
  try {
    return Address.withValues(
      stringFromFfi(_cityHandle), 
      stringFromFfi(_countryCodeHandle), 
      stringFromFfi(_countryHandle), 
      stringFromFfi(_districtHandle), 
      stringFromFfi(_subdistrictHandle), 
      stringFromFfi(_houseNumOrNameHandle), 
      stringFromFfi(_postalCodeHandle), 
      stringFromFfi(_stateHandle), 
      stringFromFfi(_countyHandle), 
      stringFromFfi(_streetHandle), 
      stringFromFfi(_blockHandle), 
      stringFromFfi(_subBlockHandle), 
      stringFromFfi(_addressTextHandle)
    );
  } finally {
    stringReleaseFfiHandle(_cityHandle);
    stringReleaseFfiHandle(_countryCodeHandle);
    stringReleaseFfiHandle(_countryHandle);
    stringReleaseFfiHandle(_districtHandle);
    stringReleaseFfiHandle(_subdistrictHandle);
    stringReleaseFfiHandle(_houseNumOrNameHandle);
    stringReleaseFfiHandle(_postalCodeHandle);
    stringReleaseFfiHandle(_stateHandle);
    stringReleaseFfiHandle(_countyHandle);
    stringReleaseFfiHandle(_streetHandle);
    stringReleaseFfiHandle(_blockHandle);
    stringReleaseFfiHandle(_subBlockHandle);
    stringReleaseFfiHandle(_addressTextHandle);
  }
}

void sdkSearchAddressReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchAddressReleaseHandle(handle);

// Nullable Address

final _sdkSearchAddressCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_create_handle_nullable'));
final _sdkSearchAddressReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_release_handle_nullable'));
final _sdkSearchAddressGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Address_get_value_nullable'));

Pointer<Void> sdkSearchAddressToFfiNullable(Address? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchAddressToFfi(value);
  final result = _sdkSearchAddressCreateHandleNullable(_handle);
  sdkSearchAddressReleaseFfiHandle(_handle);
  return result;
}

Address? sdkSearchAddressFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchAddressGetValueNullable(handle);
  final result = sdkSearchAddressFromFfi(_handle);
  sdkSearchAddressReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchAddressReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchAddressReleaseHandleNullable(handle);

// End of Address "private" section.

