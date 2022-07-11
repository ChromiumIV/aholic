import 'package:aholic/theme/ahl_colors.dart';
import 'package:flutter/material.dart';

class AhlIconButton extends StatefulWidget {
  const AhlIconButton({
    Key? key,
    required this.icon,
    this.fillColor = AhlColors.primary,
    this.iconColor = Colors.white,
    this.hoverIconColor,
    this.onTap,
    this.isEnabled = true,
  }) : super(key: key);

  final IconData icon;
  final Color fillColor;
  final Color iconColor;
  final Color? hoverIconColor;
  final Function()? onTap;
  final bool isEnabled;

  @override
  State<AhlIconButton> createState() => _AhlIconButtonState();
}

class _AhlIconButtonState extends State<AhlIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressDown: (_) =>
          widget.isEnabled ? setState(() => {_isPressed = true}) : null,
      onLongPressUp: () =>
          widget.isEnabled ? setState(() => {_isPressed = false}) : null,
      onLongPressCancel: () =>
          widget.isEnabled ? setState(() => {_isPressed = false}) : null,
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(36)),
          color: _isPressed ? widget.iconColor : widget.fillColor,
          border: Border.all(
            color: _isPressed
                ? widget.hoverIconColor ?? widget.fillColor
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Icon(
          widget.icon,
          color: _isPressed
              ? widget.hoverIconColor ?? widget.fillColor
              : widget.iconColor,
        ),
      ),
    );
  }
}
