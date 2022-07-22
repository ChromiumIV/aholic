import 'dart:math';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../domain/entities/item.dart';
import '../presentation/view_models/item_group.dart';
import '../presentation/view_models/positioned_item.dart';
import '../theme/ahl_colors.dart';

class AhlTimelineDayGrid extends StatefulWidget {
  const AhlTimelineDayGrid({
    Key? key,
    required this.items,
    this.heightPerHour = 48,
  }) : super(key: key);

  final List<PositionedItem> items;
  final double heightPerHour;

  @override
  State<AhlTimelineDayGrid> createState() => _AhlTimelineDayGridState();
}

class _AhlTimelineDayGridState extends State<AhlTimelineDayGrid> {
  List<int> _visibleHours = [];
  List<ItemGroup> _itemGroups = [];

  @override
  void initState() {
    super.initState();

    _calculateItemPositions(widget.items);
  }

  void _calculateItemPositions(List<PositionedItem> items) {
    items.sort((i1, i2) {
      final s = i1.displayedStartedAt.compareTo(i2.displayedStartedAt);
      if (s == 0) {
        return i1.displayedEndedAt.compareTo(i2.displayedEndedAt);
      }
      return s;
    });

    var itemGroups = <ItemGroup>[];
    DateTime? lastItemEnding;

    for (final item in items) {
      _addVisibleHours(item.displayedStartedAt, item.displayedEndedAt);

      if (lastItemEnding == null ||
          (item.displayedStartedAt.isAtSameMomentAs(lastItemEnding) ||
              item.displayedStartedAt.isAfter(lastItemEnding))) {
        _packItems(itemGroups);
        // itemGroups.clear();
        lastItemEnding = null;
      }

      bool isPlaced = false;
      for (final group in itemGroups) {
        if (!_areOverlapping(item, group.items.last)) {
          group.items.add(item);
          isPlaced = true;
          break;
        }
      }

      if (!isPlaced) {
        itemGroups.add(ItemGroup(items: [item]));
      }

      if (lastItemEnding == null ||
          item.displayedEndedAt.isAfter(lastItemEnding)) {
        lastItemEnding = item.displayedEndedAt;
      }
    }

    if (itemGroups.isNotEmpty) {
      _packItems(itemGroups);
    }

    _itemGroups = itemGroups;
  }

  void _packItems(List<ItemGroup> groups) {
    final n = groups.length;

    // var colIndex = 0;

    // for (final group in groups) {
    //   for (final item in group.items) {
    //     final colSpan = _expandItem(item, colIndex, groups);
    //     item.leftPaddingRatio = colIndex / n;
    //     item.widthRatio = (colIndex + colSpan) / n;
    //   }

    //   colIndex++;
    // }

    for (var i = 0; i < n; i++) {
      final col = groups[i];

      for (var j = 0; j < col.items.length; j++) {
        final item = col.items[j];
        final colSpan = _expandItem(item, i, groups);
        item.leftPaddingRatio = i / n;
        item.widthRatio = colSpan / n;
      }
    }
  }

  int _expandItem(PositionedItem item, int colIndex, List<ItemGroup> groups) {
    var colSpan = 1;
    for (final group in groups.skip(colIndex + 1)) {
      for (final ev in group.items) {
        if (_areOverlapping(ev, item)) {
          return colSpan;
        }
      }
      colSpan++;
    }
    return colSpan;
  }

  double _getGridHeight() {
    return _visibleHours.length * widget.heightPerHour;
  }

  double _getItemTopPadding(DateTime itemStartedAt) {
    int precedingHours = 0;

    for (var i = 0; i < itemStartedAt.hour; i++) {
      if (_visibleHours.contains(i)) {
        precedingHours++;
      }
    }

    return ((precedingHours * 60 + itemStartedAt.minute) /
        60 *
        widget.heightPerHour);
  }

  void _addVisibleHours(DateTime actualStartedAt, DateTime actualEndedAt) {
    int startHour =
        // actualStartedAt.minute < 30 ? max(actualStartedAt.hour - 1, 0) :
        actualStartedAt.hour;
    int endHour = actualEndedAt.minute >= 30
        ? min(actualEndedAt.hour + 1, 23)
        : actualEndedAt.hour;

    for (var i = startHour; i <= endHour; i++) {
      if (!_visibleHours.contains(i)) {
        _visibleHours.add(i);
      }
    }
  }

  bool _areOverlapping(PositionedItem e1, PositionedItem e2) =>
      e1.displayedStartedAt.isBefore(e2.displayedEndedAt) &&
      e1.displayedEndedAt.isAfter(e2.displayedStartedAt);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 36),
      child: Row(
        children: [
          _buildHourLabels(_visibleHours),
          _buildItems(_itemGroups),
        ],
      ),
    );
  }

  Widget _buildHourLabels(List<int> visibleHours) {
    final hourWidgets = <Widget>[];

    for (var i = 0; i < visibleHours.length; i++) {
      final hour = visibleHours[i];
      hourWidgets.add(
        SizedBox(
          width: 64,
          height: widget.heightPerHour,
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Transform.translate(
                    offset: const Offset(0, -8),
                    child: Text(
                      hour.toString().padLeft(2, '0'),
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: AhlColors.primary60,
                            fontSize: 12,
                          ),
                    ),
                  ),
                ),
                // Align(
                //     alignment: Alignment.topRight,
                //     child: Container(
                //         height: 1, width: 8, color: AhlColors.primary40)),
                Align(
                  alignment: Alignment.centerRight,
                  child: (i < (visibleHours.length - 1) &&
                          visibleHours[i + 1] - hour > 1)
                      ? const Padding(
                          padding: EdgeInsets.only(right: 6),
                          child: DottedLine(
                              direction: Axis.vertical,
                              lineLength: 24,
                              dashColor: AhlColors.primary40),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Container(
                              height: 1, width: 6, color: AhlColors.primary40),
                        ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: hourWidgets,
    );
  }

  Widget _buildItems(List<ItemGroup> itemGroups) {
    return Expanded(
      child: SizedBox(
        height: _getGridHeight(),
        child: Stack(
          children: [
            for (var i = 0; i < _visibleHours.length; i++) _buildGuideline(i),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Stack(
                children: [
                  for (final itemGroup in itemGroups)
                    for (final item in itemGroup.items)
                      _buildPositionedItem(item, itemGroups.last == itemGroup),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideline(int numOfPrecedingHours) {
    return Padding(
      padding: EdgeInsets.only(
        top: numOfPrecedingHours * widget.heightPerHour,
      ),
      child: Container(
        width: double.infinity,
        height: 1,
        color: AhlColors.primary20,
      ),
      // child: DottedLine(
      //   dashColor: AhlColors.primary40,
      // ),
    );
  }

  Widget _buildPositionedItem(
      PositionedItem positionedItem, bool isLastColumn) {
    return Positioned(
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Padding(
            padding: EdgeInsets.only(
              top: _getItemTopPadding(positionedItem.displayedStartedAt),
              left: positionedItem.leftPaddingRatio * constraints.maxWidth,
              // right: positionedItem.widthRatio * constraints.maxWidth,
            ),
            child: SizedBox(
              width: positionedItem.widthRatio * constraints.maxWidth,
              // width: double.infinity,
              height: positionedItem.displayedEndedAt
                          .difference(positionedItem.displayedStartedAt)
                          .inMinutes /
                      60 *
                      widget.heightPerHour +
                  1,
              child: Padding(
                padding: EdgeInsets.only(right: 8),
                child: _buildItem(positionedItem.item),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildItem(Item item) {
    return Container(
      decoration: BoxDecoration(
        color: Color(item.color),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              'Test Item',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: AhlColors.toDark(Color(item.color)), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
