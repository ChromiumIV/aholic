import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_rep.freezed.dart';

@freezed
class ItemRep with _$ItemRep {
  factory ItemRep({
    int? itemRepId,
    int? itemId,
    required DateTime repFrom,
    required DateTime? repTo,
    required String year,
    required String month,
    required String day,
    required String week,
    required String weekday,
  }) = _ItemRep;
}
