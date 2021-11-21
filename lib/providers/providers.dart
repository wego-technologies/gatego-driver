import 'package:guard_app/providers/auth_provider.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = StateNotifierProvider<Auth, AuthState>((ref) {
  return Auth(ref);
});
