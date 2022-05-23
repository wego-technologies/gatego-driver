import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:gatego_driver/widgets/login/header.dart';
import '../providers/providers.dart';
import '../widgets/common/text_input.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/login/error.dart';

class LoginPage extends StatefulHookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  var isLoginButton = false;

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final usernameFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();

    final useAuth = ref.watch(authProvider);
    ref.watch(authProvider.notifier);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 0,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AutofillGroup(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const LoginHeader(),
                        const SizedBox(
                          height: 50,
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
                                  autofillHints: const [AutofillHints.email],
                                  text: "Username or Email",
                                  icon: Icons.person,
                                ),
                                TextInput(
                                  autofillHints: const [AutofillHints.password],
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                if (useAuth.errorState != null)
                                  const ErrorCard(),
                                TextButton.icon(
                                  onPressed: () {
                                    Beamer.of(context)
                                        .beamToNamed("/loginWithPin");
                                  },
                                  label: const Text("Sign in with a pin"),
                                  icon: const Icon(Icons.pin_rounded),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    !useAuth.isAuthing
                        ? SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              icon: Text(
                                "Sign In",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.resolveWith(
                                  (states) => const EdgeInsets.symmetric(
                                    vertical: 13,
                                  ),
                                ),
                                shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50000),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                isLoginButton = true;

                                login(usernameController.text,
                                    passwordController.text, ref, context);
                              },
                              label: const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: Theme.of(context).cardColor,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login(String usr, String psw, WidgetRef ref, BuildContext ctx) async {
    try {
      await ref.read(authProvider.notifier).signIn(usr, psw);
    } catch (e) {
      return;
    }
  }
}
