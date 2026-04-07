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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  intial,TResult Function( ToursLoading value)?  toursLoading,TResult Function( Loaded value)?  toursLoaded,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when intial != null:
return intial(_that);case ToursLoading() when toursLoading != null:
return toursLoading(_that);case Loaded() when toursLoaded != null:
return toursLoaded(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  intial,required TResult Function( ToursLoading value)  toursLoading,required TResult Function( Loaded value)  toursLoaded,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return intial(_that);case ToursLoading():
return toursLoading(_that);case Loaded():
return toursLoaded(_that);case Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  intial,TResult? Function( ToursLoading value)?  toursLoading,TResult? Function( Loaded value)?  toursLoaded,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when intial != null:
return intial(_that);case ToursLoading() when toursLoading != null:
return toursLoading(_that);case Loaded() when toursLoaded != null:
return toursLoaded(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  intial,TResult Function()?  toursLoading,TResult Function( ToursResponse toursResponse,  bool isFromCache,  bool refreshing,  String? refreshErrorMessage)?  toursLoaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when intial != null:
return intial();case ToursLoading() when toursLoading != null:
return toursLoading();case Loaded() when toursLoaded != null:
return toursLoaded(_that.toursResponse,_that.isFromCache,_that.refreshing,_that.refreshErrorMessage);case Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  intial,required TResult Function()  toursLoading,required TResult Function( ToursResponse toursResponse,  bool isFromCache,  bool refreshing,  String? refreshErrorMessage)  toursLoaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return intial();case ToursLoading():
return toursLoading();case Loaded():
return toursLoaded(_that.toursResponse,_that.isFromCache,_that.refreshing,_that.refreshErrorMessage);case Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  intial,TResult? Function()?  toursLoading,TResult? Function( ToursResponse toursResponse,  bool isFromCache,  bool refreshing,  String? refreshErrorMessage)?  toursLoaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when intial != null:
return intial();case ToursLoading() when toursLoading != null:
return toursLoading();case Loaded() when toursLoaded != null:
return toursLoaded(_that.toursResponse,_that.isFromCache,_that.refreshing,_that.refreshErrorMessage);case Error() when error != null:
return error(_that.message);case _:
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


class Loaded implements HomeScreenState {
  const Loaded({required this.toursResponse, required this.isFromCache, required this.refreshing, this.refreshErrorMessage});
  

 final  ToursResponse toursResponse;
 final  bool isFromCache;
 final  bool refreshing;
 final  String? refreshErrorMessage;

/// Create a copy of HomeScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.toursResponse, toursResponse) || other.toursResponse == toursResponse)&&(identical(other.isFromCache, isFromCache) || other.isFromCache == isFromCache)&&(identical(other.refreshing, refreshing) || other.refreshing == refreshing)&&(identical(other.refreshErrorMessage, refreshErrorMessage) || other.refreshErrorMessage == refreshErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,toursResponse,isFromCache,refreshing,refreshErrorMessage);

@override
String toString() {
  return 'HomeScreenState.toursLoaded(toursResponse: $toursResponse, isFromCache: $isFromCache, refreshing: $refreshing, refreshErrorMessage: $refreshErrorMessage)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $HomeScreenStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 ToursResponse toursResponse, bool isFromCache, bool refreshing, String? refreshErrorMessage
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of HomeScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? toursResponse = null,Object? isFromCache = null,Object? refreshing = null,Object? refreshErrorMessage = freezed,}) {
  return _then(Loaded(
toursResponse: null == toursResponse ? _self.toursResponse : toursResponse // ignore: cast_nullable_to_non_nullable
as ToursResponse,isFromCache: null == isFromCache ? _self.isFromCache : isFromCache // ignore: cast_nullable_to_non_nullable
as bool,refreshing: null == refreshing ? _self.refreshing : refreshing // ignore: cast_nullable_to_non_nullable
as bool,refreshErrorMessage: freezed == refreshErrorMessage ? _self.refreshErrorMessage : refreshErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class Error implements HomeScreenState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of HomeScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeScreenState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $HomeScreenStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of HomeScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
