import 'package:aholic/theme/ahl_colors.dart';
import 'package:aholic/widgets/ahl_button.dart';
import 'package:aholic/widgets/ahl_icon_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AhlDrawer extends StatelessWidget {
  const AhlDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 46, bottom: 16),
              child: SizedBox(
                height: 72,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 16, right: 64),
                        itemCount: 8,
                        itemBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                    color: AhlColors.yellow,
                                    borderRadius: BorderRadius.circular(24)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  'Test',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 72,
                        width: 80,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8, right: 8),
                        child: SizedBox(
                          width: 64,
                          height: 56,
                          child: AhlButton(
                            text: 'label.all_upper'.tr(),
                            fillColor: Colors.white,
                            textColor: AhlColors.accent,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              color: AhlColors.primary20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Text(
                  'label.timeline_upper'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: AhlColors.primary60),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: AhlButton(
                text: 'label.manage'.tr(),
                padding: EdgeInsets.zero,
                fillColor: AhlColors.primary20,
                textColor: AhlColors.primary,
                hoverBorderColor: Colors.white,
              ),
            ),
            Container(
              height: 1,
              color: AhlColors.primary20,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: AhlIconButton(
                icon: Icons.settings,
                fillColor: Colors.white,
                iconColor: AhlColors.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
