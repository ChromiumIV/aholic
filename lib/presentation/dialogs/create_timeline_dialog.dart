import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../theme/ahl_colors.dart';
import '../../widgets/ahl_icon_button.dart';
import '../../widgets/ahl_text_field.dart';

class CreateTimelineDialog extends StatelessWidget {
  const CreateTimelineDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(24))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: Text(
                    'title.create_timeline'.tr(),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AhlTextField(
                    hintText: 'label.title'.tr(),
                    padding: const EdgeInsets.only(bottom: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: AhlIconButton(
                        icon: Icons.close,
                        fillColor: AhlColors.primary20,
                        iconColor: AhlColors.primary,
                        hoverIconColor: Colors.white,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: AhlIconButton(
                        icon: Icons.check,
                        fillColor: AhlColors.primary20,
                        iconColor: AhlColors.primary,
                        hoverIconColor: Colors.white,
                        onTap: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
