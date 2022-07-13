import 'package:flutter/material.dart';

void showAhlBottomSheet(
    {required BuildContext context, required Widget bottomSheet}) {
  showModalBottomSheet(
    context: context,
    builder: (_) => bottomSheet,
    backgroundColor: Colors.transparent,
  );
}
