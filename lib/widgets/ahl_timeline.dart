import 'package:aholic/extension/datetime_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sticky_infinite_list/sticky_infinite_list.dart';

import '../domain/entities/item.dart';
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
  var _itemsByDate = <DateTime, List<Item>>{};
  DateTime _date = DateTime.now().getDateStart();

  @override
  void initState() {
    super.initState();
    _itemsByDate = _groupItemsByDate(widget.items);
    _date = widget.date.getDateStart();
  }

  @override
  Widget build(BuildContext context) {
    return InfiniteList(
      direction: InfiniteListDirection.multi,
      builder: (_, index) {
        final date = _date.add(Duration(days: index));
        final items = _itemsByDate[date] ?? [];
        final allDayItems = items.where((i) => i.isAllDay) ?? [];
        final nonAllDayItems = items.where((i) => !i.isAllDay) ?? [];

        return InfiniteListItem(
          headerBuilder: (_) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
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
                      padding: const EdgeInsets.only(left: 8, right: 16),
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
                                      _buildAllDayItem(allDayItem))
                                  .toList(),
                            ),
                    ),
                  ),
                ],
              ),
            );
          },
          contentBuilder: (_) {
            return Container();
          },
        );
      },
    );
  }

  Map<DateTime, List<Item>> _groupItemsByDate(List<Item> items) {
    final itemsByDate = <DateTime, List<Item>>{};

    for (var item in items) {
      final start = item.startedAt.getDateStart();
      final end = item.endedAt.getDateEnd();

      var current = start;

      do {
        if (!itemsByDate.containsKey(current)) {
          itemsByDate[current] = [];
        }
        itemsByDate[current]?.add(item);
        current = current.add(const Duration(days: 1));
      } while (end.isAfter(current));
    }

    return itemsByDate;
  }

  Widget _buildAllDayItem(allDayItem) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: AhlColors.orange, borderRadius: BorderRadius.circular(4)),
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
