import 'package:aholic/widgets/ahl_animated_container.dart';
import 'package:flutter/material.dart';

import '../../theme/ahl_colors.dart';
import '../../widgets/ahl_icon_button.dart';

class AhlColorPickerBottomSheet extends StatefulWidget {
  const AhlColorPickerBottomSheet({
    Key? key,
    this.value = AhlColors.orange,
    this.onSelected,
  }) : super(key: key);

  final Color value;
  final void Function(Color)? onSelected;

  @override
  State<AhlColorPickerBottomSheet> createState() =>
      _AhlColorPickerBottomSheetState();
}

class _AhlColorPickerBottomSheetState extends State<AhlColorPickerBottomSheet> {
  Color _value = AhlColors.orange;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final colorButtonSize = (MediaQuery.of(context).size.width - 104) / 6;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: AhlIconButton(
                icon: Icons.close,
                fillColor: AhlColors.primary20,
                iconColor: AhlColors.primary,
                hoverIconColor: Colors.white,
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 16, bottom: 8, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildColorButton(AhlColors.yellow, colorButtonSize),
                _buildColorButton(AhlColors.orange, colorButtonSize),
                _buildColorButton(AhlColors.red, colorButtonSize),
                _buildColorButton(AhlColors.pink, colorButtonSize),
                _buildColorButton(AhlColors.violet, colorButtonSize),
                _buildColorButton(AhlColors.purple, colorButtonSize),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 32, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildColorButton(AhlColors.lime, colorButtonSize),
                _buildColorButton(AhlColors.green, colorButtonSize),
                _buildColorButton(AhlColors.mint, colorButtonSize),
                _buildColorButton(AhlColors.cyan, colorButtonSize),
                _buildColorButton(AhlColors.azure, colorButtonSize),
                _buildColorButton(AhlColors.blue, colorButtonSize),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorButton(Color color, double size) {
    final isSelected = color == _value;
    return AhlAnimatedContainer(
      width: size,
      height: size,
      decorationBuilder: (isPressed) {
        final darkColor = AhlColors.toDark(color);
        final fillColor = isPressed ? darkColor : color;
        final borderColor = isSelected
            ? (isPressed ? color : darkColor)
            : (isPressed ? darkColor : color);
        return BoxDecoration(
          color: fillColor,
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(999),
        );
      },
      onTap: () {
        setState(() {
          _value = color;
        });
        if (widget.onSelected != null) {
          widget.onSelected!(_value);
        }
        Navigator.of(context).pop();
      },
    );
  }
}
