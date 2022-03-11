import 'package:background_location/background_location.dart';
import 'package:gatego_smartloc/providers/account_provider.dart';
import 'package:gatego_smartloc/providers/auth_provider.dart';
import 'package:gatego_smartloc/providers/location_provider.dart';
import 'package:here_sdk/mapview.dart' as here;
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

final hereGeoCoords = StateProvider<Location?>(
  (ref) => null,
);

final hereController = StateProvider<here.HereMapController?>(
  (ref) => null,
);
