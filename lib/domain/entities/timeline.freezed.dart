// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timeline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Timeline {
  int get timelineId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get updatedBy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimelineCopyWith<Timeline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineCopyWith<$Res> {
  factory $TimelineCopyWith(Timeline value, $Res Function(Timeline) then) =
      _$TimelineCopyWithImpl<$Res>;
  $Res call(
      {int timelineId,
      String title,
      DateTime createdAt,
      String createdBy,
      DateTime updatedAt,
      String updatedBy});
}

/// @nodoc
class _$TimelineCopyWithImpl<$Res> implements $TimelineCopyWith<$Res> {
  _$TimelineCopyWithImpl(this._value, this._then);

  final Timeline _value;
  // ignore: unused_field
  final $Res Function(Timeline) _then;

  @override
  $Res call({
    Object? timelineId = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      timelineId: timelineId == freezed
          ? _value.timelineId
          : timelineId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: updatedBy == freezed
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TimelineCopyWith<$Res> implements $TimelineCopyWith<$Res> {
  factory _$$_TimelineCopyWith(
          _$_Timeline value, $Res Function(_$_Timeline) then) =
      __$$_TimelineCopyWithImpl<$Res>;
  @override
  $Res call(
      {int timelineId,
      String title,
      DateTime createdAt,
      String createdBy,
      DateTime updatedAt,
      String updatedBy});
}

/// @nodoc
class __$$_TimelineCopyWithImpl<$Res> extends _$TimelineCopyWithImpl<$Res>
    implements _$$_TimelineCopyWith<$Res> {
  __$$_TimelineCopyWithImpl(
      _$_Timeline _value, $Res Function(_$_Timeline) _then)
      : super(_value, (v) => _then(v as _$_Timeline));

  @override
  _$_Timeline get _value => super._value as _$_Timeline;

  @override
  $Res call({
    Object? timelineId = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$_Timeline(
      timelineId: timelineId == freezed
          ? _value.timelineId
          : timelineId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: updatedBy == freezed
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Timeline implements _Timeline {
  _$_Timeline(
      {required this.timelineId,
      required this.title,
      required this.createdAt,
      required this.createdBy,
      required this.updatedAt,
      required this.updatedBy});

  @override
  final int timelineId;
  @override
  final String title;
  @override
  final DateTime createdAt;
  @override
  final String createdBy;
  @override
  final DateTime updatedAt;
  @override
  final String updatedBy;

  @override
  String toString() {
    return 'Timeline(timelineId: $timelineId, title: $title, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Timeline &&
            const DeepCollectionEquality()
                .equals(other.timelineId, timelineId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.updatedBy, updatedBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timelineId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(updatedBy));

  @JsonKey(ignore: true)
  @override
  _$$_TimelineCopyWith<_$_Timeline> get copyWith =>
      __$$_TimelineCopyWithImpl<_$_Timeline>(this, _$identity);
}

abstract class _Timeline implements Timeline {
  factory _Timeline(
      {required final int timelineId,
      required final String title,
      required final DateTime createdAt,
      required final String createdBy,
      required final DateTime updatedAt,
      required final String updatedBy}) = _$_Timeline;

  @override
  int get timelineId;
  @override
  String get title;
  @override
  DateTime get createdAt;
  @override
  String get createdBy;
  @override
  DateTime get updatedAt;
  @override
  String get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$_TimelineCopyWith<_$_Timeline> get copyWith =>
      throw _privateConstructorUsedError;
}
