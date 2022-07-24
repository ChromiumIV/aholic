import 'package:aholic/domain/entities/timeline.dart';
import 'package:aholic/presentation/dialogs/confirmation_dialog.dart';
import 'package:aholic/theme/ahl_colors.dart';
import 'package:aholic/widgets/ahl_button.dart';
import 'package:aholic/widgets/ahl_icon_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../dialogs/edit_timeline_dialog.dart';

class AhlTimelineBottomSheet extends StatefulWidget {
  const AhlTimelineBottomSheet({
    Key? key,
    required this.timeline,
  }) : super(key: key);

  final Timeline timeline;

  @override
  State<AhlTimelineBottomSheet> createState() => _AhlTimelineBottomSheetState();
}

class _AhlTimelineBottomSheetState extends State<AhlTimelineBottomSheet> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            height: 6,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
        AnimatedSize(
          alignment: Alignment.bottomCenter,
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceInOut,
          child: Container(
            height: _isExpanded ? MediaQuery.of(context).size.height / 2 : null,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(24)),
            ),
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                widget.timeline.title,
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                            Text(widget.timeline.createdBy,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                      color: AhlColors.primary60,
                                    )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: _isExpanded
                          ? AhlIconButton(
                              icon: Icons.expand_more,
                              fillColor: AhlColors.primary20,
                              iconColor: AhlColors.primary,
                              onTap: () {
                                setState(() {
                                  _isExpanded = false;
                                });
                              },
                            )
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isExpanded = true;
                                });
                              },
                              child: Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(21),
                                  color: AhlColors.primary20,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    height: 1,
                    color: AhlColors.primary20,
                  ),
                ),
                if (_isExpanded)
                  Expanded(
                    child: ListView.builder(
                        itemBuilder: (_, index) => Container()),
                  ),
                if (!_isExpanded)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AhlButton(
                      text: 'label.edit'.tr(),
                      fillColor: AhlColors.primary20,
                      textColor: AhlColors.primary,
                      hoverBorderColor: Colors.white,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => EditTimelineDialog(
                                  timeline: widget.timeline,
                                ));
                      },
                    ),
                  ),
                if (!_isExpanded)
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                    child: AhlButton(
                      text: 'label.delete'.tr(),
                      fillColor: AhlColors.accent20,
                      textColor: AhlColors.accent,
                      hoverBorderColor: Colors.white,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => ConfirmationDialog(
                            title: 'title.delete_timeline'.tr(),
                            message: 'message.delete_timeline'.tr(
                              namedArgs: {
                                'timelineName': widget.timeline.title
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
