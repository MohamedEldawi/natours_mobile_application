import 'package:json_annotation/json_annotation.dart';
import 'package:natours_application/Features/Home/data/models/review.dart';
import 'package:natours_application/Features/Home/data/models/start_location.dart';
import 'package:natours_application/Features/Profile/data/models/user.dart';
part 'tours_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ToursResponse {
  final ToursData? data;
  ToursResponse({this.data});
  factory ToursResponse.fromJson(Map<String, dynamic> json) =>
      _$ToursResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ToursResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ToursData {
  @JsonKey(name: 'documents')
  final List<TourModel>? tours;
  ToursData({this.tours});
  factory ToursData.fromJson(Map<String, dynamic> json) =>
      _$ToursDataFromJson(json);

  Map<String, dynamic> toJson() => _$ToursDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
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
  final List<User>? guides;
  final List<Review>? reviews;

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
    this.guides,
    this.reviews,
  );
  factory TourModel.fromJson(Map<String, dynamic> json) =>
      _$TourModelFromJson(json);

  Map<String, dynamic> toJson() => _$TourModelToJson(this);
}
