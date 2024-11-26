// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid) success,
    required TResult Function(String error) error,
    required TResult Function(String error) exception,
    required TResult Function() togglePasswordVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid)? success,
    TResult? Function(String error)? error,
    TResult? Function(String error)? exception,
    TResult? Function()? togglePasswordVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid)? success,
    TResult Function(String error)? error,
    TResult Function(String error)? exception,
    TResult Function()? togglePasswordVisibility,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitialState value) initial,
    required TResult Function(SignInLoadingState value) loading,
    required TResult Function(SignInSuccessState value) success,
    required TResult Function(SignInErrorState value) error,
    required TResult Function(SignInExceptionState value) exception,
    required TResult Function(TogglePasswordVisibilityState value)
        togglePasswordVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInInitialState value)? initial,
    TResult? Function(SignInLoadingState value)? loading,
    TResult? Function(SignInSuccessState value)? success,
    TResult? Function(SignInErrorState value)? error,
    TResult? Function(SignInExceptionState value)? exception,
    TResult? Function(TogglePasswordVisibilityState value)?
        togglePasswordVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitialState value)? initial,
    TResult Function(SignInLoadingState value)? loading,
    TResult Function(SignInSuccessState value)? success,
    TResult Function(SignInErrorState value)? error,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(TogglePasswordVisibilityState value)?
        togglePasswordVisibility,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStatesCopyWith<$Res> {
  factory $SignInStatesCopyWith(
          SignInStates value, $Res Function(SignInStates) then) =
      _$SignInStatesCopyWithImpl<$Res, SignInStates>;
}

/// @nodoc
class _$SignInStatesCopyWithImpl<$Res, $Val extends SignInStates>
    implements $SignInStatesCopyWith<$Res> {
  _$SignInStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SignInInitialStateImplCopyWith<$Res> {
  factory _$$SignInInitialStateImplCopyWith(_$SignInInitialStateImpl value,
          $Res Function(_$SignInInitialStateImpl) then) =
      __$$SignInInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInInitialStateImplCopyWithImpl<$Res>
    extends _$SignInStatesCopyWithImpl<$Res, _$SignInInitialStateImpl>
    implements _$$SignInInitialStateImplCopyWith<$Res> {
  __$$SignInInitialStateImplCopyWithImpl(_$SignInInitialStateImpl _value,
      $Res Function(_$SignInInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignInInitialStateImpl implements SignInInitialState {
  const _$SignInInitialStateImpl();

  @override
  String toString() {
    return 'SignInStates.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid) success,
    required TResult Function(String error) error,
    required TResult Function(String error) exception,
    required TResult Function() togglePasswordVisibility,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid)? success,
    TResult? Function(String error)? error,
    TResult? Function(String error)? exception,
    TResult? Function()? togglePasswordVisibility,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid)? success,
    TResult Function(String error)? error,
    TResult Function(String error)? exception,
    TResult Function()? togglePasswordVisibility,
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
    required TResult Function(SignInInitialState value) initial,
    required TResult Function(SignInLoadingState value) loading,
    required TResult Function(SignInSuccessState value) success,
    required TResult Function(SignInErrorState value) error,
    required TResult Function(SignInExceptionState value) exception,
    required TResult Function(TogglePasswordVisibilityState value)
        togglePasswordVisibility,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInInitialState value)? initial,
    TResult? Function(SignInLoadingState value)? loading,
    TResult? Function(SignInSuccessState value)? success,
    TResult? Function(SignInErrorState value)? error,
    TResult? Function(SignInExceptionState value)? exception,
    TResult? Function(TogglePasswordVisibilityState value)?
        togglePasswordVisibility,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitialState value)? initial,
    TResult Function(SignInLoadingState value)? loading,
    TResult Function(SignInSuccessState value)? success,
    TResult Function(SignInErrorState value)? error,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(TogglePasswordVisibilityState value)?
        togglePasswordVisibility,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SignInInitialState implements SignInStates {
  const factory SignInInitialState() = _$SignInInitialStateImpl;
}

/// @nodoc
abstract class _$$SignInLoadingStateImplCopyWith<$Res> {
  factory _$$SignInLoadingStateImplCopyWith(_$SignInLoadingStateImpl value,
          $Res Function(_$SignInLoadingStateImpl) then) =
      __$$SignInLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInLoadingStateImplCopyWithImpl<$Res>
    extends _$SignInStatesCopyWithImpl<$Res, _$SignInLoadingStateImpl>
    implements _$$SignInLoadingStateImplCopyWith<$Res> {
  __$$SignInLoadingStateImplCopyWithImpl(_$SignInLoadingStateImpl _value,
      $Res Function(_$SignInLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignInLoadingStateImpl implements SignInLoadingState {
  const _$SignInLoadingStateImpl();

  @override
  String toString() {
    return 'SignInStates.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid) success,
    required TResult Function(String error) error,
    required TResult Function(String error) exception,
    required TResult Function() togglePasswordVisibility,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid)? success,
    TResult? Function(String error)? error,
    TResult? Function(String error)? exception,
    TResult? Function()? togglePasswordVisibility,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid)? success,
    TResult Function(String error)? error,
    TResult Function(String error)? exception,
    TResult Function()? togglePasswordVisibility,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitialState value) initial,
    required TResult Function(SignInLoadingState value) loading,
    required TResult Function(SignInSuccessState value) success,
    required TResult Function(SignInErrorState value) error,
    required TResult Function(SignInExceptionState value) exception,
    required TResult Function(TogglePasswordVisibilityState value)
        togglePasswordVisibility,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInInitialState value)? initial,
    TResult? Function(SignInLoadingState value)? loading,
    TResult? Function(SignInSuccessState value)? success,
    TResult? Function(SignInErrorState value)? error,
    TResult? Function(SignInExceptionState value)? exception,
    TResult? Function(TogglePasswordVisibilityState value)?
        togglePasswordVisibility,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitialState value)? initial,
    TResult Function(SignInLoadingState value)? loading,
    TResult Function(SignInSuccessState value)? success,
    TResult Function(SignInErrorState value)? error,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(TogglePasswordVisibilityState value)?
        togglePasswordVisibility,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SignInLoadingState implements SignInStates {
  const factory SignInLoadingState() = _$SignInLoadingStateImpl;
}

/// @nodoc
abstract class _$$SignInSuccessStateImplCopyWith<$Res> {
  factory _$$SignInSuccessStateImplCopyWith(_$SignInSuccessStateImpl value,
          $Res Function(_$SignInSuccessStateImpl) then) =
      __$$SignInSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$SignInSuccessStateImplCopyWithImpl<$Res>
    extends _$SignInStatesCopyWithImpl<$Res, _$SignInSuccessStateImpl>
    implements _$$SignInSuccessStateImplCopyWith<$Res> {
  __$$SignInSuccessStateImplCopyWithImpl(_$SignInSuccessStateImpl _value,
      $Res Function(_$SignInSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$SignInSuccessStateImpl(
      null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInSuccessStateImpl implements SignInSuccessState {
  const _$SignInSuccessStateImpl(this.uid);

  @override
  final String uid;

  @override
  String toString() {
    return 'SignInStates.success(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInSuccessStateImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  /// Create a copy of SignInStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInSuccessStateImplCopyWith<_$SignInSuccessStateImpl> get copyWith =>
      __$$SignInSuccessStateImplCopyWithImpl<_$SignInSuccessStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid) success,
    required TResult Function(String error) error,
    required TResult Function(String error) exception,
    required TResult Function() togglePasswordVisibility,
  }) {
    return success(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid)? success,
    TResult? Function(String error)? error,
    TResult? Function(String error)? exception,
    TResult? Function()? togglePasswordVisibility,
  }) {
    return success?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid)? success,
    TResult Function(String error)? error,
    TResult Function(String error)? exception,
    TResult Function()? togglePasswordVisibility,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitialState value) initial,
    required TResult Function(SignInLoadingState value) loading,
    required TResult Function(SignInSuccessState value) success,
    required TResult Function(SignInErrorState value) error,
    required TResult Function(SignInExceptionState value) exception,
    required TResult Function(TogglePasswordVisibilityState value)
        togglePasswordVisibility,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInInitialState value)? initial,
    TResult? Function(SignInLoadingState value)? loading,
    TResult? Function(SignInSuccessState value)? success,
    TResult? Function(SignInErrorState value)? error,
    TResult? Function(SignInExceptionState value)? exception,
    TResult? Function(TogglePasswordVisibilityState value)?
        togglePasswordVisibility,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitialState value)? initial,
    TResult Function(SignInLoadingState value)? loading,
    TResult Function(SignInSuccessState value)? success,
    TResult Function(SignInErrorState value)? error,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(TogglePasswordVisibilityState value)?
        togglePasswordVisibility,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SignInSuccessState implements SignInStates {
  const factory SignInSuccessState(final String uid) = _$SignInSuccessStateImpl;

  String get uid;

  /// Create a copy of SignInStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInSuccessStateImplCopyWith<_$SignInSuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInErrorStateImplCopyWith<$Res> {
  factory _$$SignInErrorStateImplCopyWith(_$SignInErrorStateImpl value,
          $Res Function(_$SignInErrorStateImpl) then) =
      __$$SignInErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$SignInErrorStateImplCopyWithImpl<$Res>
    extends _$SignInStatesCopyWithImpl<$Res, _$SignInErrorStateImpl>
    implements _$$SignInErrorStateImplCopyWith<$Res> {
  __$$SignInErrorStateImplCopyWithImpl(_$SignInErrorStateImpl _value,
      $Res Function(_$SignInErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SignInErrorStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInErrorStateImpl implements SignInErrorState {
  const _$SignInErrorStateImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'SignInStates.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of SignInStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInErrorStateImplCopyWith<_$SignInErrorStateImpl> get copyWith =>
      __$$SignInErrorStateImplCopyWithImpl<_$SignInErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid) success,
    required TResult Function(String error) error,
    required TResult Function(String error) exception,
    required TResult Function() togglePasswordVisibility,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid)? success,
    TResult? Function(String error)? error,
    TResult? Function(String error)? exception,
    TResult? Function()? togglePasswordVisibility,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid)? success,
    TResult Function(String error)? error,
    TResult Function(String error)? exception,
    TResult Function()? togglePasswordVisibility,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitialState value) initial,
    required TResult Function(SignInLoadingState value) loading,
    required TResult Function(SignInSuccessState value) success,
    required TResult Function(SignInErrorState value) error,
    required TResult Function(SignInExceptionState value) exception,
    required TResult Function(TogglePasswordVisibilityState value)
        togglePasswordVisibility,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInInitialState value)? initial,
    TResult? Function(SignInLoadingState value)? loading,
    TResult? Function(SignInSuccessState value)? success,
    TResult? Function(SignInErrorState value)? error,
    TResult? Function(SignInExceptionState value)? exception,
    TResult? Function(TogglePasswordVisibilityState value)?
        togglePasswordVisibility,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitialState value)? initial,
    TResult Function(SignInLoadingState value)? loading,
    TResult Function(SignInSuccessState value)? success,
    TResult Function(SignInErrorState value)? error,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(TogglePasswordVisibilityState value)?
        togglePasswordVisibility,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SignInErrorState implements SignInStates {
  const factory SignInErrorState(final String error) = _$SignInErrorStateImpl;

  String get error;

  /// Create a copy of SignInStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInErrorStateImplCopyWith<_$SignInErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInExceptionStateImplCopyWith<$Res> {
  factory _$$SignInExceptionStateImplCopyWith(_$SignInExceptionStateImpl value,
          $Res Function(_$SignInExceptionStateImpl) then) =
      __$$SignInExceptionStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$SignInExceptionStateImplCopyWithImpl<$Res>
    extends _$SignInStatesCopyWithImpl<$Res, _$SignInExceptionStateImpl>
    implements _$$SignInExceptionStateImplCopyWith<$Res> {
  __$$SignInExceptionStateImplCopyWithImpl(_$SignInExceptionStateImpl _value,
      $Res Function(_$SignInExceptionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SignInExceptionStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInExceptionStateImpl implements SignInExceptionState {
  const _$SignInExceptionStateImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'SignInStates.exception(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInExceptionStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of SignInStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInExceptionStateImplCopyWith<_$SignInExceptionStateImpl>
      get copyWith =>
          __$$SignInExceptionStateImplCopyWithImpl<_$SignInExceptionStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid) success,
    required TResult Function(String error) error,
    required TResult Function(String error) exception,
    required TResult Function() togglePasswordVisibility,
  }) {
    return exception(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid)? success,
    TResult? Function(String error)? error,
    TResult? Function(String error)? exception,
    TResult? Function()? togglePasswordVisibility,
  }) {
    return exception?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid)? success,
    TResult Function(String error)? error,
    TResult Function(String error)? exception,
    TResult Function()? togglePasswordVisibility,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitialState value) initial,
    required TResult Function(SignInLoadingState value) loading,
    required TResult Function(SignInSuccessState value) success,
    required TResult Function(SignInErrorState value) error,
    required TResult Function(SignInExceptionState value) exception,
    required TResult Function(TogglePasswordVisibilityState value)
        togglePasswordVisibility,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInInitialState value)? initial,
    TResult? Function(SignInLoadingState value)? loading,
    TResult? Function(SignInSuccessState value)? success,
    TResult? Function(SignInErrorState value)? error,
    TResult? Function(SignInExceptionState value)? exception,
    TResult? Function(TogglePasswordVisibilityState value)?
        togglePasswordVisibility,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitialState value)? initial,
    TResult Function(SignInLoadingState value)? loading,
    TResult Function(SignInSuccessState value)? success,
    TResult Function(SignInErrorState value)? error,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(TogglePasswordVisibilityState value)?
        togglePasswordVisibility,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class SignInExceptionState implements SignInStates {
  const factory SignInExceptionState(final String error) =
      _$SignInExceptionStateImpl;

  String get error;

  /// Create a copy of SignInStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInExceptionStateImplCopyWith<_$SignInExceptionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TogglePasswordVisibilityStateImplCopyWith<$Res> {
  factory _$$TogglePasswordVisibilityStateImplCopyWith(
          _$TogglePasswordVisibilityStateImpl value,
          $Res Function(_$TogglePasswordVisibilityStateImpl) then) =
      __$$TogglePasswordVisibilityStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TogglePasswordVisibilityStateImplCopyWithImpl<$Res>
    extends _$SignInStatesCopyWithImpl<$Res,
        _$TogglePasswordVisibilityStateImpl>
    implements _$$TogglePasswordVisibilityStateImplCopyWith<$Res> {
  __$$TogglePasswordVisibilityStateImplCopyWithImpl(
      _$TogglePasswordVisibilityStateImpl _value,
      $Res Function(_$TogglePasswordVisibilityStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TogglePasswordVisibilityStateImpl
    implements TogglePasswordVisibilityState {
  const _$TogglePasswordVisibilityStateImpl();

  @override
  String toString() {
    return 'SignInStates.togglePasswordVisibility()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TogglePasswordVisibilityStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid) success,
    required TResult Function(String error) error,
    required TResult Function(String error) exception,
    required TResult Function() togglePasswordVisibility,
  }) {
    return togglePasswordVisibility();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid)? success,
    TResult? Function(String error)? error,
    TResult? Function(String error)? exception,
    TResult? Function()? togglePasswordVisibility,
  }) {
    return togglePasswordVisibility?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid)? success,
    TResult Function(String error)? error,
    TResult Function(String error)? exception,
    TResult Function()? togglePasswordVisibility,
    required TResult orElse(),
  }) {
    if (togglePasswordVisibility != null) {
      return togglePasswordVisibility();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitialState value) initial,
    required TResult Function(SignInLoadingState value) loading,
    required TResult Function(SignInSuccessState value) success,
    required TResult Function(SignInErrorState value) error,
    required TResult Function(SignInExceptionState value) exception,
    required TResult Function(TogglePasswordVisibilityState value)
        togglePasswordVisibility,
  }) {
    return togglePasswordVisibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInInitialState value)? initial,
    TResult? Function(SignInLoadingState value)? loading,
    TResult? Function(SignInSuccessState value)? success,
    TResult? Function(SignInErrorState value)? error,
    TResult? Function(SignInExceptionState value)? exception,
    TResult? Function(TogglePasswordVisibilityState value)?
        togglePasswordVisibility,
  }) {
    return togglePasswordVisibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitialState value)? initial,
    TResult Function(SignInLoadingState value)? loading,
    TResult Function(SignInSuccessState value)? success,
    TResult Function(SignInErrorState value)? error,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(TogglePasswordVisibilityState value)?
        togglePasswordVisibility,
    required TResult orElse(),
  }) {
    if (togglePasswordVisibility != null) {
      return togglePasswordVisibility(this);
    }
    return orElse();
  }
}

abstract class TogglePasswordVisibilityState implements SignInStates {
  const factory TogglePasswordVisibilityState() =
      _$TogglePasswordVisibilityStateImpl;
}
