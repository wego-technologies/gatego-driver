import 'package:gatego_driver/models/account.dart';

import 'account_provider.dart';
import 'auth_provider.dart';
import 'location_provider.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = StateNotifierProvider<Auth, AuthState>((ref) {
  return Auth(ref);
});

final accountProvider = StateNotifierProvider<AccountProvider, Account?>((ref) {
  return AccountProvider(ref);
});

final locationProvider =
    StateNotifierProvider<LocationProvider, LocationState>((ref) {
  return LocationProvider(ref);
});
