import 'package:aholic/presentation/bottom_sheets/ahl_timeline_bottom_sheet.dart';
import 'package:aholic/presentation/dialogs/create_timeline_dialog.dart';
import 'package:aholic/widgets/ahl_animated_container.dart';
import 'package:aholic/widgets/ahl_button.dart';
import 'package:aholic/widgets/ahl_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entities/timeline.dart';
import '../../theme/ahl_colors.dart';
import '../../widgets/ahl_icon_button.dart';
import '../bottom_sheets/ahl_bottom_sheet.dart';

class ManageTimelinesPage extends ConsumerStatefulWidget {
  const ManageTimelinesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ManageTimelinesPageState();
}

class _ManageTimelinesPageState extends ConsumerState<ManageTimelinesPage> {
  var _timelines = <Timeline>[
    Timeline(
        timelineId: 1,
        title: 'Work',
        createdAt: DateTime.now(),
        createdBy: '',
        updatedAt: DateTime.now(),
        updatedBy: ''),
    Timeline(
        timelineId: 2,
        title: 'Private',
        createdAt: DateTime.now(),
        createdBy: 'Chromium',
        updatedAt: DateTime.now(),
        updatedBy: ''),
    Timeline(
        timelineId: 3,
        title: 'Public Holiday',
        createdAt: DateTime.now(),
        createdBy: 'Aholic',
        updatedAt: DateTime.now(),
        updatedBy: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return AhlScaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
              color: AhlColors.primary20,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(24)),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'title.manage_timelines'.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(color: AhlColors.primary),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AhlIconButton(
                      icon: Icons.check,
                      fillColor: AhlColors.primary40.withOpacity(0.5),
                      iconColor: AhlColors.primary,
                      hoverIconColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ReorderableListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: _timelines.length,
              onReorder: (int oldIndex, int newIndex) {
                debugPrint('$oldIndex $newIndex');
                if (newIndex > oldIndex) {
                  newIndex--;
                }
                // setState(() {
                final timeline = _timelines[newIndex];
                _timelines[newIndex] = _timelines[oldIndex];
                _timelines[oldIndex] = timeline;
                // });
              },
              proxyDecorator: (widget, _, __) {
                return Align(
                    alignment: Alignment.center,
                    child: Opacity(opacity: 0.5, child: widget));
              },
              buildDefaultDragHandles: false,
              itemBuilder: (_, index) => Padding(
                key: ValueKey(_timelines[index].timelineId),
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ReorderableDragStartListener(
                        index: index,
                        child: const Icon(
                          Icons.drag_indicator,
                          color: AhlColors.primary40,
                        ),
                      ),
                    ),
                    Expanded(
                      child: AhlAnimatedContainer(
                        decorationBuilder: (isPressed) => BoxDecoration(
                            color:
                                isPressed ? AhlColors.primary20 : Colors.white,
                            border: Border.all(
                                color: isPressed
                                    ? AhlColors.primary40
                                    : Colors.white,
                                width: 2),
                            borderRadius: BorderRadius.circular(8)),
                        builder: (isPressed) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                _timelines[index].title,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              if (_timelines[index].createdBy.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    _timelines[index].createdBy,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            fontSize: 12,
                                            color: AhlColors.primary60),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        onTap: () {
                          showAhlBottomSheet(
                            context: context,
                            bottomSheet: AhlTimelineBottomSheet(
                              timeline: _timelines[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
            child: AhlButton(
              text: 'label.create'.tr(),
              fillColor: AhlColors.primary20,
              textColor: AhlColors.primary,
              hoverBorderColor: Colors.white,
              onTap: () {
                showDialog(
                    context: context, builder: (_) => CreateTimelineDialog());
              },
            ),
          ),
        ],
      ),
    );
  }
}
