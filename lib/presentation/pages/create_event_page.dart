import 'package:aholic/widgets/ahl_icon_button.dart';
import 'package:aholic/widgets/ahl_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/ahl_colors.dart';
import '../../widgets/ahl_date_time_picker.dart';
import '../../widgets/ahl_scaffold.dart';

class CreateEventPage extends ConsumerWidget {
  const CreateEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AhlScaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
              color: AhlColors.orange,
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
                        'title.new_event'.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(color: AhlColors.darkOrange),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: AhlIconButton(
                      icon: Icons.close,
                      fillColor: Colors.white.withOpacity(0.2),
                      iconColor: AhlColors.darkOrange,
                      hoverIconColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AhlIconButton(
                      icon: Icons.check,
                      fillColor: Colors.white.withOpacity(0.2),
                      iconColor: AhlColors.darkOrange,
                      hoverIconColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AhlTextField(
            hintText: 'label.title'.tr(),
            fillColor: AhlColors.orange.withOpacity(0.2),
            textColor: AhlColors.darkOrange,
            hintColor: AhlColors.darkOrange.withOpacity(0.5),
            padding: const EdgeInsets.only(bottom: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: AhlDateTimePicker(
                  fillColor: AhlColors.orange,
                  textColor: AhlColors.darkOrange,
                  bottomSheetSubtitle: 'label.from'.tr(),
                  value: DateTime.now(),
                  padding: const EdgeInsets.only(bottom: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'label.to_lower'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AhlColors.darkOrange),
                ),
              ),
              Expanded(
                child: AhlDateTimePicker(
                  fillColor: AhlColors.orange,
                  textColor: AhlColors.darkOrange,
                  bottomSheetSubtitle: 'label.to'.tr(),
                  value: DateTime.now(),
                  padding: const EdgeInsets.only(bottom: 16),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AhlTextField(
            hintText: 'label.location'.tr(),
            fillColor: AhlColors.orange.withOpacity(0.2),
            textColor: AhlColors.darkOrange,
            hintColor: AhlColors.darkOrange.withOpacity(0.5),
            padding: const EdgeInsets.only(bottom: 16),
          ),
        ),
      ]),
    );
  }
}
