import 'dart:math';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:guard_app/providers/auth_provider.dart';
import 'package:guard_app/providers/providers.dart';
import 'package:guard_app/widgets/logo.dart';
import 'package:guard_app/widgets/text_input.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends StatefulHookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  var isLoginButton = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (previous!.token != null && !isLoginButton) {
        if (mounted) context.beamToNamed("/locSharing");
      }
    });
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final usernameFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();

    final useAuth = ref.watch(authProvider);
    ref.watch(authProvider.notifier);
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: max(
                mediaQuery.size.height -
                    mediaQuery.padding.top -
                    mediaQuery.padding.bottom -
                    mediaQuery.viewInsets.bottom,
                useAuth.errorState != null ? 490 : 450),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Logo(
                        width: 170,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '''Welcome to the gatego guard app.
Please log in to continue''',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextInput(
                          c: usernameController,
                          fn: usernameFocusNode,
                          text: "Username or Email",
                          icon: Icons.person,
                        ),
                        TextInput(
                          c: passwordController,
                          fn: passwordFocusNode,
                          obscureText: true,
                          icon: Icons.vpn_key,
                          text: "Password",
                          nextFocus: (string) {
                            login(usernameController.text,
                                passwordController.text, ref, context);
                          },
                        ),
                        if (useAuth.errorState != null)
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Card(
                              color:
                                  Theme.of(context).errorColor.withAlpha(200),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.warning_rounded,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    useAuth.errorState!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Expanded(
                          flex: 5,
                          child: SizedBox(),
                        ),
                        !useAuth.isAuthing
                            ? ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.login_rounded,
                                  size: 18,
                                ),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.resolveWith(
                                    (states) => const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 10),
                                  ),
                                  shape: MaterialStateProperty.resolveWith(
                                    (states) => RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50000),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  isLoginButton = true;

                                  login(usernameController.text,
                                      passwordController.text, ref, context);
                                },
                                label: Text(
                                  "Log In",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                ),
                              )
                            : CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,
                              ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(String usr, String psw, WidgetRef ref, BuildContext ctx) async {
    final bool resLogin;
    try {
      resLogin = await ref.read(authProvider.notifier).signIn(usr, psw);
    } catch (e) {
      return;
    }

    if (resLogin & ref.read(authProvider.notifier).isAuth) {
      final account = await ref.read(accountProvider.notifier).getMe();
      if (account?.id != null) Beamer.of(ctx).beamToNamed('/locSharing');
    }
  }
}
