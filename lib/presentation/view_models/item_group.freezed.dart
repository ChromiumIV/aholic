// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemGroup {
  List<PositionedItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemGroupCopyWith<ItemGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemGroupCopyWith<$Res> {
  factory $ItemGroupCopyWith(ItemGroup value, $Res Function(ItemGroup) then) =
      _$ItemGroupCopyWithImpl<$Res>;
  $Res call({List<PositionedItem> items});
}

/// @nodoc
class _$ItemGroupCopyWithImpl<$Res> implements $ItemGroupCopyWith<$Res> {
  _$ItemGroupCopyWithImpl(this._value, this._then);

  final ItemGroup _value;
  // ignore: unused_field
  final $Res Function(ItemGroup) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PositionedItem>,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemGroupCopyWith<$Res> implements $ItemGroupCopyWith<$Res> {
  factory _$$_ItemGroupCopyWith(
          _$_ItemGroup value, $Res Function(_$_ItemGroup) then) =
      __$$_ItemGroupCopyWithImpl<$Res>;
  @override
  $Res call({List<PositionedItem> items});
}

/// @nodoc
class __$$_ItemGroupCopyWithImpl<$Res> extends _$ItemGroupCopyWithImpl<$Res>
    implements _$$_ItemGroupCopyWith<$Res> {
  __$$_ItemGroupCopyWithImpl(
      _$_ItemGroup _value, $Res Function(_$_ItemGroup) _then)
      : super(_value, (v) => _then(v as _$_ItemGroup));

  @override
  _$_ItemGroup get _value => super._value as _$_ItemGroup;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_$_ItemGroup(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PositionedItem>,
    ));
  }
}

/// @nodoc

class _$_ItemGroup implements _ItemGroup {
  _$_ItemGroup({required this.items});

  @override
  final List<PositionedItem> items;

  @override
  String toString() {
    return 'ItemGroup(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemGroup &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  _$$_ItemGroupCopyWith<_$_ItemGroup> get copyWith =>
      __$$_ItemGroupCopyWithImpl<_$_ItemGroup>(this, _$identity);
}

abstract class _ItemGroup implements ItemGroup {
  factory _ItemGroup({required final List<PositionedItem> items}) =
      _$_ItemGroup;

  @override
  List<PositionedItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$_ItemGroupCopyWith<_$_ItemGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
