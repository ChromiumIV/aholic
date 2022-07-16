import 'package:flutter/material.dart';

import '../domain/entities/item.dart';

class AhlTimelineDayGrid extends StatefulWidget {
  const AhlTimelineDayGrid({
    Key? key,
    required this.items,
    this.heightPerHour = 48,
  }) : super(key: key);

  final List<Item> items;
  final double heightPerHour;

  @override
  State<AhlTimelineDayGrid> createState() => _AhlTimelineDayGridState();
}

class _AhlTimelineDayGridState extends State<AhlTimelineDayGrid> {


  @override
  void initState() {
    super.initState();
    _calculateItemPositions(widget.items);
  }

  @override
  Widget build(BuildContext context) {

  }

  void _calculateItemPositions(List<Item> items) {
    items.sort((i1, i2) {
      final 
    })
  }
}
