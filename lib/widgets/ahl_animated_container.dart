import 'package:flutter/material.dart';

class AhlAnimatedContainer extends StatefulWidget {
  const AhlAnimatedContainer({
    Key? key,
    this.width,
    this.height,
    this.alignment,
    this.builder,
    this.decorationBuilder,
    this.onTap,
    this.padding,
    this.minWidth = 0,
    this.maxWidth = double.infinity,
    this.minHeight = 0,
    this.maxHeight = double.infinity,
  }) : super(key: key);

  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Widget Function(bool)? builder;
  final BoxDecoration Function(bool)? decorationBuilder;
  final void Function()? onTap;
  final EdgeInsets? padding;
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;

  @override
  State<AhlAnimatedContainer> createState() => _AhlAnimatedContainerState();
}

class _AhlAnimatedContainerState extends State<AhlAnimatedContainer> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressDown: (_) => setState(() => _isPressed = true),
      onLongPressUp: () => setState(() => _isPressed = false),
      onLongPressCancel: () => setState(() => _isPressed = false),
      onPanCancel: () => setState(() => _isPressed = false),
      // onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        constraints: BoxConstraints(
          minWidth: widget.minWidth,
          maxWidth: widget.maxWidth,
          minHeight: widget.minHeight,
          maxHeight: widget.maxHeight,
        ),
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        height: widget.height,
        alignment: widget.alignment,
        padding: widget.padding,
        decoration: widget.decorationBuilder != null
            ? widget.decorationBuilder!(_isPressed)
            : null,
        child: widget.builder != null ? widget.builder!(_isPressed) : null,
      ),
    );
  }
}
