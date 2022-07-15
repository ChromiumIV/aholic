import 'package:flutter/material.dart';

void showAhlBottomSheet({
  required BuildContext context,
  required Widget bottomSheet,
  bool isScrollControlled = true,
}) {
  showModalBottomSheet(
    context: context,
    builder: (_) => bottomSheet,
    backgroundColor: Colors.transparent,
    isScrollControlled: isScrollControlled,
  );
}
