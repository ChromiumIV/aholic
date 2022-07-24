import 'package:flutter/material.dart';

import '../../theme/ahl_colors.dart';
import '../../widgets/ahl_icon_button.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    Key? key,
    required this.title,
    required this.message,
    this.showOKButton = true,
    this.showCancelButton = true,
    this.onOKButtonPressed,
    this.onCancelButtonPressed,
  }) : super(key: key);

  final String title;
  final String message;
  final bool showOKButton;
  final bool showCancelButton;
  final void Function()? onOKButtonPressed;
  final void Function()? onCancelButtonPressed;

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
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Text(
                    message,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (showCancelButton)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: AhlIconButton(
                          icon: Icons.close,
                          fillColor: AhlColors.primary20,
                          iconColor: AhlColors.primary,
                          hoverIconColor: Colors.white,
                          onTap: () {
                            Navigator.of(context).pop();
                            if (onCancelButtonPressed != null) {
                              onCancelButtonPressed!();
                            }
                          },
                        ),
                      ),
                    if (showOKButton)
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: AhlIconButton(
                          icon: Icons.check,
                          fillColor: AhlColors.primary20,
                          iconColor: AhlColors.primary,
                          hoverIconColor: Colors.white,
                          onTap: () {
                            if (onOKButtonPressed != null) {
                              onOKButtonPressed!();
                            }
                          },
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
