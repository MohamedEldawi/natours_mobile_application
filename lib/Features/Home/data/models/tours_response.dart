import 'package:json_annotation/json_annotation.dart';
import 'package:natours_application/Features/Home/data/models/start_location.dart';
part 'tours_response.g.dart';

@JsonSerializable()
class ToursResponse {
  final ToursData? data;
  ToursResponse({this.data});
  factory ToursResponse.fromJson(Map<String, dynamic> json) =>
      _$ToursResponseFromJson(json);
}

@JsonSerializable()
class ToursData {
  @JsonKey(name: 'documents')
  final List<TourModel>? tours;
  ToursData({this.tours});
  factory ToursData.fromJson(Map<String, dynamic> json) =>
      _$ToursDataFromJson(json);
}

@JsonSerializable()
class TourModel {
  final String? id;
  final String? name;
  final StartLocation? startLocation;
  final int? duration;
  final int? maxGroupSize;
  final String? difficulty;
  final double? ratingsAverage;
  final int? ratingsQuantity;
  final double? price;
  final String? summary;
  final String? description;
  final String? imageCover;
  final List<String>? images;
  final List<String>? startDates;

  TourModel(
    this.id,
    this.name,
    this.duration,
    this.maxGroupSize,
    this.difficulty,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.price,
    this.summary,
    this.description,
    this.imageCover,
    this.images,
    this.startDates,
    this.startLocation,
  );
  factory TourModel.fromJson(Map<String, dynamic> json) =>
      _$TourModelFromJson(json);
}
