// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserResponseState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserResponseState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserResponseState()';
}


}

/// @nodoc
class $UserResponseStateCopyWith<$Res>  {
$UserResponseStateCopyWith(UserResponseState _, $Res Function(UserResponseState) __);
}


/// Adds pattern-matching-related methods to [UserResponseState].
extension UserResponseStatePatterns on UserResponseState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( UserLoading value)?  userLoading,TResult Function( UserSuccess value)?  userSuccess,TResult Function( UserError value)?  userError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case UserLoading() when userLoading != null:
return userLoading(_that);case UserSuccess() when userSuccess != null:
return userSuccess(_that);case UserError() when userError != null:
return userError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( UserLoading value)  userLoading,required TResult Function( UserSuccess value)  userSuccess,required TResult Function( UserError value)  userError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case UserLoading():
return userLoading(_that);case UserSuccess():
return userSuccess(_that);case UserError():
return userError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( UserLoading value)?  userLoading,TResult? Function( UserSuccess value)?  userSuccess,TResult? Function( UserError value)?  userError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case UserLoading() when userLoading != null:
return userLoading(_that);case UserSuccess() when userSuccess != null:
return userSuccess(_that);case UserError() when userError != null:
return userError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  userLoading,TResult Function( UserResponseModel user)?  userSuccess,TResult Function( String message)?  userError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case UserLoading() when userLoading != null:
return userLoading();case UserSuccess() when userSuccess != null:
return userSuccess(_that.user);case UserError() when userError != null:
return userError(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  userLoading,required TResult Function( UserResponseModel user)  userSuccess,required TResult Function( String message)  userError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case UserLoading():
return userLoading();case UserSuccess():
return userSuccess(_that.user);case UserError():
return userError(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  userLoading,TResult? Function( UserResponseModel user)?  userSuccess,TResult? Function( String message)?  userError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case UserLoading() when userLoading != null:
return userLoading();case UserSuccess() when userSuccess != null:
return userSuccess(_that.user);case UserError() when userError != null:
return userError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements UserResponseState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserResponseState.initial()';
}


}




/// @nodoc


class UserLoading implements UserResponseState {
  const UserLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserResponseState.userLoading()';
}


}




/// @nodoc


class UserSuccess implements UserResponseState {
  const UserSuccess(this.user);
  

 final  UserResponseModel user;

/// Create a copy of UserResponseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSuccessCopyWith<UserSuccess> get copyWith => _$UserSuccessCopyWithImpl<UserSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSuccess&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserResponseState.userSuccess(user: $user)';
}


}

/// @nodoc
abstract mixin class $UserSuccessCopyWith<$Res> implements $UserResponseStateCopyWith<$Res> {
  factory $UserSuccessCopyWith(UserSuccess value, $Res Function(UserSuccess) _then) = _$UserSuccessCopyWithImpl;
@useResult
$Res call({
 UserResponseModel user
});




}
/// @nodoc
class _$UserSuccessCopyWithImpl<$Res>
    implements $UserSuccessCopyWith<$Res> {
  _$UserSuccessCopyWithImpl(this._self, this._then);

  final UserSuccess _self;
  final $Res Function(UserSuccess) _then;

/// Create a copy of UserResponseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(UserSuccess(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserResponseModel,
  ));
}


}

/// @nodoc


class UserError implements UserResponseState {
  const UserError(this.message);
  

 final  String message;

/// Create a copy of UserResponseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserErrorCopyWith<UserError> get copyWith => _$UserErrorCopyWithImpl<UserError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UserResponseState.userError(message: $message)';
}


}

/// @nodoc
abstract mixin class $UserErrorCopyWith<$Res> implements $UserResponseStateCopyWith<$Res> {
  factory $UserErrorCopyWith(UserError value, $Res Function(UserError) _then) = _$UserErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UserErrorCopyWithImpl<$Res>
    implements $UserErrorCopyWith<$Res> {
  _$UserErrorCopyWithImpl(this._self, this._then);

  final UserError _self;
  final $Res Function(UserError) _then;

/// Create a copy of UserResponseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UserError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
