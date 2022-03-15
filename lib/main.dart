import 'package:flutter/material.dart';
import 'providers/auth_provider.dart';
import 'providers/providers.dart';
import 'screens/login_with_account.dart';
import 'screens/login_with_pin.dart';
import 'screens/loc_sharing.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';
import 'package:here_sdk/core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:beamer/beamer.dart';

void main() {
  SdkContext.init(IsolateOrigin.main);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: AppWrapper());
  }
}

final Provider<BeamerDelegate> beamerDelegateProvider =
    Provider<BeamerDelegate>(
  (ref) => BeamerDelegate(
    initialPath: "/login",
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/loginWithPin': (context, state, data) => const LoginWithPinPage(),
        '/login': (context, state, data) => const LoginPage(),
        '/locSharing': (context, state, data) => const LocSharingPage(),
      },
    ),
  ),
);

class AppWrapper extends HookConsumerWidget {
  const AppWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BeamerProvider(
      routerDelegate: ref.read(beamerDelegateProvider),
      child: const NavigationWrapper(),
    );
  }
}

class NavigationWrapper extends HookConsumerWidget {
  const NavigationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        ref.read(authProvider.notifier).tryAutoLogin();
      },
    );

    ref.listen(authProvider, (AuthState? previous, AuthState next) {
      if (next.isAuthing) {
        return;
      }
      if (previous?.token != null && next.token == null) {
        Beamer.of(context).beamToNamed("/login");
      } else if (next.token != null && (previous?.isAuthing ?? false)) {
        Beamer.of(context).beamToNamed("/locSharing");
      }
    });

    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: ref.watch(beamerDelegateProvider),
      title: 'Gatego Driver',
      theme: lightTheme(),
      darkTheme: darkTheme(),
    );
  }
}
