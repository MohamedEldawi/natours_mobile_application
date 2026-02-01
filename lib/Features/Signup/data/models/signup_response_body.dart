import 'package:json_annotation/json_annotation.dart';
import 'package:natours_application/Features/User/data/models/user.dart';
part 'signup_response_body.g.dart';

@JsonSerializable()
class SignupResponseBody {
  String? status;
  String? token;
  UserData? data;
  SignupResponseBody({this.status, this.data, this.token});
  factory SignupResponseBody.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseBodyFromJson(json);
}
