import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? name;
  const Avatar(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Container(
        margin: EdgeInsetsDirectional.all(5),
        width: double.infinity,
        height: double.infinity,
        child: FittedBox(
          child: Text(
            _getInitials(name),
          ),
        ),
      ),
    );
  }

  String _getInitials(String? name) => name?.isNotEmpty ?? false
      ? name!.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
      : '..';
}
