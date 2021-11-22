import 'package:flutter/material.dart';
import 'package:guard_app/widgets/logo.dart';
import 'package:guard_app/widgets/text_input.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final usernameFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
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
                    const SizedBox(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
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
                        onPressed: () {},
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
          ),
        ),
      ),
    );
  }
}
