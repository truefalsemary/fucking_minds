// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CourseListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Course> courses) loadSuccess,
    required TResult Function(Object error) loadFailure,
    required TResult Function(Object error) operationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<Course> courses)? loadSuccess,
    TResult? Function(Object error)? loadFailure,
    TResult? Function(Object error)? operationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Course> courses)? loadSuccess,
    TResult Function(Object error)? loadFailure,
    TResult Function(Object error)? operationFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseListInitial value) initial,
    required TResult Function(CourseListLoadInProgress value) loadInProgress,
    required TResult Function(CourseListLoadSuccess value) loadSuccess,
    required TResult Function(CourseListLoadFailure value) loadFailure,
    required TResult Function(CourseOperationFailure value) operationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseListInitial value)? initial,
    TResult? Function(CourseListLoadInProgress value)? loadInProgress,
    TResult? Function(CourseListLoadSuccess value)? loadSuccess,
    TResult? Function(CourseListLoadFailure value)? loadFailure,
    TResult? Function(CourseOperationFailure value)? operationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseListInitial value)? initial,
    TResult Function(CourseListLoadInProgress value)? loadInProgress,
    TResult Function(CourseListLoadSuccess value)? loadSuccess,
    TResult Function(CourseListLoadFailure value)? loadFailure,
    TResult Function(CourseOperationFailure value)? operationFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseListStateCopyWith<$Res> {
  factory $CourseListStateCopyWith(
          CourseListState value, $Res Function(CourseListState) then) =
      _$CourseListStateCopyWithImpl<$Res, CourseListState>;
}

/// @nodoc
class _$CourseListStateCopyWithImpl<$Res, $Val extends CourseListState>
    implements $CourseListStateCopyWith<$Res> {
  _$CourseListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CourseListInitialImplCopyWith<$Res> {
  factory _$$CourseListInitialImplCopyWith(_$CourseListInitialImpl value,
          $Res Function(_$CourseListInitialImpl) then) =
      __$$CourseListInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CourseListInitialImplCopyWithImpl<$Res>
    extends _$CourseListStateCopyWithImpl<$Res, _$CourseListInitialImpl>
    implements _$$CourseListInitialImplCopyWith<$Res> {
  __$$CourseListInitialImplCopyWithImpl(_$CourseListInitialImpl _value,
      $Res Function(_$CourseListInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CourseListInitialImpl implements CourseListInitial {
  const _$CourseListInitialImpl();

  @override
  String toString() {
    return 'CourseListState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CourseListInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Course> courses) loadSuccess,
    required TResult Function(Object error) loadFailure,
    required TResult Function(Object error) operationFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<Course> courses)? loadSuccess,
    TResult? Function(Object error)? loadFailure,
    TResult? Function(Object error)? operationFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Course> courses)? loadSuccess,
    TResult Function(Object error)? loadFailure,
    TResult Function(Object error)? operationFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseListInitial value) initial,
    required TResult Function(CourseListLoadInProgress value) loadInProgress,
    required TResult Function(CourseListLoadSuccess value) loadSuccess,
    required TResult Function(CourseListLoadFailure value) loadFailure,
    required TResult Function(CourseOperationFailure value) operationFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseListInitial value)? initial,
    TResult? Function(CourseListLoadInProgress value)? loadInProgress,
    TResult? Function(CourseListLoadSuccess value)? loadSuccess,
    TResult? Function(CourseListLoadFailure value)? loadFailure,
    TResult? Function(CourseOperationFailure value)? operationFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseListInitial value)? initial,
    TResult Function(CourseListLoadInProgress value)? loadInProgress,
    TResult Function(CourseListLoadSuccess value)? loadSuccess,
    TResult Function(CourseListLoadFailure value)? loadFailure,
    TResult Function(CourseOperationFailure value)? operationFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CourseListInitial implements CourseListState {
  const factory CourseListInitial() = _$CourseListInitialImpl;
}

/// @nodoc
abstract class _$$CourseListLoadInProgressImplCopyWith<$Res> {
  factory _$$CourseListLoadInProgressImplCopyWith(
          _$CourseListLoadInProgressImpl value,
          $Res Function(_$CourseListLoadInProgressImpl) then) =
      __$$CourseListLoadInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CourseListLoadInProgressImplCopyWithImpl<$Res>
    extends _$CourseListStateCopyWithImpl<$Res, _$CourseListLoadInProgressImpl>
    implements _$$CourseListLoadInProgressImplCopyWith<$Res> {
  __$$CourseListLoadInProgressImplCopyWithImpl(
      _$CourseListLoadInProgressImpl _value,
      $Res Function(_$CourseListLoadInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CourseListLoadInProgressImpl implements CourseListLoadInProgress {
  const _$CourseListLoadInProgressImpl();

  @override
  String toString() {
    return 'CourseListState.loadInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseListLoadInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Course> courses) loadSuccess,
    required TResult Function(Object error) loadFailure,
    required TResult Function(Object error) operationFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<Course> courses)? loadSuccess,
    TResult? Function(Object error)? loadFailure,
    TResult? Function(Object error)? operationFailure,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Course> courses)? loadSuccess,
    TResult Function(Object error)? loadFailure,
    TResult Function(Object error)? operationFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseListInitial value) initial,
    required TResult Function(CourseListLoadInProgress value) loadInProgress,
    required TResult Function(CourseListLoadSuccess value) loadSuccess,
    required TResult Function(CourseListLoadFailure value) loadFailure,
    required TResult Function(CourseOperationFailure value) operationFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseListInitial value)? initial,
    TResult? Function(CourseListLoadInProgress value)? loadInProgress,
    TResult? Function(CourseListLoadSuccess value)? loadSuccess,
    TResult? Function(CourseListLoadFailure value)? loadFailure,
    TResult? Function(CourseOperationFailure value)? operationFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseListInitial value)? initial,
    TResult Function(CourseListLoadInProgress value)? loadInProgress,
    TResult Function(CourseListLoadSuccess value)? loadSuccess,
    TResult Function(CourseListLoadFailure value)? loadFailure,
    TResult Function(CourseOperationFailure value)? operationFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class CourseListLoadInProgress implements CourseListState {
  const factory CourseListLoadInProgress() = _$CourseListLoadInProgressImpl;
}

/// @nodoc
abstract class _$$CourseListLoadSuccessImplCopyWith<$Res> {
  factory _$$CourseListLoadSuccessImplCopyWith(
          _$CourseListLoadSuccessImpl value,
          $Res Function(_$CourseListLoadSuccessImpl) then) =
      __$$CourseListLoadSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Course> courses});
}

/// @nodoc
class __$$CourseListLoadSuccessImplCopyWithImpl<$Res>
    extends _$CourseListStateCopyWithImpl<$Res, _$CourseListLoadSuccessImpl>
    implements _$$CourseListLoadSuccessImplCopyWith<$Res> {
  __$$CourseListLoadSuccessImplCopyWithImpl(_$CourseListLoadSuccessImpl _value,
      $Res Function(_$CourseListLoadSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courses = null,
  }) {
    return _then(_$CourseListLoadSuccessImpl(
      null == courses
          ? _value._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<Course>,
    ));
  }
}

/// @nodoc

class _$CourseListLoadSuccessImpl implements CourseListLoadSuccess {
  const _$CourseListLoadSuccessImpl(final List<Course> courses)
      : _courses = courses;

  final List<Course> _courses;
  @override
  List<Course> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  @override
  String toString() {
    return 'CourseListState.loadSuccess(courses: $courses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseListLoadSuccessImpl &&
            const DeepCollectionEquality().equals(other._courses, _courses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_courses));

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseListLoadSuccessImplCopyWith<_$CourseListLoadSuccessImpl>
      get copyWith => __$$CourseListLoadSuccessImplCopyWithImpl<
          _$CourseListLoadSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Course> courses) loadSuccess,
    required TResult Function(Object error) loadFailure,
    required TResult Function(Object error) operationFailure,
  }) {
    return loadSuccess(courses);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<Course> courses)? loadSuccess,
    TResult? Function(Object error)? loadFailure,
    TResult? Function(Object error)? operationFailure,
  }) {
    return loadSuccess?.call(courses);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Course> courses)? loadSuccess,
    TResult Function(Object error)? loadFailure,
    TResult Function(Object error)? operationFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(courses);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseListInitial value) initial,
    required TResult Function(CourseListLoadInProgress value) loadInProgress,
    required TResult Function(CourseListLoadSuccess value) loadSuccess,
    required TResult Function(CourseListLoadFailure value) loadFailure,
    required TResult Function(CourseOperationFailure value) operationFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseListInitial value)? initial,
    TResult? Function(CourseListLoadInProgress value)? loadInProgress,
    TResult? Function(CourseListLoadSuccess value)? loadSuccess,
    TResult? Function(CourseListLoadFailure value)? loadFailure,
    TResult? Function(CourseOperationFailure value)? operationFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseListInitial value)? initial,
    TResult Function(CourseListLoadInProgress value)? loadInProgress,
    TResult Function(CourseListLoadSuccess value)? loadSuccess,
    TResult Function(CourseListLoadFailure value)? loadFailure,
    TResult Function(CourseOperationFailure value)? operationFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class CourseListLoadSuccess implements CourseListState {
  const factory CourseListLoadSuccess(final List<Course> courses) =
      _$CourseListLoadSuccessImpl;

  List<Course> get courses;

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseListLoadSuccessImplCopyWith<_$CourseListLoadSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CourseListLoadFailureImplCopyWith<$Res> {
  factory _$$CourseListLoadFailureImplCopyWith(
          _$CourseListLoadFailureImpl value,
          $Res Function(_$CourseListLoadFailureImpl) then) =
      __$$CourseListLoadFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$CourseListLoadFailureImplCopyWithImpl<$Res>
    extends _$CourseListStateCopyWithImpl<$Res, _$CourseListLoadFailureImpl>
    implements _$$CourseListLoadFailureImplCopyWith<$Res> {
  __$$CourseListLoadFailureImplCopyWithImpl(_$CourseListLoadFailureImpl _value,
      $Res Function(_$CourseListLoadFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CourseListLoadFailureImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$CourseListLoadFailureImpl implements CourseListLoadFailure {
  const _$CourseListLoadFailureImpl(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'CourseListState.loadFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseListLoadFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseListLoadFailureImplCopyWith<_$CourseListLoadFailureImpl>
      get copyWith => __$$CourseListLoadFailureImplCopyWithImpl<
          _$CourseListLoadFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Course> courses) loadSuccess,
    required TResult Function(Object error) loadFailure,
    required TResult Function(Object error) operationFailure,
  }) {
    return loadFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<Course> courses)? loadSuccess,
    TResult? Function(Object error)? loadFailure,
    TResult? Function(Object error)? operationFailure,
  }) {
    return loadFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Course> courses)? loadSuccess,
    TResult Function(Object error)? loadFailure,
    TResult Function(Object error)? operationFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseListInitial value) initial,
    required TResult Function(CourseListLoadInProgress value) loadInProgress,
    required TResult Function(CourseListLoadSuccess value) loadSuccess,
    required TResult Function(CourseListLoadFailure value) loadFailure,
    required TResult Function(CourseOperationFailure value) operationFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseListInitial value)? initial,
    TResult? Function(CourseListLoadInProgress value)? loadInProgress,
    TResult? Function(CourseListLoadSuccess value)? loadSuccess,
    TResult? Function(CourseListLoadFailure value)? loadFailure,
    TResult? Function(CourseOperationFailure value)? operationFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseListInitial value)? initial,
    TResult Function(CourseListLoadInProgress value)? loadInProgress,
    TResult Function(CourseListLoadSuccess value)? loadSuccess,
    TResult Function(CourseListLoadFailure value)? loadFailure,
    TResult Function(CourseOperationFailure value)? operationFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class CourseListLoadFailure implements CourseListState {
  const factory CourseListLoadFailure(final Object error) =
      _$CourseListLoadFailureImpl;

  Object get error;

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseListLoadFailureImplCopyWith<_$CourseListLoadFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CourseOperationFailureImplCopyWith<$Res> {
  factory _$$CourseOperationFailureImplCopyWith(
          _$CourseOperationFailureImpl value,
          $Res Function(_$CourseOperationFailureImpl) then) =
      __$$CourseOperationFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$CourseOperationFailureImplCopyWithImpl<$Res>
    extends _$CourseListStateCopyWithImpl<$Res, _$CourseOperationFailureImpl>
    implements _$$CourseOperationFailureImplCopyWith<$Res> {
  __$$CourseOperationFailureImplCopyWithImpl(
      _$CourseOperationFailureImpl _value,
      $Res Function(_$CourseOperationFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CourseOperationFailureImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$CourseOperationFailureImpl implements CourseOperationFailure {
  const _$CourseOperationFailureImpl(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'CourseListState.operationFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseOperationFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseOperationFailureImplCopyWith<_$CourseOperationFailureImpl>
      get copyWith => __$$CourseOperationFailureImplCopyWithImpl<
          _$CourseOperationFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Course> courses) loadSuccess,
    required TResult Function(Object error) loadFailure,
    required TResult Function(Object error) operationFailure,
  }) {
    return operationFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<Course> courses)? loadSuccess,
    TResult? Function(Object error)? loadFailure,
    TResult? Function(Object error)? operationFailure,
  }) {
    return operationFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Course> courses)? loadSuccess,
    TResult Function(Object error)? loadFailure,
    TResult Function(Object error)? operationFailure,
    required TResult orElse(),
  }) {
    if (operationFailure != null) {
      return operationFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseListInitial value) initial,
    required TResult Function(CourseListLoadInProgress value) loadInProgress,
    required TResult Function(CourseListLoadSuccess value) loadSuccess,
    required TResult Function(CourseListLoadFailure value) loadFailure,
    required TResult Function(CourseOperationFailure value) operationFailure,
  }) {
    return operationFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseListInitial value)? initial,
    TResult? Function(CourseListLoadInProgress value)? loadInProgress,
    TResult? Function(CourseListLoadSuccess value)? loadSuccess,
    TResult? Function(CourseListLoadFailure value)? loadFailure,
    TResult? Function(CourseOperationFailure value)? operationFailure,
  }) {
    return operationFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseListInitial value)? initial,
    TResult Function(CourseListLoadInProgress value)? loadInProgress,
    TResult Function(CourseListLoadSuccess value)? loadSuccess,
    TResult Function(CourseListLoadFailure value)? loadFailure,
    TResult Function(CourseOperationFailure value)? operationFailure,
    required TResult orElse(),
  }) {
    if (operationFailure != null) {
      return operationFailure(this);
    }
    return orElse();
  }
}

abstract class CourseOperationFailure implements CourseListState {
  const factory CourseOperationFailure(final Object error) =
      _$CourseOperationFailureImpl;

  Object get error;

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseOperationFailureImplCopyWith<_$CourseOperationFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
