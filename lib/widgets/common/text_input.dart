import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final void Function(String)? setData;
  final TextEditingController c;
  final IconData? icon;
  final String? text;
  final bool obscureText;
  final FocusNode fn;
  final void Function(String)? nextFocus;
  final bool enabled;
  final List<String>? autofillHints;
  const TextInput({
    this.autofillHints,
    this.setData,
    this.icon,
    this.text,
    this.obscureText = false,
    Key? key,
    required this.c,
    required this.fn,
    this.nextFocus,
    this.enabled = true,
  }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late Color colorIcon;
  late Color colorShadow;

  @override
  void initState() {
    super.initState();
    widget.fn.addListener(() {
      if (widget.fn.hasFocus) {
        setState(
          () {
            if (Theme.of(context).brightness == Brightness.dark) {
              colorIcon = const Color(0xff00a1d3);
              colorShadow = const Color(0xff376370);
            } else {
              colorIcon = const Color(0xff00a1d3);
              colorShadow = const Color(0xffb2e3f2);
            }
          },
        );
      } else {
        setState(
          () {
            if (Theme.of(context).brightness == Brightness.dark) {
              colorIcon = const Color(0xff7d7d7d);
              colorShadow = const Color(0xff050505);
            } else {
              colorIcon = const Color(0xffd8d8d8);
              colorShadow = const Color(0xffe6e6e6);
            }
          },
        );
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Theme.of(context).brightness == Brightness.dark) {
      colorIcon = const Color(0xff7d7d7d);
      colorShadow = const Color(0xff050505);
    } else {
      colorIcon = const Color(0xffd8d8d8);
      colorShadow = const Color(0xffe6e6e6);
    }
  }

  @override
  Widget build(BuildContext context) {
    const padding = 8.0;
    var size = MediaQuery.of(context).size.width - padding * 2;

    Color bgColor;

    if (Theme.of(context).brightness == Brightness.dark) {
      bgColor = const Color(0xff4d4d4d);
    } else {
      bgColor = const Color(0xfff5f5f5);
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.text != null)
              Text(
                widget.text!,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0,
                      spreadRadius: widget.fn.hasFocus ? 2 : 0.5,
                      color: colorShadow)
                ],
                borderRadius: BorderRadius.circular(12),
                color: bgColor,
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    widget.icon,
                    size: 15,
                    color: colorIcon,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(15)),
                      child: TextField(
                        enabled: widget.enabled,
                        controller: widget.c,
                        focusNode: widget.fn,
                        obscureText: widget.obscureText,
                        onSubmitted: widget.nextFocus,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        onChanged: widget.setData,
                        autofillHints: widget.autofillHints,
                        decoration: InputDecoration(
                          //fillColor: Color(0xfff5f5f5),
                          focusColor: const Color(0xfff5f5f5),
                          hoverColor: const Color(0xfff5f5f5),
                          //filled: true,
                          border: InputBorder.none,
                          hintText: widget.text,
                          hintStyle: const TextStyle(
                              //color: Color(0xff727272),
                              // fontWeight: FontWeight.w300,
                              fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
