import 'package:flutter/material.dart';
import 'package:guard_app/providers/providers.dart';
import 'package:guard_app/screens/login.dart';
import 'package:guard_app/screens/yard_selector.dart';
import 'package:guard_app/theme/dark_theme.dart';
import 'package:guard_app/theme/light_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'utils/create_swatch.dart';
import 'package:beamer/beamer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final routerDelegate = BeamerDelegate(
      locationBuilder: SimpleLocationBuilder(
        routes: {
          // Return either Widgets or BeamPages if more customization is needed
          '/': (context, state) => const LoginPage(title: "Login Page"),
          '/yardSelection': (context, state) => const YardSelectionPage(),
          // '/books/:bookId': (context, state) {
          //   // Take the parameter of interest from BeamState
          //   final bookId = state.pathParameters['bookId']!;
          //   // Return a Widget or wrap it in a BeamPage for more flexibility
          //   return BeamPage(
          //     key: ValueKey('book-$bookId'),
          //     title: 'A Book #$bookId',
          //     popToNamed: '/',
          //     type: BeamPageType.scaleTransition,
          //     child: BookDetailsScreen(bookId),
          //   );
          // }
        },
      ),
    );
    return ProviderScope(
      child: MaterialApp.router(
        routeInformationParser: BeamerParser(),
        routerDelegate: routerDelegate,
        title: 'Gatego Guard',
        theme: lightTheme(),
        darkTheme: darkTheme(),
      ),
    );
  }
}

class Wrapper extends HookConsumerWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useAuth = ref.watch(authProvider.notifier);

    final autoLoginState = useAuth.tryAutoLogin();

    return Container();
  }
}
