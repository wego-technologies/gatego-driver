import 'dart:math';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import '../providers/auth_provider.dart';
import '../providers/providers.dart';
import '../widgets/common/logo.dart';
import '../widgets/common/text_input.dart';
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
    final pinController = useTextEditingController();
    final pinFocusNode = useFocusNode();

    final useAuth = ref.watch(authProvider);
    ref.watch(authProvider.notifier);
    final mediaQuery = MediaQuery.of(context);

    const length = 6;
    var borderColor = Theme.of(context).primaryColor;
    var errorColor = Theme.of(context).errorColor.withAlpha(50);
    var fillColor = Theme.of(context).canvasColor;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

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
                        'Welcome to the Gatego Driver app.\n'
                        'Please log in to continue',
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Enter the unique pin that was sent to your phone.",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 68,
                          child: Pinput(
                            length: length,
                            controller: pinController,
                            focusNode: pinFocusNode,
                            defaultPinTheme: defaultPinTheme,
                            onCompleted: (pin) {
                              login(pin, ref, context);
                            },
                            enabled: !useAuth.isAuthing,
                            focusedPinTheme: defaultPinTheme.copyWith(
                              height: 68,
                              width: 64,
                              decoration: defaultPinTheme.decoration!.copyWith(
                                border:
                                    Border.all(color: borderColor, width: 2),
                              ),
                            ),
                            errorPinTheme: defaultPinTheme.copyWith(
                              decoration: BoxDecoration(
                                color: errorColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        if (useAuth.errorState != null)
                          const SizedBox(
                            height: 10,
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
                                  Expanded(
                                    child: Text(
                                      useAuth.errorState!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
                                        borderRadius:
                                            BorderRadius.circular(50000),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    isLoginButton = true;

                                    login(pinController.text, ref, context);
                                  },
                                  label: const Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.white,
                                    size: 18,
                                  ),
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

  void login(String pin, WidgetRef ref, BuildContext ctx) async {
    final bool resLogin;
    try {
      resLogin = await ref.read(authProvider.notifier).signIn(pin);
    } catch (e) {
      return;
    }

    if (resLogin & ref.read(authProvider.notifier).isAuth) {
      final account = await ref.read(accountProvider.notifier).getMe();
      if (account?.id != null) Beamer.of(ctx).beamToNamed('/locSharing');
    }
  }
}
