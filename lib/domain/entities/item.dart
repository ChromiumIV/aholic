import 'package:freezed_annotation/freezed_annotation.dart';

import 'item_rep.dart';

part 'item.freezed.dart';

@freezed
class Item with _$Item {
  factory Item({
    required int itemId,
    required DateTime startedAt,
    required DateTime endedAt,
    required bool isAllDay,
    required int color,
    required List<ItemRep> itemReps,
    required DateTime createdAt,
    required String createdBy,
    required DateTime updatedAt,
    required String updatedBy,
  }) = _Item;
}
