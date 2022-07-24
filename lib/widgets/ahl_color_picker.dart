import 'package:aholic/presentation/bottom_sheets/ahl_bottom_sheet.dart';
import 'package:aholic/widgets/ahl_animated_container.dart';
import 'package:flutter/material.dart';

import '../presentation/bottom_sheets/ahl_color_picker_bottom_sheet.dart';
import '../theme/ahl_colors.dart';

class AhlColorPicker extends StatefulWidget {
  const AhlColorPicker({
    Key? key,
    this.value = AhlColors.orange,
    this.onSelected,
  }) : super(key: key);

  final Color value;
  final void Function(Color)? onSelected;

  @override
  State<AhlColorPicker> createState() => _AhlColorPickerState();
}

class _AhlColorPickerState extends State<AhlColorPicker> {
  Color _value = AhlColors.orange;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return AhlAnimatedContainer(
      decorationBuilder: (isPressed) => BoxDecoration(
        color: isPressed ? AhlColors.toDark(_value) : _value.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      builder: (isPressed) => Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isPressed ? AhlColors.toDark(_value) : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 10,
                height: 20,
                decoration: BoxDecoration(
                  color: _value,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
              ),
              Container(
                width: 10,
                height: 20,
                decoration: BoxDecoration(
                  color: isPressed ? Colors.white : AhlColors.toDark(_value),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        showAhlBottomSheet(
          context: context,
          bottomSheet: AhlColorPickerBottomSheet(
            value: _value,
            onSelected: (selectedColor) => setState(() {
              _value = selectedColor;
            }),
          ),
        );
      },
    );
  }
}
