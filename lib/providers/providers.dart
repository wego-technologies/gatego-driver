import 'package:guard_app/providers/account_provider.dart';
import 'package:guard_app/providers/auth_provider.dart';
import 'package:guard_app/providers/location_provider.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = StateNotifierProvider<Auth, AuthState>((ref) {
  return Auth(ref);
});

final accountProvider =
    StateNotifierProvider<AccountProvider, AccountState>((ref) {
  return AccountProvider(ref);
});

final locationProvider =
    StateNotifierProvider<LocationProvider, LocationState>((ref) {
  return LocationProvider(ref);
});

final hereGeoCoords = StateProvider<GeoCoordinates?>(
  (ref) => null,
);

final hereController = StateProvider<HereMapController?>(
  (ref) => null,
);
