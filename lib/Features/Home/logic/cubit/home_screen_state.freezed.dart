// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeScreenState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeScreenState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeScreenState()';
}


}

/// @nodoc
class $HomeScreenStateCopyWith<$Res>  {
$HomeScreenStateCopyWith(HomeScreenState _, $Res Function(HomeScreenState) __);
}


/// Adds pattern-matching-related methods to [HomeScreenState].
extension HomeScreenStatePatterns on HomeScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  intial,TResult Function( ToursLoading value)?  toursLoading,TResult Function( ToursSuccess value)?  toursSuccess,TResult Function( ToursError value)?  toursError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when intial != null:
return intial(_that);case ToursLoading() when toursLoading != null:
return toursLoading(_that);case ToursSuccess() when toursSuccess != null:
return toursSuccess(_that);case ToursError() when toursError != null:
return toursError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  intial,required TResult Function( ToursLoading value)  toursLoading,required TResult Function( ToursSuccess value)  toursSuccess,required TResult Function( ToursError value)  toursError,}){
final _that = this;
switch (_that) {
case _Initial():
return intial(_that);case ToursLoading():
return toursLoading(_that);case ToursSuccess():
return toursSuccess(_that);case ToursError():
return toursError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  intial,TResult? Function( ToursLoading value)?  toursLoading,TResult? Function( ToursSuccess value)?  toursSuccess,TResult? Function( ToursError value)?  toursError,}){
final _that = this;
switch (_that) {
case _Initial() when intial != null:
return intial(_that);case ToursLoading() when toursLoading != null:
return toursLoading(_that);case ToursSuccess() when toursSuccess != null:
return toursSuccess(_that);case ToursError() when toursError != null:
return toursError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  intial,TResult Function()?  toursLoading,TResult Function( ToursResponse toursResponse)?  toursSuccess,TResult Function( String message)?  toursError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when intial != null:
return intial();case ToursLoading() when toursLoading != null:
return toursLoading();case ToursSuccess() when toursSuccess != null:
return toursSuccess(_that.toursResponse);case ToursError() when toursError != null:
return toursError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  intial,required TResult Function()  toursLoading,required TResult Function( ToursResponse toursResponse)  toursSuccess,required TResult Function( String message)  toursError,}) {final _that = this;
switch (_that) {
case _Initial():
return intial();case ToursLoading():
return toursLoading();case ToursSuccess():
return toursSuccess(_that.toursResponse);case ToursError():
return toursError(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  intial,TResult? Function()?  toursLoading,TResult? Function( ToursResponse toursResponse)?  toursSuccess,TResult? Function( String message)?  toursError,}) {final _that = this;
switch (_that) {
case _Initial() when intial != null:
return intial();case ToursLoading() when toursLoading != null:
return toursLoading();case ToursSuccess() when toursSuccess != null:
return toursSuccess(_that.toursResponse);case ToursError() when toursError != null:
return toursError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements HomeScreenState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeScreenState.intial()';
}


}




/// @nodoc


class ToursLoading implements HomeScreenState {
  const ToursLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToursLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeScreenState.toursLoading()';
}


}




/// @nodoc


class ToursSuccess implements HomeScreenState {
  const ToursSuccess(this.toursResponse);
  

 final  ToursResponse toursResponse;

/// Create a copy of HomeScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToursSuccessCopyWith<ToursSuccess> get copyWith => _$ToursSuccessCopyWithImpl<ToursSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToursSuccess&&(identical(other.toursResponse, toursResponse) || other.toursResponse == toursResponse));
}


@override
int get hashCode => Object.hash(runtimeType,toursResponse);

@override
String toString() {
  return 'HomeScreenState.toursSuccess(toursResponse: $toursResponse)';
}


}

/// @nodoc
abstract mixin class $ToursSuccessCopyWith<$Res> implements $HomeScreenStateCopyWith<$Res> {
  factory $ToursSuccessCopyWith(ToursSuccess value, $Res Function(ToursSuccess) _then) = _$ToursSuccessCopyWithImpl;
@useResult
$Res call({
 ToursResponse toursResponse
});




}
/// @nodoc
class _$ToursSuccessCopyWithImpl<$Res>
    implements $ToursSuccessCopyWith<$Res> {
  _$ToursSuccessCopyWithImpl(this._self, this._then);

  final ToursSuccess _self;
  final $Res Function(ToursSuccess) _then;

/// Create a copy of HomeScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? toursResponse = null,}) {
  return _then(ToursSuccess(
null == toursResponse ? _self.toursResponse : toursResponse // ignore: cast_nullable_to_non_nullable
as ToursResponse,
  ));
}


}

/// @nodoc


class ToursError implements HomeScreenState {
  const ToursError(this.message);
  

 final  String message;

/// Create a copy of HomeScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToursErrorCopyWith<ToursError> get copyWith => _$ToursErrorCopyWithImpl<ToursError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToursError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeScreenState.toursError(message: $message)';
}


}

/// @nodoc
abstract mixin class $ToursErrorCopyWith<$Res> implements $HomeScreenStateCopyWith<$Res> {
  factory $ToursErrorCopyWith(ToursError value, $Res Function(ToursError) _then) = _$ToursErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ToursErrorCopyWithImpl<$Res>
    implements $ToursErrorCopyWith<$Res> {
  _$ToursErrorCopyWithImpl(this._self, this._then);

  final ToursError _self;
  final $Res Function(ToursError) _then;

/// Create a copy of HomeScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ToursError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
