// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    UserResponseModel(
      data: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{'data': instance.data};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String?,
  email: json['email'] as String?,
  name: json['name'] as String?,
  photo: json['photo'] as String?,
  role: json['role'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'photo': instance.photo,
  'role': instance.role,
};
