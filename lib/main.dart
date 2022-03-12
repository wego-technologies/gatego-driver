import 'package:flutter/material.dart';
import 'providers/providers.dart';
import 'screens/login.dart';
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
    return const ProviderScope(child: NavigationWrapper());
  }
}

final _routerDelegate = BeamerDelegate(
  initialPath: "/login",
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/login': (context, state, data) => const LoginPage(),
      '/locSharing': (context, state, data) => const LocSharingPage(),
    },
  ),
);

class NavigationWrapper extends HookConsumerWidget {
  const NavigationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        ref.read(authProvider.notifier).tryAutoLogin();
        ref.read(locationProvider.notifier).checkPremission();
      },
    );

    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
      title: 'Gatego Driver',
      theme: lightTheme(),
      darkTheme: darkTheme(),
    );
  }
}
