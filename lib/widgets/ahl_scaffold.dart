import 'package:flutter/material.dart';

class AhlScaffold extends StatelessWidget {
  const AhlScaffold({
    Key? key,
    this.backgroundColor = Colors.white,
    this.body,
  }) : super(key: key);

  final Color backgroundColor;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: body,
      ),
    );
  }
}
