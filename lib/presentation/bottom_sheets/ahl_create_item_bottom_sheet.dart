import 'package:aholic/theme/ahl_colors.dart';
import 'package:aholic/widgets/ahl_icon_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AhlCreateItemBottomSheet extends StatelessWidget {
  const AhlCreateItemBottomSheet({
    Key? key,
    this.onItemSelected,
  }) : super(key: key);

  final void Function(int)? onItemSelected;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 8),
          //   child: Container(
          //     width: 96,
          //     height: 6,
          //     decoration: BoxDecoration(
          //       color: Colors.white.withOpacity(0.3),
          //       borderRadius: const BorderRadius.all(Radius.circular(3)),
          //     ),
          //   ),
          // ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(24)),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'title.add_to_timeline'.tr(),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: AhlIconButton(
                        icon: Icons.close,
                        fillColor: AhlColors.primary20,
                        iconColor: AhlColors.primary,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIconButton(context, Icons.event, AhlColors.azure,
                          'label.event', 0),
                      _buildIconButton(context, Icons.notifications,
                          AhlColors.green, 'label.reminder', 1),
                      _buildIconButton(context, Icons.paid, AhlColors.yellow,
                          'label.transaction', 2),
                      _buildIconButton(
                          context, Icons.flag, AhlColors.lime, 'label.goal', 3),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, IconData icon, Color fillColor,
      String label, int index) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 32) / 4,
      child: Column(
        children: [
          AhlIconButton(
            icon: icon,
            fillColor: fillColor,
            iconColor: AhlColors.primary,
            onTap: () {
              if (onItemSelected != null) {
                onItemSelected!(index);
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              label.tr(),
              style:
                  Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
