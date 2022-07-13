import 'package:aholic/widgets/ahl_icon_button.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../theme/ahl_colors.dart';

class AhlBottomNavigationBar extends StatefulWidget {
  const AhlBottomNavigationBar({
    Key? key,
    required this.icons,
    this.onTabSelected,
    this.onFabPressed,
  }) : super(key: key);

  final List<IconData> icons;
  final void Function(int)? onTabSelected;
  final void Function()? onFabPressed;

  @override
  State<AhlBottomNavigationBar> createState() => _AhlBottomNavigationBarState();
}

class _AhlBottomNavigationBarState extends State<AhlBottomNavigationBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final iconButtons = <Widget>[];

    widget.icons.forEachIndexed((index, icon) {
      iconButtons.add(
        AhlIconButton(
          icon: icon,
          fillColor: Colors.white,
          iconColor: _index == index ? AhlColors.primary : AhlColors.primary40,
          onTap: () {
            setState(() {
              _index = index;
            });

            if (widget.onTabSelected != null) {
              widget.onTabSelected!(index);
            }
          },
        ),
      );
    });

    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: iconButtons,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              Transform.translate(
                offset: Offset(0, -21),
                child: AhlIconButton(
                  icon: Icons.add,
                  onTap: widget.onFabPressed,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
