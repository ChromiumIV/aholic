import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/item.dart';

part 'positioned_item.freezed.dart';

@unfreezed
class PositionedItem with _$PositionedItem {
  factory PositionedItem({
    required final Item item,
    required double leftPaddingRatio,
    required double widthRatio,
    required DateTime? instanceStartedAt,
    required DateTime? instanceEndedAt,
    required bool? instanceIsAllDay,
  }) = _PositionedItem;
}

extension PositionedItemExtension on PositionedItem {
  DateTime get displayedStartedAt => instanceStartedAt ?? item.startedAt;
  DateTime get displayedEndedAt => instanceEndedAt ?? item.endedAt;
  bool get displayedIsAllDay => instanceIsAllDay ?? item.isAllDay;
}
