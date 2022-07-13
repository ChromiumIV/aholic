import 'package:aholic/widgets/ahl_animated_container.dart';
import 'package:aholic/widgets/ahl_icon_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';

import '../../theme/ahl_colors.dart';

class AhlDatePickerBottomSheet extends StatefulWidget {
  const AhlDatePickerBottomSheet({
    Key? key,
    this.subtitle,
    this.fillColor = AhlColors.primary40,
    this.textColor = AhlColors.primary,
    this.hoverTextColor = Colors.white,
  }) : super(key: key);

  final String? subtitle;
  final Color fillColor;
  final Color textColor;
  final Color hoverTextColor;

  @override
  State<AhlDatePickerBottomSheet> createState() =>
      _AhlDatePickerBottomSheetState();
}

class _AhlDatePickerBottomSheetState extends State<AhlDatePickerBottomSheet> {
  DateTime _selectedDate = DateTime.now();
  DateTime _visibleDate = DateTime.now();

  final _pageController = PageController(initialPage: 2400);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(24))),
        child: Column(
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
                    fillColor: widget.fillColor.withOpacity(0.5),
                    iconColor: widget.textColor,
                    hoverIconColor: Colors.white,
                  ),
                ),
              ],
            ),
            ExpandablePageView.builder(
              controller: _pageController,
              itemCount: 4801,
              itemBuilder: (_, index) {
                final now = DateTime.now();
                final visibleDate =
                    DateTime(now.year, now.month + (index - 2400), 1);
                // setState(() {
                //   _visibleDate = visibleDate;
                // });
                return _buildMonthView(context, visibleDate);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthView(BuildContext context, DateTime month) {
    final rows = <Widget>[];

    final dayButtonSize = (MediaQuery.of(context).size.width - 46) / 7;

    return Column(
      children: [
        _buildSelectedDayButton(12, dayButtonSize),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildWeekRow(),
        )
      ],
    );
  }

  Widget _buildWeekRow() {
    return Row(
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
    );
  }

  Widget _buildSelectedDayButton(int day, double size) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: AhlAnimatedContainer(
        height: size,
        width: size,
        alignment: Alignment.center,
        builder: (isPressed) => Text(
          day.toString(),
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: isPressed ? widget.hoverTextColor : widget.textColor),
        ),
        decorationBuilder: (isPressed) => BoxDecoration(
          color: isPressed ? widget.textColor : widget.fillColor,
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );
  }

  Widget _buildActiveDayButton(int day, double size) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: AhlAnimatedContainer(
        height: size,
        width: size,
        alignment: Alignment.center,
        builder: (isPressed) => Text(
          day.toString(),
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: isPressed ? widget.hoverTextColor : widget.textColor),
        ),
        decorationBuilder: (isPressed) => BoxDecoration(
          color: isPressed ? widget.textColor : widget.fillColor,
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );
  }

  Widget _buildInactiveDayButton(int day, double size) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: AhlAnimatedContainer(
        height: size,
        width: size,
        alignment: Alignment.center,
        builder: (isPressed) => Text(
          day.toString(),
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: isPressed ? widget.hoverTextColor : widget.textColor),
        ),
        decorationBuilder: (isPressed) => BoxDecoration(
          color: isPressed ? widget.textColor : widget.fillColor,
          borderRadius: BorderRadius.circular(99),
        ),
      ),
    );
  }
}
