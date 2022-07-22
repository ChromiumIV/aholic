import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entities/item.dart';
import '../../theme/ahl_colors.dart';
import '../../widgets/ahl_timeline.dart';

class TimelinePageFragment extends ConsumerWidget {
  const TimelinePageFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Text(
              'title.timeline'.tr(),
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        Expanded(
          child: AhlTimeline(
            date: DateTime.now(),
            items: [
              Item(
                  itemId: 1,
                  startedAt: DateTime(2022, 7, 15, 14),
                  endedAt: DateTime(2022, 7, 15, 15),
                  isAllDay: false,
                  color: AhlColors.red.value,
                  itemReps: [],
                  createdAt: DateTime.now(),
                  createdBy: '',
                  updatedAt: DateTime.now(),
                  updatedBy: ''),
              Item(
                  itemId: 1,
                  startedAt: DateTime(2022, 7, 15, 14),
                  endedAt: DateTime(2022, 7, 15, 15),
                  isAllDay: true,
                  color: AhlColors.red.value,
                  itemReps: [],
                  createdAt: DateTime.now(),
                  createdBy: '',
                  updatedAt: DateTime.now(),
                  updatedBy: ''),
              Item(
                  itemId: 1,
                  startedAt: DateTime(2022, 7, 15, 17),
                  endedAt: DateTime(2022, 7, 15, 17, 30),
                  isAllDay: false,
                  color: AhlColors.yellow.value,
                  itemReps: [],
                  createdAt: DateTime.now(),
                  createdBy: '',
                  updatedAt: DateTime.now(),
                  updatedBy: ''),
              Item(
                  itemId: 1,
                  startedAt: DateTime(2022, 7, 16, 9),
                  endedAt: DateTime(2022, 7, 16, 16, 10),
                  isAllDay: false,
                  color: AhlColors.cyan.value,
                  itemReps: [],
                  createdAt: DateTime.now(),
                  createdBy: '',
                  updatedAt: DateTime.now(),
                  updatedBy: ''),
              Item(
                  itemId: 1,
                  startedAt: DateTime(2022, 7, 15, 22),
                  endedAt: DateTime(2022, 7, 16, 3, 30),
                  isAllDay: false,
                  color: AhlColors.violet.value,
                  itemReps: [],
                  createdAt: DateTime.now(),
                  createdBy: '',
                  updatedAt: DateTime.now(),
                  updatedBy: ''),
              Item(
                  itemId: 1,
                  startedAt: DateTime(2022, 7, 16, 2),
                  endedAt: DateTime(2022, 7, 16, 3, 30),
                  isAllDay: false,
                  color: AhlColors.blue.value,
                  itemReps: [],
                  createdAt: DateTime.now(),
                  createdBy: '',
                  updatedAt: DateTime.now(),
                  updatedBy: ''),
              Item(
                  itemId: 1,
                  startedAt: DateTime(2022, 7, 16, 0),
                  endedAt: DateTime(2022, 7, 16, 1, 30),
                  isAllDay: false,
                  color: AhlColors.purple.value,
                  itemReps: [],
                  createdAt: DateTime.now(),
                  createdBy: '',
                  updatedAt: DateTime.now(),
                  updatedBy: ''),
              Item(
                  itemId: 1,
                  startedAt: DateTime(2022, 7, 16, 2, 30),
                  endedAt: DateTime(2022, 7, 16, 5),
                  isAllDay: false,
                  color: AhlColors.orange.value,
                  itemReps: [],
                  createdAt: DateTime.now(),
                  createdBy: '',
                  updatedAt: DateTime.now(),
                  updatedBy: ''),
              Item(
                  itemId: 1,
                  startedAt: DateTime(2022, 7, 16, 4, 30),
                  endedAt: DateTime(2022, 7, 16, 10),
                  isAllDay: false,
                  color: AhlColors.yellow.value,
                  itemReps: [],
                  createdAt: DateTime.now(),
                  createdBy: '',
                  updatedAt: DateTime.now(),
                  updatedBy: ''),
              Item(
                  itemId: 1,
                  startedAt: DateTime(2022, 7, 16, 6, 30),
                  endedAt: DateTime(2022, 7, 16, 7),
                  isAllDay: false,
                  color: AhlColors.green.value,
                  itemReps: [],
                  createdAt: DateTime.now(),
                  createdBy: '',
                  updatedAt: DateTime.now(),
                  updatedBy: ''),
              Item(
                  itemId: 1,
                  startedAt: DateTime(2022, 7, 16, 20, 30),
                  endedAt: DateTime(2022, 7, 16, 22),
                  isAllDay: false,
                  color: AhlColors.green.value,
                  itemReps: [],
                  createdAt: DateTime.now(),
                  createdBy: '',
                  updatedAt: DateTime.now(),
                  updatedBy: ''),
              Item(
                  itemId: 1,
                  startedAt: DateTime(2022, 7, 14, 20, 30),
                  endedAt: DateTime(2022, 7, 16, 22),
                  isAllDay: true,
                  color: AhlColors.azure.value,
                  itemReps: [],
                  createdAt: DateTime.now(),
                  createdBy: '',
                  updatedAt: DateTime.now(),
                  updatedBy: ''),
              Item(
                  itemId: 1,
                  startedAt: DateTime(2022, 7, 27, 20, 30),
                  endedAt: DateTime(2022, 7, 27, 22),
                  isAllDay: true,
                  color: AhlColors.azure.value,
                  itemReps: [],
                  createdAt: DateTime.now(),
                  createdBy: '',
                  updatedAt: DateTime.now(),
                  updatedBy: ''),
            ],
          ),
        ),
      ],
    );
  }
}
