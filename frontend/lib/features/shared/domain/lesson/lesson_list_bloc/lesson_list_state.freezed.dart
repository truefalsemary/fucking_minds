// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LessonListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Lesson> lessons) loadSuccess,
    required TResult Function(Object error) loadFailure,
    required TResult Function(Object error) operationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<Lesson> lessons)? loadSuccess,
    TResult? Function(Object error)? loadFailure,
    TResult? Function(Object error)? operationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Lesson> lessons)? loadSuccess,
    TResult Function(Object error)? loadFailure,
    TResult Function(Object error)? operationFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LessonListInitial value) initial,
    required TResult Function(LessonListLoadInProgress value) loadInProgress,
    required TResult Function(LessonListLoadSuccess value) loadSuccess,
    required TResult Function(LessonListLoadFailure value) loadFailure,
    required TResult Function(LessonOperationFailure value) operationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonListInitial value)? initial,
    TResult? Function(LessonListLoadInProgress value)? loadInProgress,
    TResult? Function(LessonListLoadSuccess value)? loadSuccess,
    TResult? Function(LessonListLoadFailure value)? loadFailure,
    TResult? Function(LessonOperationFailure value)? operationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonListInitial value)? initial,
    TResult Function(LessonListLoadInProgress value)? loadInProgress,
    TResult Function(LessonListLoadSuccess value)? loadSuccess,
    TResult Function(LessonListLoadFailure value)? loadFailure,
    TResult Function(LessonOperationFailure value)? operationFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonListStateCopyWith<$Res> {
  factory $LessonListStateCopyWith(
          LessonListState value, $Res Function(LessonListState) then) =
      _$LessonListStateCopyWithImpl<$Res, LessonListState>;
}

/// @nodoc
class _$LessonListStateCopyWithImpl<$Res, $Val extends LessonListState>
    implements $LessonListStateCopyWith<$Res> {
  _$LessonListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LessonListInitialImplCopyWith<$Res> {
  factory _$$LessonListInitialImplCopyWith(_$LessonListInitialImpl value,
          $Res Function(_$LessonListInitialImpl) then) =
      __$$LessonListInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LessonListInitialImplCopyWithImpl<$Res>
    extends _$LessonListStateCopyWithImpl<$Res, _$LessonListInitialImpl>
    implements _$$LessonListInitialImplCopyWith<$Res> {
  __$$LessonListInitialImplCopyWithImpl(_$LessonListInitialImpl _value,
      $Res Function(_$LessonListInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LessonListInitialImpl implements LessonListInitial {
  const _$LessonListInitialImpl();

  @override
  String toString() {
    return 'LessonListState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LessonListInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Lesson> lessons) loadSuccess,
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
    TResult? Function(List<Lesson> lessons)? loadSuccess,
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
    TResult Function(List<Lesson> lessons)? loadSuccess,
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
    required TResult Function(LessonListInitial value) initial,
    required TResult Function(LessonListLoadInProgress value) loadInProgress,
    required TResult Function(LessonListLoadSuccess value) loadSuccess,
    required TResult Function(LessonListLoadFailure value) loadFailure,
    required TResult Function(LessonOperationFailure value) operationFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonListInitial value)? initial,
    TResult? Function(LessonListLoadInProgress value)? loadInProgress,
    TResult? Function(LessonListLoadSuccess value)? loadSuccess,
    TResult? Function(LessonListLoadFailure value)? loadFailure,
    TResult? Function(LessonOperationFailure value)? operationFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonListInitial value)? initial,
    TResult Function(LessonListLoadInProgress value)? loadInProgress,
    TResult Function(LessonListLoadSuccess value)? loadSuccess,
    TResult Function(LessonListLoadFailure value)? loadFailure,
    TResult Function(LessonOperationFailure value)? operationFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LessonListInitial implements LessonListState {
  const factory LessonListInitial() = _$LessonListInitialImpl;
}

/// @nodoc
abstract class _$$LessonListLoadInProgressImplCopyWith<$Res> {
  factory _$$LessonListLoadInProgressImplCopyWith(
          _$LessonListLoadInProgressImpl value,
          $Res Function(_$LessonListLoadInProgressImpl) then) =
      __$$LessonListLoadInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LessonListLoadInProgressImplCopyWithImpl<$Res>
    extends _$LessonListStateCopyWithImpl<$Res, _$LessonListLoadInProgressImpl>
    implements _$$LessonListLoadInProgressImplCopyWith<$Res> {
  __$$LessonListLoadInProgressImplCopyWithImpl(
      _$LessonListLoadInProgressImpl _value,
      $Res Function(_$LessonListLoadInProgressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LessonListLoadInProgressImpl implements LessonListLoadInProgress {
  const _$LessonListLoadInProgressImpl();

  @override
  String toString() {
    return 'LessonListState.loadInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonListLoadInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Lesson> lessons) loadSuccess,
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
    TResult? Function(List<Lesson> lessons)? loadSuccess,
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
    TResult Function(List<Lesson> lessons)? loadSuccess,
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
    required TResult Function(LessonListInitial value) initial,
    required TResult Function(LessonListLoadInProgress value) loadInProgress,
    required TResult Function(LessonListLoadSuccess value) loadSuccess,
    required TResult Function(LessonListLoadFailure value) loadFailure,
    required TResult Function(LessonOperationFailure value) operationFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonListInitial value)? initial,
    TResult? Function(LessonListLoadInProgress value)? loadInProgress,
    TResult? Function(LessonListLoadSuccess value)? loadSuccess,
    TResult? Function(LessonListLoadFailure value)? loadFailure,
    TResult? Function(LessonOperationFailure value)? operationFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonListInitial value)? initial,
    TResult Function(LessonListLoadInProgress value)? loadInProgress,
    TResult Function(LessonListLoadSuccess value)? loadSuccess,
    TResult Function(LessonListLoadFailure value)? loadFailure,
    TResult Function(LessonOperationFailure value)? operationFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class LessonListLoadInProgress implements LessonListState {
  const factory LessonListLoadInProgress() = _$LessonListLoadInProgressImpl;
}

/// @nodoc
abstract class _$$LessonListLoadSuccessImplCopyWith<$Res> {
  factory _$$LessonListLoadSuccessImplCopyWith(
          _$LessonListLoadSuccessImpl value,
          $Res Function(_$LessonListLoadSuccessImpl) then) =
      __$$LessonListLoadSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Lesson> lessons});
}

/// @nodoc
class __$$LessonListLoadSuccessImplCopyWithImpl<$Res>
    extends _$LessonListStateCopyWithImpl<$Res, _$LessonListLoadSuccessImpl>
    implements _$$LessonListLoadSuccessImplCopyWith<$Res> {
  __$$LessonListLoadSuccessImplCopyWithImpl(_$LessonListLoadSuccessImpl _value,
      $Res Function(_$LessonListLoadSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessons = null,
  }) {
    return _then(_$LessonListLoadSuccessImpl(
      null == lessons
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
    ));
  }
}

/// @nodoc

class _$LessonListLoadSuccessImpl implements LessonListLoadSuccess {
  const _$LessonListLoadSuccessImpl(final List<Lesson> lessons)
      : _lessons = lessons;

  final List<Lesson> _lessons;
  @override
  List<Lesson> get lessons {
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessons);
  }

  @override
  String toString() {
    return 'LessonListState.loadSuccess(lessons: $lessons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonListLoadSuccessImpl &&
            const DeepCollectionEquality().equals(other._lessons, _lessons));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_lessons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonListLoadSuccessImplCopyWith<_$LessonListLoadSuccessImpl>
      get copyWith => __$$LessonListLoadSuccessImplCopyWithImpl<
          _$LessonListLoadSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Lesson> lessons) loadSuccess,
    required TResult Function(Object error) loadFailure,
    required TResult Function(Object error) operationFailure,
  }) {
    return loadSuccess(lessons);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<Lesson> lessons)? loadSuccess,
    TResult? Function(Object error)? loadFailure,
    TResult? Function(Object error)? operationFailure,
  }) {
    return loadSuccess?.call(lessons);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Lesson> lessons)? loadSuccess,
    TResult Function(Object error)? loadFailure,
    TResult Function(Object error)? operationFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(lessons);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LessonListInitial value) initial,
    required TResult Function(LessonListLoadInProgress value) loadInProgress,
    required TResult Function(LessonListLoadSuccess value) loadSuccess,
    required TResult Function(LessonListLoadFailure value) loadFailure,
    required TResult Function(LessonOperationFailure value) operationFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonListInitial value)? initial,
    TResult? Function(LessonListLoadInProgress value)? loadInProgress,
    TResult? Function(LessonListLoadSuccess value)? loadSuccess,
    TResult? Function(LessonListLoadFailure value)? loadFailure,
    TResult? Function(LessonOperationFailure value)? operationFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonListInitial value)? initial,
    TResult Function(LessonListLoadInProgress value)? loadInProgress,
    TResult Function(LessonListLoadSuccess value)? loadSuccess,
    TResult Function(LessonListLoadFailure value)? loadFailure,
    TResult Function(LessonOperationFailure value)? operationFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class LessonListLoadSuccess implements LessonListState {
  const factory LessonListLoadSuccess(final List<Lesson> lessons) =
      _$LessonListLoadSuccessImpl;

  List<Lesson> get lessons;
  @JsonKey(ignore: true)
  _$$LessonListLoadSuccessImplCopyWith<_$LessonListLoadSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LessonListLoadFailureImplCopyWith<$Res> {
  factory _$$LessonListLoadFailureImplCopyWith(
          _$LessonListLoadFailureImpl value,
          $Res Function(_$LessonListLoadFailureImpl) then) =
      __$$LessonListLoadFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$LessonListLoadFailureImplCopyWithImpl<$Res>
    extends _$LessonListStateCopyWithImpl<$Res, _$LessonListLoadFailureImpl>
    implements _$$LessonListLoadFailureImplCopyWith<$Res> {
  __$$LessonListLoadFailureImplCopyWithImpl(_$LessonListLoadFailureImpl _value,
      $Res Function(_$LessonListLoadFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$LessonListLoadFailureImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$LessonListLoadFailureImpl implements LessonListLoadFailure {
  const _$LessonListLoadFailureImpl(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'LessonListState.loadFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonListLoadFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonListLoadFailureImplCopyWith<_$LessonListLoadFailureImpl>
      get copyWith => __$$LessonListLoadFailureImplCopyWithImpl<
          _$LessonListLoadFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Lesson> lessons) loadSuccess,
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
    TResult? Function(List<Lesson> lessons)? loadSuccess,
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
    TResult Function(List<Lesson> lessons)? loadSuccess,
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
    required TResult Function(LessonListInitial value) initial,
    required TResult Function(LessonListLoadInProgress value) loadInProgress,
    required TResult Function(LessonListLoadSuccess value) loadSuccess,
    required TResult Function(LessonListLoadFailure value) loadFailure,
    required TResult Function(LessonOperationFailure value) operationFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonListInitial value)? initial,
    TResult? Function(LessonListLoadInProgress value)? loadInProgress,
    TResult? Function(LessonListLoadSuccess value)? loadSuccess,
    TResult? Function(LessonListLoadFailure value)? loadFailure,
    TResult? Function(LessonOperationFailure value)? operationFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonListInitial value)? initial,
    TResult Function(LessonListLoadInProgress value)? loadInProgress,
    TResult Function(LessonListLoadSuccess value)? loadSuccess,
    TResult Function(LessonListLoadFailure value)? loadFailure,
    TResult Function(LessonOperationFailure value)? operationFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class LessonListLoadFailure implements LessonListState {
  const factory LessonListLoadFailure(final Object error) =
      _$LessonListLoadFailureImpl;

  Object get error;
  @JsonKey(ignore: true)
  _$$LessonListLoadFailureImplCopyWith<_$LessonListLoadFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LessonOperationFailureImplCopyWith<$Res> {
  factory _$$LessonOperationFailureImplCopyWith(
          _$LessonOperationFailureImpl value,
          $Res Function(_$LessonOperationFailureImpl) then) =
      __$$LessonOperationFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$LessonOperationFailureImplCopyWithImpl<$Res>
    extends _$LessonListStateCopyWithImpl<$Res, _$LessonOperationFailureImpl>
    implements _$$LessonOperationFailureImplCopyWith<$Res> {
  __$$LessonOperationFailureImplCopyWithImpl(
      _$LessonOperationFailureImpl _value,
      $Res Function(_$LessonOperationFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$LessonOperationFailureImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$LessonOperationFailureImpl implements LessonOperationFailure {
  const _$LessonOperationFailureImpl(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'LessonListState.operationFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonOperationFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonOperationFailureImplCopyWith<_$LessonOperationFailureImpl>
      get copyWith => __$$LessonOperationFailureImplCopyWithImpl<
          _$LessonOperationFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Lesson> lessons) loadSuccess,
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
    TResult? Function(List<Lesson> lessons)? loadSuccess,
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
    TResult Function(List<Lesson> lessons)? loadSuccess,
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
    required TResult Function(LessonListInitial value) initial,
    required TResult Function(LessonListLoadInProgress value) loadInProgress,
    required TResult Function(LessonListLoadSuccess value) loadSuccess,
    required TResult Function(LessonListLoadFailure value) loadFailure,
    required TResult Function(LessonOperationFailure value) operationFailure,
  }) {
    return operationFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LessonListInitial value)? initial,
    TResult? Function(LessonListLoadInProgress value)? loadInProgress,
    TResult? Function(LessonListLoadSuccess value)? loadSuccess,
    TResult? Function(LessonListLoadFailure value)? loadFailure,
    TResult? Function(LessonOperationFailure value)? operationFailure,
  }) {
    return operationFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonListInitial value)? initial,
    TResult Function(LessonListLoadInProgress value)? loadInProgress,
    TResult Function(LessonListLoadSuccess value)? loadSuccess,
    TResult Function(LessonListLoadFailure value)? loadFailure,
    TResult Function(LessonOperationFailure value)? operationFailure,
    required TResult orElse(),
  }) {
    if (operationFailure != null) {
      return operationFailure(this);
    }
    return orElse();
  }
}

abstract class LessonOperationFailure implements LessonListState {
  const factory LessonOperationFailure(final Object error) =
      _$LessonOperationFailureImpl;

  Object get error;
  @JsonKey(ignore: true)
  _$$LessonOperationFailureImplCopyWith<_$LessonOperationFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
