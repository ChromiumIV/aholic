import 'package:aholic/widgets/ahl_animated_container.dart';
import 'package:flutter/material.dart';

import '../../theme/ahl_colors.dart';
import '../../widgets/ahl_icon_button.dart';

class AhlSelectableItem {
  AhlSelectableItem({
    required this.title,
    this.subtitle,
  });

  String title;
  String? subtitle;
}

class AhlSelectItemBottomSheet<T> extends StatefulWidget {
  const AhlSelectItemBottomSheet({
    Key? key,
    required this.items,
    this.title,
    this.selectedItem,
    this.itemBuilder,
    this.fillColor = AhlColors.primary40,
    this.textColor = AhlColors.primary,
    this.onItemSelected,
  }) : super(key: key);

  final String? title;
  final List<T> items;
  final T? selectedItem;
  final AhlSelectableItem Function(T)? itemBuilder;
  final Color fillColor;
  final Color textColor;
  final void Function(T?)? onItemSelected;

  @override
  State<AhlSelectItemBottomSheet> createState() =>
      AhlSelectItemBottomSheetState<T>();
}

class AhlSelectItemBottomSheetState<T>
    extends State<AhlSelectItemBottomSheet<T>> {
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: widget.title != null
                    ? Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          widget.title!,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      )
                    : const SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: AhlIconButton(
                  icon: Icons.close,
                  fillColor: widget.fillColor.withOpacity(0.2),
                  iconColor: widget.textColor,
                  hoverIconColor: Colors.white,
                  onTap: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 8, bottom: 36),
                  itemCount: widget.items.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: AhlAnimatedContainer(
                        builder: (isPressed) {
                          final isSelected =
                              widget.items[index] == _selectedItem;
                          final item = widget.itemBuilder != null
                              ? widget.itemBuilder!(widget.items[index])
                              : AhlSelectableItem(
                                  title: widget.items[index].toString());
                          final titleTextColor = isSelected
                              ? (isPressed ? Colors.white : widget.textColor)
                              : (isPressed ? Colors.white : AhlColors.primary);
                          final subtitleTextColor = isSelected
                              ? (isPressed
                                  ? Colors.white.withOpacity(0.5)
                                  : widget.textColor.withOpacity(0.5))
                              : (isPressed
                                  ? Colors.white.withOpacity(0.5)
                                  : AhlColors.primary40);
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: titleTextColor),
                                ),
                                if (item.subtitle != null)
                                  Text(
                                    item.subtitle!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(color: subtitleTextColor),
                                  ),
                              ],
                            ),
                          );
                        },
                        decorationBuilder: (isPressed) {
                          final isSelected =
                              widget.items[index] == _selectedItem;
                          final fillColor = isSelected
                              ? (isPressed
                                  ? widget.textColor
                                  : widget.fillColor)
                              : (isPressed ? widget.textColor : Colors.white);
                          return BoxDecoration(
                            color: fillColor,
                            borderRadius: BorderRadius.circular(8),
                          );
                        },
                        onTap: () {
                          setState(() {
                            _selectedItem = widget.items[index];
                          });
                          if (widget.onItemSelected != null) {
                            widget.onItemSelected!(_selectedItem);
                          }
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
