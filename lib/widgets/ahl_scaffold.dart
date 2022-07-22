import 'package:flutter/material.dart';

class AhlScaffold extends StatelessWidget {
  const AhlScaffold({
    Key? key,
    this.scaffoldKey,
    this.backgroundColor = Colors.white,
    this.body,
    this.drawer,
  }) : super(key: key);

  final Key? scaffoldKey;
  final Color backgroundColor;
  final Widget? body;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: backgroundColor,
        body: body,
        drawer: drawer,
      ),
    );
  }
}
