// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CourseListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(Course newCourse) create,
    required TResult Function(Course updatedCourse) update,
    required TResult Function(String courseId) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(Course newCourse)? create,
    TResult? Function(Course updatedCourse)? update,
    TResult? Function(String courseId)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(Course newCourse)? create,
    TResult Function(Course updatedCourse)? update,
    TResult Function(String courseId)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseListFetched value) fetch,
    required TResult Function(CourseCreated value) create,
    required TResult Function(CourseUpdated value) update,
    required TResult Function(CourseDeleted value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseListFetched value)? fetch,
    TResult? Function(CourseCreated value)? create,
    TResult? Function(CourseUpdated value)? update,
    TResult? Function(CourseDeleted value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseListFetched value)? fetch,
    TResult Function(CourseCreated value)? create,
    TResult Function(CourseUpdated value)? update,
    TResult Function(CourseDeleted value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseListEventCopyWith<$Res> {
  factory $CourseListEventCopyWith(
          CourseListEvent value, $Res Function(CourseListEvent) then) =
      _$CourseListEventCopyWithImpl<$Res, CourseListEvent>;
}

/// @nodoc
class _$CourseListEventCopyWithImpl<$Res, $Val extends CourseListEvent>
    implements $CourseListEventCopyWith<$Res> {
  _$CourseListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CourseListFetchedImplCopyWith<$Res> {
  factory _$$CourseListFetchedImplCopyWith(_$CourseListFetchedImpl value,
          $Res Function(_$CourseListFetchedImpl) then) =
      __$$CourseListFetchedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CourseListFetchedImplCopyWithImpl<$Res>
    extends _$CourseListEventCopyWithImpl<$Res, _$CourseListFetchedImpl>
    implements _$$CourseListFetchedImplCopyWith<$Res> {
  __$$CourseListFetchedImplCopyWithImpl(_$CourseListFetchedImpl _value,
      $Res Function(_$CourseListFetchedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CourseListFetchedImpl implements CourseListFetched {
  const _$CourseListFetchedImpl();

  @override
  String toString() {
    return 'CourseListEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CourseListFetchedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(Course newCourse) create,
    required TResult Function(Course updatedCourse) update,
    required TResult Function(String courseId) delete,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(Course newCourse)? create,
    TResult? Function(Course updatedCourse)? update,
    TResult? Function(String courseId)? delete,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(Course newCourse)? create,
    TResult Function(Course updatedCourse)? update,
    TResult Function(String courseId)? delete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseListFetched value) fetch,
    required TResult Function(CourseCreated value) create,
    required TResult Function(CourseUpdated value) update,
    required TResult Function(CourseDeleted value) delete,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseListFetched value)? fetch,
    TResult? Function(CourseCreated value)? create,
    TResult? Function(CourseUpdated value)? update,
    TResult? Function(CourseDeleted value)? delete,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseListFetched value)? fetch,
    TResult Function(CourseCreated value)? create,
    TResult Function(CourseUpdated value)? update,
    TResult Function(CourseDeleted value)? delete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class CourseListFetched implements CourseListEvent {
  const factory CourseListFetched() = _$CourseListFetchedImpl;
}

/// @nodoc
abstract class _$$CourseCreatedImplCopyWith<$Res> {
  factory _$$CourseCreatedImplCopyWith(
          _$CourseCreatedImpl value, $Res Function(_$CourseCreatedImpl) then) =
      __$$CourseCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Course newCourse});

  $CourseCopyWith<$Res> get newCourse;
}

/// @nodoc
class __$$CourseCreatedImplCopyWithImpl<$Res>
    extends _$CourseListEventCopyWithImpl<$Res, _$CourseCreatedImpl>
    implements _$$CourseCreatedImplCopyWith<$Res> {
  __$$CourseCreatedImplCopyWithImpl(
      _$CourseCreatedImpl _value, $Res Function(_$CourseCreatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newCourse = null,
  }) {
    return _then(_$CourseCreatedImpl(
      null == newCourse
          ? _value.newCourse
          : newCourse // ignore: cast_nullable_to_non_nullable
              as Course,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res> get newCourse {
    return $CourseCopyWith<$Res>(_value.newCourse, (value) {
      return _then(_value.copyWith(newCourse: value));
    });
  }
}

/// @nodoc

class _$CourseCreatedImpl implements CourseCreated {
  const _$CourseCreatedImpl(this.newCourse);

  @override
  final Course newCourse;

  @override
  String toString() {
    return 'CourseListEvent.create(newCourse: $newCourse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseCreatedImpl &&
            (identical(other.newCourse, newCourse) ||
                other.newCourse == newCourse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newCourse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseCreatedImplCopyWith<_$CourseCreatedImpl> get copyWith =>
      __$$CourseCreatedImplCopyWithImpl<_$CourseCreatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(Course newCourse) create,
    required TResult Function(Course updatedCourse) update,
    required TResult Function(String courseId) delete,
  }) {
    return create(newCourse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(Course newCourse)? create,
    TResult? Function(Course updatedCourse)? update,
    TResult? Function(String courseId)? delete,
  }) {
    return create?.call(newCourse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(Course newCourse)? create,
    TResult Function(Course updatedCourse)? update,
    TResult Function(String courseId)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(newCourse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseListFetched value) fetch,
    required TResult Function(CourseCreated value) create,
    required TResult Function(CourseUpdated value) update,
    required TResult Function(CourseDeleted value) delete,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseListFetched value)? fetch,
    TResult? Function(CourseCreated value)? create,
    TResult? Function(CourseUpdated value)? update,
    TResult? Function(CourseDeleted value)? delete,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseListFetched value)? fetch,
    TResult Function(CourseCreated value)? create,
    TResult Function(CourseUpdated value)? update,
    TResult Function(CourseDeleted value)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class CourseCreated implements CourseListEvent {
  const factory CourseCreated(final Course newCourse) = _$CourseCreatedImpl;

  Course get newCourse;
  @JsonKey(ignore: true)
  _$$CourseCreatedImplCopyWith<_$CourseCreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CourseUpdatedImplCopyWith<$Res> {
  factory _$$CourseUpdatedImplCopyWith(
          _$CourseUpdatedImpl value, $Res Function(_$CourseUpdatedImpl) then) =
      __$$CourseUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Course updatedCourse});

  $CourseCopyWith<$Res> get updatedCourse;
}

/// @nodoc
class __$$CourseUpdatedImplCopyWithImpl<$Res>
    extends _$CourseListEventCopyWithImpl<$Res, _$CourseUpdatedImpl>
    implements _$$CourseUpdatedImplCopyWith<$Res> {
  __$$CourseUpdatedImplCopyWithImpl(
      _$CourseUpdatedImpl _value, $Res Function(_$CourseUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedCourse = null,
  }) {
    return _then(_$CourseUpdatedImpl(
      null == updatedCourse
          ? _value.updatedCourse
          : updatedCourse // ignore: cast_nullable_to_non_nullable
              as Course,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res> get updatedCourse {
    return $CourseCopyWith<$Res>(_value.updatedCourse, (value) {
      return _then(_value.copyWith(updatedCourse: value));
    });
  }
}

/// @nodoc

class _$CourseUpdatedImpl implements CourseUpdated {
  const _$CourseUpdatedImpl(this.updatedCourse);

  @override
  final Course updatedCourse;

  @override
  String toString() {
    return 'CourseListEvent.update(updatedCourse: $updatedCourse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseUpdatedImpl &&
            (identical(other.updatedCourse, updatedCourse) ||
                other.updatedCourse == updatedCourse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updatedCourse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseUpdatedImplCopyWith<_$CourseUpdatedImpl> get copyWith =>
      __$$CourseUpdatedImplCopyWithImpl<_$CourseUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(Course newCourse) create,
    required TResult Function(Course updatedCourse) update,
    required TResult Function(String courseId) delete,
  }) {
    return update(updatedCourse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(Course newCourse)? create,
    TResult? Function(Course updatedCourse)? update,
    TResult? Function(String courseId)? delete,
  }) {
    return update?.call(updatedCourse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(Course newCourse)? create,
    TResult Function(Course updatedCourse)? update,
    TResult Function(String courseId)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(updatedCourse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseListFetched value) fetch,
    required TResult Function(CourseCreated value) create,
    required TResult Function(CourseUpdated value) update,
    required TResult Function(CourseDeleted value) delete,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseListFetched value)? fetch,
    TResult? Function(CourseCreated value)? create,
    TResult? Function(CourseUpdated value)? update,
    TResult? Function(CourseDeleted value)? delete,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseListFetched value)? fetch,
    TResult Function(CourseCreated value)? create,
    TResult Function(CourseUpdated value)? update,
    TResult Function(CourseDeleted value)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class CourseUpdated implements CourseListEvent {
  const factory CourseUpdated(final Course updatedCourse) = _$CourseUpdatedImpl;

  Course get updatedCourse;
  @JsonKey(ignore: true)
  _$$CourseUpdatedImplCopyWith<_$CourseUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CourseDeletedImplCopyWith<$Res> {
  factory _$$CourseDeletedImplCopyWith(
          _$CourseDeletedImpl value, $Res Function(_$CourseDeletedImpl) then) =
      __$$CourseDeletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String courseId});
}

/// @nodoc
class __$$CourseDeletedImplCopyWithImpl<$Res>
    extends _$CourseListEventCopyWithImpl<$Res, _$CourseDeletedImpl>
    implements _$$CourseDeletedImplCopyWith<$Res> {
  __$$CourseDeletedImplCopyWithImpl(
      _$CourseDeletedImpl _value, $Res Function(_$CourseDeletedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
  }) {
    return _then(_$CourseDeletedImpl(
      null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CourseDeletedImpl implements CourseDeleted {
  const _$CourseDeletedImpl(this.courseId);

  @override
  final String courseId;

  @override
  String toString() {
    return 'CourseListEvent.delete(courseId: $courseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDeletedImpl &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseDeletedImplCopyWith<_$CourseDeletedImpl> get copyWith =>
      __$$CourseDeletedImplCopyWithImpl<_$CourseDeletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(Course newCourse) create,
    required TResult Function(Course updatedCourse) update,
    required TResult Function(String courseId) delete,
  }) {
    return delete(courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(Course newCourse)? create,
    TResult? Function(Course updatedCourse)? update,
    TResult? Function(String courseId)? delete,
  }) {
    return delete?.call(courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(Course newCourse)? create,
    TResult Function(Course updatedCourse)? update,
    TResult Function(String courseId)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(courseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseListFetched value) fetch,
    required TResult Function(CourseCreated value) create,
    required TResult Function(CourseUpdated value) update,
    required TResult Function(CourseDeleted value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseListFetched value)? fetch,
    TResult? Function(CourseCreated value)? create,
    TResult? Function(CourseUpdated value)? update,
    TResult? Function(CourseDeleted value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseListFetched value)? fetch,
    TResult Function(CourseCreated value)? create,
    TResult Function(CourseUpdated value)? update,
    TResult Function(CourseDeleted value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class CourseDeleted implements CourseListEvent {
  const factory CourseDeleted(final String courseId) = _$CourseDeletedImpl;

  String get courseId;
  @JsonKey(ignore: true)
  _$$CourseDeletedImplCopyWith<_$CourseDeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
