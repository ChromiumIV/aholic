import 'package:aholic/widgets/ahl_animated_container.dart';
import 'package:flutter/material.dart';

import '../theme/ahl_colors.dart';

class AhlCheckbox extends StatefulWidget {
  const AhlCheckbox({
    Key? key,
    this.value = false,
    this.label,
    this.onChanged,
    this.fillColor = AhlColors.primary40,
    this.textColor = AhlColors.primary,
    this.isEnabled = true,
    this.padding = const EdgeInsets.only(bottom: 12),
  }) : super(key: key);

  final bool value;
  final String? label;
  final Function(bool value)? onChanged;
  final Color fillColor;
  final Color textColor;
  final bool isEnabled;
  final EdgeInsets padding;

  @override
  State<AhlCheckbox> createState() => _AhlCheckboxState();
}

class _AhlCheckboxState extends State<AhlCheckbox> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    //setState(() {
    _value = widget.value;
    //});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: AhlAnimatedContainer(
        onTap: () {
          setState(() {
            _value = !_value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(_value);
          }
        },
        builder: (isPressed) => Padding(
          padding: const EdgeInsets.fromLTRB(6, 6, 8, 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: _value
                        ? (isPressed
                            ? widget.textColor
                            : Colors.white.withOpacity(0.5))
                        : (isPressed ? widget.fillColor : Colors.white),
                    borderRadius: BorderRadius.circular(6)),
                child: Icon(
                  Icons.check,
                  color: _value
                      ? (isPressed ? Colors.white : widget.textColor)
                      : Colors.transparent,
                ),
              ),
              if (widget.label != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    widget.label!,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: _value
                            ? (isPressed ? Colors.white : widget.textColor)
                            : (isPressed
                                ? widget.textColor
                                : widget.textColor.withOpacity(0.5))),
                  ),
                ),
            ],
          ),
        ),
        decorationBuilder: (isPressed) => BoxDecoration(
          color: _value
              ? (isPressed ? widget.textColor : widget.fillColor)
              : (isPressed
                  ? widget.fillColor
                  : widget.fillColor.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
