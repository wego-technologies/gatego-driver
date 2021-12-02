import 'package:flutter/material.dart';
import 'package:guard_app/providers/providers.dart';
import 'package:guard_app/screens/login.dart';
import 'package:guard_app/screens/yard_selector.dart';
import 'package:guard_app/theme/dark_theme.dart';
import 'package:guard_app/theme/light_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:beamer/beamer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: NavigationWrapper());
  }
}

class NavigationWrapper extends HookConsumerWidget {
  NavigationWrapper({Key? key}) : super(key: key);

  final routerDelegate = BeamerDelegate(
    initialPath: "/login",
    locationBuilder: SimpleLocationBuilder(
      routes: {
        '/login': (context, state) => LoginPage(title: "Login Page"),
        '/yardSelection': (context, state) => const YardSelectionPage(),
      },
    ),
    // guards: [
    //   // Guard /books and /books/* by beaming to /login if the user is unauthenticated:
    //   BeamGuard(
    //     pathBlueprints: ['/yardSelection'],
    //     check: (BuildContext context, BeamLocation<BeamState> location) =>
    //         ref.read(authProvider.notifier).isAuth != true,
    //     beamToNamed: '/login',
    //   ),
    // ],
    listener: (p0, p1) {
      print(p0.uri);
      print(p1.state.data.entries);
    },
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(authProvider.notifier).tryAutoLogin();

    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      title: 'Gatego Guard',
      theme: lightTheme(),
      darkTheme: darkTheme(),
    );
  }
}
