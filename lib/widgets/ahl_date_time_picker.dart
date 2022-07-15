import 'package:aholic/extension/datetime_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../presentation/bottom_sheets/ahl_bottom_sheet.dart';
import '../presentation/bottom_sheets/ahl_date_picker_bottom_sheet.dart';
import '../presentation/bottom_sheets/ahl_time_picker_bottom_sheet.dart';
import '../theme/ahl_colors.dart';
import 'ahl_animated_container.dart';

class AhlDateTimePicker extends StatefulWidget {
  const AhlDateTimePicker({
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
  State<AhlDateTimePicker> createState() => _AhlDateTimePickerState();
}

class _AhlDateTimePickerState extends State<AhlDateTimePicker> {
  DateTime _value = DateTime.now();

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AhlAnimatedContainer(
            decorationBuilder: (isPressed) => BoxDecoration(
              color: isPressed
                  ? widget.textColor
                  : widget.fillColor.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(2),
                bottomRight: Radius.circular(2),
              ),
            ),
            alignment: Alignment.center,
            builder: (isPressed) => Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 4),
              child: Text(
                DateFormat('dd MMM').format(_value),
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color:
                        isPressed ? widget.hoverTextColor : widget.textColor),
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
          const SizedBox(
            height: 2,
          ),
          AhlAnimatedContainer(
            decorationBuilder: (isPressed) => BoxDecoration(
              color: isPressed
                  ? widget.textColor
                  : widget.fillColor.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(2),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            alignment: Alignment.center,
            builder: (isPressed) => Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                DateFormat('HH:mm').format(_value),
                style: Theme.of(context).textTheme.headline1?.copyWith(
                    color:
                        isPressed ? widget.hoverTextColor : widget.textColor),
              ),
            ),
            onTap: () {
              showAhlBottomSheet(
                context: context,
                bottomSheet: AhlTimePickerBottomSheet(
                  value: _value,
                  fillColor: widget.fillColor,
                  textColor: widget.textColor,
                  onTimeSelected: (selectedTime) {
                    setState(() {
                      _value = _value.setTime(selectedTime);
                    });
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
