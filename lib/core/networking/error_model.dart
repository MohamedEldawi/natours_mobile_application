import 'package:json_annotation/json_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  String? message;
  String? status;
  ErrorModel({this.message, this.status});
  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
}
