import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entities/item.dart';
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
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
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
              Item(DateTime(2022, 7, 15, 14), DateTime(2022, 7, 15, 15), false),
              Item(DateTime(2022, 7, 15, 14), DateTime(2022, 7, 15, 15), true),
              Item(DateTime(2022, 7, 15, 17), DateTime(2022, 7, 15, 17, 30),
                  false),
              Item(DateTime(2022, 7, 16, 9), DateTime(2022, 7, 16, 12), false),
              Item(DateTime(2022, 7, 15, 22), DateTime(2022, 7, 16, 3, 30),
                  false),
            ],
          ),
        ),
      ],
    );
  }
}
