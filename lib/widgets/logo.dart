import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  final double width;

  const Logo({this.width = 200, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "logo",
      child: (Theme.of(context).brightness == Brightness.dark)
          ? SvgPicture.asset(
              "assets/gatego_logo_dark.svg",
              width: width,
            )
          : SvgPicture.asset(
              "assets/gatego_logo.svg",
              width: width,
            ),
    );
  }
}
