// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
  id: json['id'] as String,
  review: json['review'] as String,
  rating: (json['rating'] as num).toDouble(),
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  tourId: json['tour'] as String,
);

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
  'id': instance.id,
  'review': instance.review,
  'rating': instance.rating,
  'user': instance.user.toJson(),
  'tour': instance.tourId,
};
