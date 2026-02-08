import 'package:json_annotation/json_annotation.dart';
import 'package:natours_application/Features/User/data/models/user.dart';
part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  String? status;
  String? token;
  @JsonKey(name: 'data')
  UserData? userData;
  LoginResponseBody({this.status, this.token, this.userData});
  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
}

@JsonSerializable()
class UserData {
  User? user;
  UserData({this.user});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
