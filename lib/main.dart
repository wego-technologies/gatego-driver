import 'package:flutter/material.dart';
import 'package:guard_app/providers/providers.dart';
import 'package:guard_app/screens/login.dart';
import 'package:guard_app/theme/dark_theme.dart';
import 'package:guard_app/theme/light_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'utils/create_swatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Gatego Guard',
        theme: lightTheme(),
        darkTheme: darkTheme(),
        home: const LoginPage(title: 'Login Page'),
      ),
    );
  }
}

class AuthWrapper extends HookConsumerWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useAuth = ref.watch(authProvider.notifier);

    final autoLoginState = useAuth.tryAutoLogin();

    return Container();
  }
}
