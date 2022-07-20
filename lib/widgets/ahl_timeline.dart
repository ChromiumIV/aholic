import 'package:aholic/extension/datetime_extension.dart';
import 'package:aholic/widgets/ahl_timeline_day_grid.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sticky_infinite_list/sticky_infinite_list.dart';

import '../domain/entities/item.dart';
import '../presentation/view_models/positioned_item.dart';
import '../theme/ahl_colors.dart';

class AhlTimeline extends StatefulWidget {
  const AhlTimeline({
    Key? key,
    required this.items,
    required this.date,
  }) : super(key: key);

  final List<Item> items;
  final DateTime date;

  @override
  State<AhlTimeline> createState() => _AhlTimelineState();
}

class _AhlTimelineState extends State<AhlTimeline> {
  var _itemsByDate = <DateTime, List<PositionedItem>>{};
  DateTime _date = DateTime.now().getDateStart();
  int _year = DateTime.now().year;
  int _month = DateTime.now().month;

  @override
  void initState() {
    super.initState();

    final positionedItems = _splitItems(_year, _month, widget.items);
    _itemsByDate = _groupItemsByDate(positionedItems);
    _date = widget.date.getDateStart();
  }

  List<PositionedItem> _splitItems(int year, int month, List<Item> items) {
    final positionedItems = <PositionedItem>[];

    DateTime monthStartedAt = DateTime(year, month);
    DateTime monthEndedAt = DateTime(year, month + 1, 0, 23, 59, 59);

    for (final item in items) {
      DateTime startedAt = item.startedAt;
      DateTime endedAt = item.endedAt;

      /// 2022 Jan
      ///
      /// 2022 Jan 2 to 4
      /// 2021 Dec 28 to 2022 Jan 4
      /// 2022 Jan 28 to 2022 Feb 12
      /// 2021 Oct 1 to Nov 1         x

      if (!(startedAt.isBefore(monthEndedAt) &&
              endedAt.isAfter(monthStartedAt)) &&
          item.itemReps.isEmpty) {
        return [];
      }

      // split cross-day item

      if (startedAt.year != endedAt.year ||
          startedAt.month != endedAt.month ||
          startedAt.day != endedAt.day) {
        // cross-day item
        if (item.isAllDay) {
          // all-day
          DateTime current =
              DateTime(startedAt.year, startedAt.month, startedAt.day);
          while (!current.isAfter(monthEndedAt) && !current.isAfter(endedAt)) {
            if (current.year != year || current.month != month) {
              current = monthStartedAt;
            } else {
              positionedItems.add(
                PositionedItem(
                    item: item,
                    leftPaddingRatio: 0,
                    widthRatio: 0,
                    instanceStartedAt: current,
                    instanceEndedAt: current.add(const Duration(days: 1)),
                    instanceIsAllDay: null),
              );
              current = current.add(const Duration(days: 1));
            }
          }
        } else {
          // non-all-day
          DateTime current = startedAt;

          while (!current.isAfter(monthEndedAt) && !current.isAfter(endedAt)) {
            if (current.year != year || current.month != month) {
              current = monthStartedAt;
            } else {
              DateTime currentEnd =
                  DateTime(current.year, current.month, current.day + 1)
                      .subtract(const Duration(seconds: 1));
              if (currentEnd.isAfter(endedAt)) {
                currentEnd = endedAt;
              }

              positionedItems.add(
                PositionedItem(
                  item: item,
                  instanceStartedAt: current,
                  instanceEndedAt: currentEnd,
                  instanceIsAllDay: current.hour == 0 &&
                      current.minute == 0 &&
                      current.second == 0 &&
                      currentEnd.hour == 23 &&
                      currentEnd.minute == 59 &&
                      currentEnd.second == 59,
                  leftPaddingRatio: 0,
                  widthRatio: 0,
                ),
              );

              current = DateTime(current.year, current.month, current.day + 1);
            }
          }
        }
      } else if (item.itemReps.isNotEmpty) {
        // non-cross-day, repeating
        DateTime current = monthStartedAt;

        while (!current.isAfter(monthEndedAt)) {
          bool hasOccurrence = false;
          for (final rep in item.itemReps) {
            if (!rep.repFrom.isAfter(current) &&
                (rep.repTo == null || !rep.repTo!.isBefore(current)) &&
                rep.year == '*' &&
                (rep.month == '*' ||
                    rep.month == current.month.toString() &&
                        rep.day == current.day.toString()) &&
                (rep.day == '*' || rep.day == current.day.toString()) &&
                (rep.weekday == '*' ||
                    rep.weekday == current.weekday.toString() ||
                    rep.month != '*' ||
                    rep.day != '*')) {
              hasOccurrence = true;
              break;
            }
          }

          if (hasOccurrence) {
            positionedItems.add(
              PositionedItem(
                  item: item,
                  leftPaddingRatio: 0,
                  widthRatio: 0,
                  instanceStartedAt: DateTime(
                      current.year,
                      current.month,
                      current.day,
                      item.startedAt.hour,
                      item.startedAt.minute,
                      item.startedAt.second),
                  instanceEndedAt: DateTime(
                      current.year,
                      current.month,
                      current.day,
                      item.endedAt.hour,
                      item.endedAt.minute,
                      item.endedAt.second),
                  instanceIsAllDay: null),
            );
          }

          current = current.add(const Duration(days: 1));
        }
      } else {
        // non-cross-day, non-repeating
        positionedItems.add(PositionedItem(
          item: item,
          leftPaddingRatio: 0,
          widthRatio: 0,
          instanceStartedAt: null,
          instanceEndedAt: null,
          instanceIsAllDay: null,
        ));
      }
    }

    return positionedItems;
  }

  @override
  Widget build(BuildContext context) {
    return InfiniteList(
      direction: InfiniteListDirection.multi,
      builder: (_, index) {
        final date = _date.add(Duration(days: index));
        final items = _itemsByDate[date] ?? [];
        final allDayItems = items.where((i) => i.displayedIsAllDay).toList();
        final nonAllDayItems =
            items.where((i) => !i.displayedIsAllDay).toList();

        return InfiniteListItem(
          headerBuilder: (_) {
            return Padding(
              padding: EdgeInsets.only(
                  top: 12, bottom: nonAllDayItems.isEmpty ? 0 : 24),
              child: Row(
                children: [
                  Container(
                    width: 72,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: items.isEmpty
                          ? AhlColors.primary40
                          : AhlColors.primary,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Text(
                        DateFormat('dd MMM').format(date),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7, right: 15),
                      child: items.isEmpty
                          ? Container(
                              decoration: BoxDecoration(
                                  color: AhlColors.primary20,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(fontSize: 12),
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: allDayItems
                                  .map((allDayItem) =>
                                      _buildAllDayItem(allDayItem.item))
                                  .toList(),
                            ),
                    ),
                  ),
                ],
              ),
            );
          },
          contentBuilder: (_) {
            return AhlTimelineDayGrid(items: nonAllDayItems);
          },
        );
      },
    );
  }

  Map<DateTime, List<PositionedItem>> _groupItemsByDate(
      List<PositionedItem> positionedItems) {
    final itemsByDate = <DateTime, List<PositionedItem>>{};

    for (var positionedItem in positionedItems) {
      final start = positionedItem.displayedStartedAt.getDateStart();
      final end = positionedItem.displayedEndedAt.getDateEnd();

      var current = start;

      do {
        if (!itemsByDate.containsKey(current)) {
          itemsByDate[current] = [];
        }
        itemsByDate[current]?.add(positionedItem);
        current = current.add(const Duration(days: 1));
      } while (end.isAfter(current));
    }

    return itemsByDate;
  }

  Widget _buildAllDayItem(Item allDayItem) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(allDayItem.color),
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            'Test',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontSize: 12, color: AhlColors.darkOrange),
          ),
        ),
      ),
    );
  }
}
