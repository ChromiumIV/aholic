import 'package:aholic/theme/ahl_colors.dart';
import 'package:flutter/material.dart';

class AhlIconButton extends StatelessWidget {
  const AhlIconButton({
    Key? key,
    required this.icon,
    this.fillColor = AhlColors.primary,
    this.iconColor = Colors.white,
  }) : super(key: key);

  final IconData icon;
  final Color fillColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
