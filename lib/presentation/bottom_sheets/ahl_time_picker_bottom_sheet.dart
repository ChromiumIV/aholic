import 'dart:math';

import 'package:aholic/extension/datetime_extension.dart';
import 'package:aholic/widgets/ahl_animated_container.dart';
import 'package:circular_widgets/circular_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../theme/ahl_colors.dart';
import '../../widgets/ahl_icon_button.dart';

class AhlTimePickerBottomSheet extends StatefulWidget {
  const AhlTimePickerBottomSheet({
    Key? key,
    this.fillColor = AhlColors.primary20,
    this.textColor = AhlColors.primary,
    this.hoverTextColor = Colors.white,
    this.value,
    this.onTimeSelected,
  }) : super(key: key);

  final Color fillColor;
  final Color textColor;
  final Color hoverTextColor;
  final DateTime? value;
  final Function(DateTime value)? onTimeSelected;

  @override
  State<AhlTimePickerBottomSheet> createState() =>
      _AhlTimePickerBottomSheetState();
}

class _AhlTimePickerBottomSheetState extends State<AhlTimePickerBottomSheet> {
  DateTime _value = DateTime.now();
  TimePickerMode _mode = TimePickerMode.hour;
  TimePeriod _timePeriod = TimePeriod.am;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      setState(() {
        _value = widget.value!;
        _timePeriod = widget.value!.hour < 12 ? TimePeriod.am : TimePeriod.pm;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(24))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: AhlIconButton(
                icon: Icons.close,
                fillColor: widget.fillColor.withOpacity(0.2),
                iconColor: widget.textColor,
                hoverIconColor: Colors.white,
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: AspectRatio(
              aspectRatio: 1,
              child: Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    var smallestBoundary =
                        min(constraints.maxHeight, constraints.maxWidth);
                    return CircularWidgets(
                      itemBuilder: (_, index) {
                        if (_mode == TimePickerMode.hour) {
                          if (_value.hour % 12 == index) {
                            return _buildSelectedDayButton(
                                (index == 0 ? 12 : index).toString(), 72, () {
                              setState(() {
                                _value = _value.setHour(
                                    _timePeriod == TimePeriod.am
                                        ? index
                                        : index + 12);
                                _mode = TimePickerMode.minute;
                              });
                              _notifyTimeSelected();
                            });
                          } else {
                            return _buildUnselectedDayButton(
                                (index == 0 ? 12 : index).toString(), 72, () {
                              setState(() {
                                _value = _value.setHour(
                                    _timePeriod == TimePeriod.am
                                        ? index
                                        : index + 12);
                                _mode = TimePickerMode.minute;
                              });
                              _notifyTimeSelected();
                            });
                          }
                        } else {
                          if (_value.minute == (index * 5)) {
                            return _buildSelectedDayButton(
                                (index * 5).toString().padLeft(2, '0'), 72, () {
                              setState(() {
                                _value = _value.setMinute(index * 5);
                              });
                              _notifyTimeSelected();
                              Navigator.of(context).pop();
                            });
                          } else {
                            return _buildUnselectedDayButton(
                                (index * 5).toString().padLeft(2, '0'), 72, () {
                              setState(() {
                                _value = _value.setMinute(index * 5);
                              });
                              _notifyTimeSelected();
                              Navigator.of(context).pop();
                            });
                          }
                        }
                      },
                      itemsLength: 12,
                      innerSpacing: smallestBoundary / 12,
                      centerWidgetRadius: smallestBoundary / 1.8,
                      radiusOfItem: smallestBoundary / 8,
                      centerWidgetBuilder: (_) => Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: widget.fillColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(999)),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _mode = TimePickerMode.hour;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Text(
                                            DateFormat('hh').format(_value),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                ?.copyWith(
                                                  fontSize: 48,
                                                  color: _mode ==
                                                          TimePickerMode.hour
                                                      ? widget.textColor
                                                      : widget.textColor
                                                          .withOpacity(0.5),
                                                ),
                                          ),
                                          Container(
                                            height: 4,
                                            width: 32,
                                            color: _mode == TimePickerMode.hour
                                                ? widget.textColor
                                                : Colors.transparent,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _mode = TimePickerMode.minute;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Text(
                                            DateFormat('mm').format(_value),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                ?.copyWith(
                                                  fontSize: 48,
                                                  color: _mode ==
                                                          TimePickerMode.minute
                                                      ? widget.textColor
                                                      : widget.textColor
                                                          .withOpacity(0.5),
                                                ),
                                          ),
                                          Container(
                                            height: 4,
                                            width: 32,
                                            color:
                                                _mode == TimePickerMode.minute
                                                    ? widget.textColor
                                                    : Colors.transparent,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AhlAnimatedContainer(
                                        minWidth: 64,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        builder: (isPressed) => Text(
                                          'label.am'.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(
                                                  color: _timePeriod ==
                                                          TimePeriod.am
                                                      ? (isPressed
                                                          ? Colors.white
                                                          : widget.textColor)
                                                      : (isPressed
                                                          ? Colors.white
                                                          : widget.textColor
                                                              .withOpacity(
                                                                  0.5))),
                                        ),
                                        decorationBuilder: (isPressed) =>
                                            BoxDecoration(
                                          color: _timePeriod == TimePeriod.am
                                              ? (isPressed
                                                  ? widget.textColor
                                                  : widget.fillColor)
                                              : (isPressed
                                                  ? widget.textColor
                                                  : Colors.white),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(2),
                                            topRight: Radius.circular(2),
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(4),
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _timePeriod = TimePeriod.am;
                                            if (_value.hour >= 12) {
                                              _value = _value
                                                  .setHour(_value.hour - 12);
                                            }
                                          });
                                          _notifyTimeSelected();
                                        },
                                      ),
                                      const SizedBox(width: 2),
                                      AhlAnimatedContainer(
                                        minWidth: 64,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        builder: (isPressed) => Text(
                                          'label.pm'.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(
                                                  color: _timePeriod ==
                                                          TimePeriod.pm
                                                      ? (isPressed
                                                          ? Colors.white
                                                          : widget.textColor)
                                                      : (isPressed
                                                          ? Colors.white
                                                          : widget.textColor
                                                              .withOpacity(
                                                                  0.5))),
                                        ),
                                        decorationBuilder: (isPressed) =>
                                            BoxDecoration(
                                          color: _timePeriod == TimePeriod.pm
                                              ? (isPressed
                                                  ? widget.textColor
                                                  : widget.fillColor)
                                              : (isPressed
                                                  ? widget.textColor
                                                  : Colors.white),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(2),
                                            topRight: Radius.circular(2),
                                            bottomLeft: Radius.circular(2),
                                            bottomRight: Radius.circular(12),
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _timePeriod = TimePeriod.pm;
                                            if (_value.hour < 12) {
                                              _value = _value
                                                  .setHour(_value.hour + 12);
                                            }
                                          });
                                          _notifyTimeSelected();
                                        },
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSelectedDayButton(String label, double size, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: AhlAnimatedContainer(
        height: size,
        width: size,
        alignment: Alignment.center,
        builder: (isPressed) => Text(
          label,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: isPressed ? widget.hoverTextColor : widget.textColor,
              ),
        ),
        decorationBuilder: (isPressed) => BoxDecoration(
          color: isPressed ? widget.textColor : widget.fillColor,
          borderRadius: BorderRadius.circular(999),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildUnselectedDayButton(
      String label, double size, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: AhlAnimatedContainer(
        height: size,
        width: size,
        alignment: Alignment.center,
        builder: (isPressed) => Text(
          label,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: isPressed
                    ? widget.textColor
                    : widget.textColor.withOpacity(0.75),
              ),
        ),
        decorationBuilder: (isPressed) => BoxDecoration(
          color: isPressed ? widget.fillColor : Colors.white,
          borderRadius: BorderRadius.circular(999),
        ),
        onTap: onTap,
      ),
    );
  }

  void _notifyTimeSelected() {
    if (widget.onTimeSelected != null) {
      widget.onTimeSelected!(_value);
    }
  }
}

enum TimePickerMode { hour, minute }

enum TimePeriod { am, pm }
