import 'package:aholic/extension/datetime_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../presentation/bottom_sheets/ahl_bottom_sheet.dart';
import '../presentation/bottom_sheets/ahl_date_picker_bottom_sheet.dart';
import '../theme/ahl_colors.dart';
import 'ahl_animated_container.dart';

class AhlDatePicker extends StatefulWidget {
  const AhlDatePicker({
    Key? key,
    this.fillColor = AhlColors.primary20,
    this.textColor = AhlColors.primary,
    this.hoverTextColor = Colors.white,
    this.datePickerSubtitle,
    required this.value,
    this.onUpdated,
    this.padding = const EdgeInsets.only(bottom: 12),
  }) : super(key: key);

  final Color fillColor;
  final Color textColor;
  final Color hoverTextColor;
  final String? datePickerSubtitle;
  final DateTime value;
  final void Function(DateTime dateTime)? onUpdated;
  final EdgeInsets padding;

  @override
  State<AhlDatePicker> createState() => _AhlDatePickerState();
}

class _AhlDatePickerState extends State<AhlDatePicker> {
  DateTime _value = DateTime.now();

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: AhlAnimatedContainer(
        decorationBuilder: (isPressed) => BoxDecoration(
          color:
              isPressed ? widget.textColor : widget.fillColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        builder: (isPressed) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            DateFormat('dd MMM').format(_value),
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  color: isPressed ? widget.hoverTextColor : widget.textColor,
                ),
          ),
        ),
        onTap: () {
          showAhlBottomSheet(
            context: context,
            bottomSheet: AhlDatePickerBottomSheet(
              value: _value,
              subtitle: widget.datePickerSubtitle,
              fillColor: widget.fillColor,
              textColor: widget.textColor,
              onDateSelected: (selectedDate) {
                setState(() {
                  _value = _value.setDate(selectedDate);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
