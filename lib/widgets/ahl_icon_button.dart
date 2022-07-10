import 'package:aholic/theme/ahl_colors.dart';
import 'package:flutter/material.dart';

class AhlIconButton extends StatefulWidget {
  const AhlIconButton({
    Key? key,
    required this.icon,
    this.fillColor = AhlColors.primary,
    this.iconColor = Colors.white,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Color fillColor;
  final Color iconColor;
  final Function()? onTap;

  @override
  State<AhlIconButton> createState() => _AhlIconButtonState();
}

class _AhlIconButtonState extends State<AhlIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressDown: (_) => {
        setState(() => {_isPressed = true})
      },
      onLongPressUp: () => {
        setState(() => {_isPressed = false})
      },
      onLongPressCancel: () => {
        setState(() => {_isPressed = false})
      },
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(36)),
          color: _isPressed ? widget.iconColor : widget.fillColor,
          // border: Border.all(
          //   color: widget.fillColor,
          //   width: 2,
          // ),
        ),
        child: Icon(
          widget.icon,
          color: _isPressed ? widget.fillColor : widget.iconColor,
        ),
      ),
    );
  }
}
