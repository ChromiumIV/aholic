import 'package:flutter/material.dart';

import '../theme/ahl_colors.dart';

class AhlPageIndicator extends StatelessWidget {
  const AhlPageIndicator({
    Key? key,
    required this.itemCount,
    this.currentItem = 0,
    this.activeColor = AhlColors.primary,
    this.inactiveColor = AhlColors.primaryA20,
  }) : super(key: key);

  final int itemCount;
  final int currentItem;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
      child: ListView.builder(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: currentItem == index ? activeColor : inactiveColor,
            ),
          ),
        ),
      ),
    );
  }
}
