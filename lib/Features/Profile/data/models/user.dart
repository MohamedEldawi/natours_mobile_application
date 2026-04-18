import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class UserResponseModel {
  User? data;
  UserResponseModel({this.data});
  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);
}

@JsonSerializable()
class User {
  String? id;
  String? name;
  String? email;
  String? photo;
  String? role;
  User({this.id, this.email, this.name, this.photo, this.role});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
