import 'package:flutter/material.dart';
import 'package:guard_app/providers/providers.dart';
import 'package:guard_app/screens/login.dart';
import 'package:guard_app/screens/loc_sharing.dart';
import 'package:guard_app/theme/dark_theme.dart';
import 'package:guard_app/theme/light_theme.dart';
import 'package:here_sdk/core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:beamer/beamer.dart';

void main() {
  SdkContext.init(IsolateOrigin.main);
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
        (_) => ref.read(authProvider.notifier).tryAutoLogin());

    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
      title: 'Gatego Guard',
      theme: lightTheme(),
      darkTheme: darkTheme(),
    );
  }
}
