import 'package:flutter/material.dart';
import 'package:guard_app/providers/providers.dart';
import 'package:guard_app/widgets/logo.dart';
import 'package:guard_app/widgets/text_input.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final usernameFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();

    final useAuth = ref.watch(authProvider.notifier);

    final autoLoginState = useAuth.tryAutoLogin();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder<bool>(
              future: autoLoginState,
              builder: (context, future) {
                return Column(
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
                              nextFocus: (string) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton.icon(
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
                                    borderRadius: BorderRadius.circular(50000),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                login(usernameController.text,
                                    passwordController.text, ref);
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

void login(String usr, String psw, WidgetRef ref) async {
  final resLogin = await ref.read(authProvider.notifier).signIn(usr, psw);

  if (resLogin & ref.read(authProvider.notifier).isAuth) {
    print((await ref.read(accountProvider.notifier).getMe())!.id);
  }
}
