import 'package:freezed_annotation/freezed_annotation.dart';

import 'positioned_item.dart';

part 'item_group.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ItemGroup with _$ItemGroup {
  factory ItemGroup({
    required List<PositionedItem> items,
  }) = _ItemGroup;
}
