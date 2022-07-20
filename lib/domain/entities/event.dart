import 'package:freezed_annotation/freezed_annotation.dart';

import 'item.dart';

part 'event.freezed.dart';

@freezed
class Event with _$Event {
  factory Event({
    required Item item,
    required String title,
    required String location,
    required String note,
  }) = _Event;
}
