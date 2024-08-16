// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_list_sort_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CourseListSortCategory {
  String get displayName => throw _privateConstructorUsedError;
  int get tileColorInt => throw _privateConstructorUsedError;
  int get textColorInt => throw _privateConstructorUsedError;
  List<Course> Function(List<Course>) get fn =>
      throw _privateConstructorUsedError;

  /// Create a copy of CourseListSortCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseListSortCategoryCopyWith<CourseListSortCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseListSortCategoryCopyWith<$Res> {
  factory $CourseListSortCategoryCopyWith(CourseListSortCategory value,
          $Res Function(CourseListSortCategory) then) =
      _$CourseListSortCategoryCopyWithImpl<$Res, CourseListSortCategory>;
  @useResult
  $Res call(
      {String displayName,
      int tileColorInt,
      int textColorInt,
      List<Course> Function(List<Course>) fn});
}

/// @nodoc
class _$CourseListSortCategoryCopyWithImpl<$Res,
        $Val extends CourseListSortCategory>
    implements $CourseListSortCategoryCopyWith<$Res> {
  _$CourseListSortCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseListSortCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? tileColorInt = null,
    Object? textColorInt = null,
    Object? fn = null,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      tileColorInt: null == tileColorInt
          ? _value.tileColorInt
          : tileColorInt // ignore: cast_nullable_to_non_nullable
              as int,
      textColorInt: null == textColorInt
          ? _value.textColorInt
          : textColorInt // ignore: cast_nullable_to_non_nullable
              as int,
      fn: null == fn
          ? _value.fn
          : fn // ignore: cast_nullable_to_non_nullable
              as List<Course> Function(List<Course>),
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseListSortCategoryImplCopyWith<$Res>
    implements $CourseListSortCategoryCopyWith<$Res> {
  factory _$$CourseListSortCategoryImplCopyWith(
          _$CourseListSortCategoryImpl value,
          $Res Function(_$CourseListSortCategoryImpl) then) =
      __$$CourseListSortCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String displayName,
      int tileColorInt,
      int textColorInt,
      List<Course> Function(List<Course>) fn});
}

/// @nodoc
class __$$CourseListSortCategoryImplCopyWithImpl<$Res>
    extends _$CourseListSortCategoryCopyWithImpl<$Res,
        _$CourseListSortCategoryImpl>
    implements _$$CourseListSortCategoryImplCopyWith<$Res> {
  __$$CourseListSortCategoryImplCopyWithImpl(
      _$CourseListSortCategoryImpl _value,
      $Res Function(_$CourseListSortCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseListSortCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? tileColorInt = null,
    Object? textColorInt = null,
    Object? fn = null,
  }) {
    return _then(_$CourseListSortCategoryImpl(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      tileColorInt: null == tileColorInt
          ? _value.tileColorInt
          : tileColorInt // ignore: cast_nullable_to_non_nullable
              as int,
      textColorInt: null == textColorInt
          ? _value.textColorInt
          : textColorInt // ignore: cast_nullable_to_non_nullable
              as int,
      fn: null == fn
          ? _value.fn
          : fn // ignore: cast_nullable_to_non_nullable
              as List<Course> Function(List<Course>),
    ));
  }
}

/// @nodoc

class _$CourseListSortCategoryImpl implements _CourseListSortCategory {
  const _$CourseListSortCategoryImpl(
      {required this.displayName,
      required this.tileColorInt,
      required this.textColorInt,
      required this.fn});

  @override
  final String displayName;
  @override
  final int tileColorInt;
  @override
  final int textColorInt;
  @override
  final List<Course> Function(List<Course>) fn;

  @override
  String toString() {
    return 'CourseListSortCategory(displayName: $displayName, tileColorInt: $tileColorInt, textColorInt: $textColorInt, fn: $fn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseListSortCategoryImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.tileColorInt, tileColorInt) ||
                other.tileColorInt == tileColorInt) &&
            (identical(other.textColorInt, textColorInt) ||
                other.textColorInt == textColorInt) &&
            (identical(other.fn, fn) || other.fn == fn));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, displayName, tileColorInt, textColorInt, fn);

  /// Create a copy of CourseListSortCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseListSortCategoryImplCopyWith<_$CourseListSortCategoryImpl>
      get copyWith => __$$CourseListSortCategoryImplCopyWithImpl<
          _$CourseListSortCategoryImpl>(this, _$identity);
}

abstract class _CourseListSortCategory implements CourseListSortCategory {
  const factory _CourseListSortCategory(
          {required final String displayName,
          required final int tileColorInt,
          required final int textColorInt,
          required final List<Course> Function(List<Course>) fn}) =
      _$CourseListSortCategoryImpl;

  @override
  String get displayName;
  @override
  int get tileColorInt;
  @override
  int get textColorInt;
  @override
  List<Course> Function(List<Course>) get fn;

  /// Create a copy of CourseListSortCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseListSortCategoryImplCopyWith<_$CourseListSortCategoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
