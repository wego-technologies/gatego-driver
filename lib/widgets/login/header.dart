import 'package:flutter/material.dart';

import '../common/logo.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
