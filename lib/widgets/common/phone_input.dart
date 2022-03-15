import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneInput extends StatefulWidget {
  final void Function(String)? setData;
  final TextEditingController c;
  final IconData? icon;
  final String? text;
  final bool obscureText;
  final FocusNode fn;
  final void Function(String)? nextFocus;
  final bool enabled;
  final List<String>? autofillHints;
  const PhoneInput({
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
  _PhoneInputState createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
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
              colorShadow = const Color.fromARGB(255, 36, 36, 36);
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
      colorShadow = const Color.fromARGB(255, 36, 36, 36);
    } else {
      colorIcon = const Color(0xffd8d8d8);
      colorShadow = const Color(0xffe6e6e6);
    }
  }

  var internalNumber = "";

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
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(15)),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (value) {
                          if (widget.setData != null) {
                            widget.setData!(value.phoneNumber ?? "");
                            internalNumber = value.phoneNumber ?? "";
                          }
                        },
                        countries: const ["US", "CA", "MX"],
                        //enabled: widget.enabled,
                        //controller: widget.c,
                        focusNode: widget.fn,
                        onSubmit: () {
                          if (widget.nextFocus != null) {
                            widget.nextFocus!(internalNumber);
                          }
                        },
                        textFieldController: widget.c,

                        onFieldSubmitted: widget.nextFocus,
                        //obscureText: widget.obscureText,
                        //onSubmitted: widget.nextFocus,
                        //PhoneInputAction: PhoneInputAction.next,
                        keyboardType: TextInputType.number,
                        //onChanged: widget.setData,
                        autofillHints: widget.autofillHints,
                        inputBorder: InputBorder.none,
                        inputDecoration: InputDecoration(
                          //fillColor: Color(0xfff5f5f5),
                          focusColor: const Color(0xfff5f5f5),
                          hoverColor: const Color(0xfff5f5f5),
                          //filled: true,
                          border: InputBorder.none,
                          hintText: widget.text,
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
