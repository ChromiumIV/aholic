import 'package:aholic/presentation/bottom_sheets/ahl_bottom_sheet.dart';
import 'package:aholic/widgets/ahl_animated_container.dart';
import 'package:flutter/material.dart';

import '../presentation/bottom_sheets/ahl_select_item_bottom_sheet.dart';
import '../theme/ahl_colors.dart';

class AhlComboBox<T> extends StatefulWidget {
  const AhlComboBox({
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
  final AhlSelectableItem Function(T?)? itemBuilder;
  final Color fillColor;
  final Color textColor;
  final void Function(T?)? onItemSelected;

  @override
  State<AhlComboBox<T>> createState() => _AhlComboBoxState<T>();
}

class _AhlComboBoxState<T> extends State<AhlComboBox<T>> {
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return AhlAnimatedContainer(
      builder: (isPressed) {
        final title = _selectedItem == null
            ? ''
            : widget.itemBuilder != null
                ? widget.itemBuilder!(_selectedItem).title
                : _selectedItem.toString();
        final textColor = isPressed ? Colors.white : widget.textColor;
        final iconColor = textColor.withOpacity(0.5);
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: textColor),
                ),
              ),
              Icon(
                Icons.expand_more,
                color: iconColor,
              ),
            ],
          ),
        );
      },
      decorationBuilder: (isPressed) {
        final fillColor =
            isPressed ? widget.textColor : widget.fillColor.withOpacity(0.2);
        return BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(8),
        );
      },
      onTap: () {
        showAhlBottomSheet(
          context: context,
          isScrollControlled: false,
          bottomSheet: AhlSelectItemBottomSheet(
            items: widget.items,
            title: widget.title,
            selectedItem: _selectedItem,
            itemBuilder: widget.itemBuilder,
            fillColor: widget.fillColor,
            textColor: widget.textColor,
            onItemSelected: (T? item) {
              setState(() {
                _selectedItem = item;
              });
              if (widget.onItemSelected != null) {
                widget.onItemSelected!(_selectedItem);
              }
            },
          ),
        );
      },
    );
  }
}
