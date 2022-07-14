import 'package:aholic/extension/datetime_extension.dart';
import 'package:aholic/widgets/ahl_animated_container.dart';
import 'package:aholic/widgets/ahl_icon_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../theme/ahl_colors.dart';

class AhlDatePickerBottomSheet extends StatefulWidget {
  const AhlDatePickerBottomSheet({
    Key? key,
    this.subtitle,
    this.fillColor = AhlColors.primary20,
    this.textColor = AhlColors.primary,
    this.hoverTextColor = Colors.white,
    this.value,
    this.onDateSelected,
  }) : super(key: key);

  final String? subtitle;
  final Color fillColor;
  final Color textColor;
  final Color hoverTextColor;
  final DateTime? value;
  final Function(DateTime value)? onDateSelected;

  @override
  State<AhlDatePickerBottomSheet> createState() =>
      _AhlDatePickerBottomSheetState();
}

class _AhlDatePickerBottomSheetState extends State<AhlDatePickerBottomSheet> {
  DateTime _selectedDate = DateTime.now();
  DateTime _visibleDate = DateTime.now();
  PageController? _pageController;

  // final _pageController = PageController(initialPage: 2400);

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      setState(() {
        _selectedDate = widget.value!;
        _visibleDate = DateTime(_selectedDate.year, _selectedDate.month, 1);
      });
      final now = DateTime.now();
      final x = Jiffy([_selectedDate.year, _selectedDate.month, 1])
          .diff(Jiffy([now.year, now.month, 1]), Units.MONTH)
          .toInt();
      _pageController = PageController(initialPage: 2400 + x);
    } else {
      _pageController = PageController(initialPage: 2400);
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.subtitle != null)
                        Text(
                          widget.subtitle!,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      Text(
                        DateFormat('MMM yyyy').format(_visibleDate),
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: AhlIconButton(
                  icon: Icons.close,
                  fillColor: widget.fillColor.withOpacity(0.2),
                  iconColor: widget.textColor,
                  hoverIconColor: Colors.white,
                  onTap: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
          ExpandablePageView.builder(
            controller: _pageController,
            itemCount: 4801,
            itemBuilder: (context, index) {
              final now = DateTime.now();
              final visibleDate =
                  DateTime(now.year, now.month + (index - 2400), 1);

              return _buildMonthView(context, visibleDate, _selectedDate);
            },
            onPageChanged: (index) {
              final now = DateTime.now();
              final visibleDate =
                  DateTime(now.year, now.month + (index - 2400), 1);
              setState(() {
                _visibleDate = visibleDate;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMonthView(
      BuildContext context, DateTime visibleDate, DateTime selectedDate) {
    final rows = <Widget>[];

    final dayButtonSize = (MediaQuery.of(context).size.width - 60) / 7;

    final firstDay = DateTime(visibleDate.year, visibleDate.month, 1);
    final lastDay = DateTime(visibleDate.year, visibleDate.month + 1, 1)
        .add(const Duration(days: -1));

    final numOfPrecedingInactiveDays = firstDay.weekday % 7;
    final numOfTrailingInactiveDays = 6 - lastDay.weekday % 7;

    final firstVisibleDay =
        firstDay.add(Duration(days: -1 * numOfPrecedingInactiveDays));
    final lastVisibleDay =
        lastDay.add(Duration(days: numOfTrailingInactiveDays));

    var currentDate = firstVisibleDay;
    var row = <Widget>[];

    do {
      final date =
          DateTime(currentDate.year, currentDate.month, currentDate.day);

      final dayButton = selectedDate.isSameDate(currentDate)
          ? _buildSelectedDayButton(currentDate.day, dayButtonSize, () {
              if (widget.onDateSelected != null) {
                widget.onDateSelected!(date);
                Navigator.of(context).pop();
              }
            })
          : visibleDate.month != currentDate.month
              ? _buildInactiveDayButton(currentDate.day, dayButtonSize, () {
                  if (widget.onDateSelected != null) {
                    widget.onDateSelected!(date);

                    Navigator.of(context).pop();
                  }
                })
              : _buildActiveDayButton(currentDate.day, dayButtonSize, () {
                  if (widget.onDateSelected != null) {
                    widget.onDateSelected!(date);

                    Navigator.of(context).pop();
                  }
                });
      row.add(dayButton);

      if (row.length == 7) {
        rows.add(SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: row,
          ),
        ));
        row = <Widget>[];
      }

      currentDate = currentDate.add(const Duration(days: 1));
    } while (!currentDate.isAfter(lastVisibleDay));

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 36),
      child: Column(
        children: [
          _buildWeekRow(),
          ...rows,
        ],
      ),
    );
  }

  Widget _buildWeekRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'label.sun'.tr(),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AhlColors.primary60),
          ),
          Text(
            'label.mon'.tr(),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AhlColors.primary60),
          ),
          Text(
            'label.tue'.tr(),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AhlColors.primary60),
          ),
          Text(
            'label.wed'.tr(),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AhlColors.primary60),
          ),
          Text(
            'label.thu'.tr(),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AhlColors.primary60),
          ),
          Text(
            'label.fri'.tr(),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AhlColors.primary60),
          ),
          Text(
            'label.sat'.tr(),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AhlColors.primary60),
          )
        ],
      ),
    );
  }

  Widget _buildSelectedDayButton(int day, double size, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: AhlAnimatedContainer(
        height: size,
        width: size,
        alignment: Alignment.center,
        builder: (isPressed) => Text(
          day.toString(),
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

  Widget _buildActiveDayButton(int day, double size, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: AhlAnimatedContainer(
        height: size,
        width: size,
        alignment: Alignment.center,
        builder: (isPressed) => Text(
          day.toString(),
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: isPressed ? Colors.white : AhlColors.primary,
              ),
        ),
        decorationBuilder: (isPressed) => BoxDecoration(
          color: isPressed ? AhlColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(999),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildInactiveDayButton(int day, double size, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: AhlAnimatedContainer(
        height: size,
        width: size,
        alignment: Alignment.center,
        builder: (isPressed) => Text(
          day.toString(),
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: isPressed ? Colors.white : AhlColors.primary40),
        ),
        decorationBuilder: (isPressed) => BoxDecoration(
          color: isPressed ? AhlColors.primary40 : Colors.white,
          borderRadius: BorderRadius.circular(999),
        ),
        onTap: onTap,
      ),
    );
  }
}
