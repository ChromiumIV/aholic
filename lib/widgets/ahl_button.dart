import 'package:flutter/material.dart';

import '../theme/ahl_colors.dart';

class AhlButton extends StatefulWidget {
  const AhlButton({
    Key? key,
    required this.text,
    this.onTap,
    this.fillColor = AhlColors.primary,
    this.textColor = Colors.white,
    this.hoverFillColor,
    this.hoverBorderColor,
    this.isEnabled = true,
    this.padding = const EdgeInsets.only(bottom: 12),
  }) : super(key: key);

  final String text;
  final Function()? onTap;
  final Color fillColor;
  final Color textColor;
  final Color? hoverFillColor;
  final Color? hoverBorderColor;
  final bool isEnabled;
  final EdgeInsets padding;

  @override
  State<AhlButton> createState() => _AhlButtonState();
}

class _AhlButtonState extends State<AhlButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: GestureDetector(
        onLongPressDown: (_) =>
            widget.isEnabled ? setState(() => _isPressed = true) : null,
        onLongPressUp: () =>
            widget.isEnabled ? setState(() => _isPressed = false) : null,
        onLongPressCancel: () =>
            widget.isEnabled ? setState(() => _isPressed = false) : null,
        onTap: widget.onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Opacity(
                opacity: widget.isEnabled ? 1 : 0.5,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _isPressed
                          ? (widget.hoverBorderColor ?? widget.fillColor)
                          : Colors.transparent,
                      width: 2,
                    ),
                    color: _isPressed
                        ? (widget.hoverFillColor ?? widget.textColor)
                        : widget.fillColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.text,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: _isPressed
                                ? widget.fillColor
                                : widget.textColor,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
