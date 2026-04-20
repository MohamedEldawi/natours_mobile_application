import 'package:natours_application/Features/Profile/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'review.g.dart';

@JsonSerializable(explicitToJson: true)
class Review {
  final String id;
  final String review;
  final double rating;
  final User user;
  @JsonKey(name: 'tour')
  final String tourId;

  Review({
    required this.id,
    required this.review,
    required this.rating,
    required this.user,
    required this.tourId,
  });
  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
