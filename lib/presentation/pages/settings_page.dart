import 'package:aholic/widgets/ahl_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/ahl_colors.dart';
import '../../widgets/ahl_icon_button.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return AhlScaffold(
      body: Column(children: [
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
      ]),
    );
  }
}
