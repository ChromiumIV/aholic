import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline.freezed.dart';

@freezed
class Timeline with _$Timeline {
  factory Timeline({
    required int timelineId,
    required String title,
    required DateTime createdAt,
    required String createdBy,
    required DateTime updatedAt,
    required String updatedBy,
  }) = _Timeline;
}
