// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tours_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToursResponse _$ToursResponseFromJson(Map<String, dynamic> json) =>
    ToursResponse(
      data: json['data'] == null
          ? null
          : ToursData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToursResponseToJson(ToursResponse instance) =>
    <String, dynamic>{'data': instance.data?.toJson()};

ToursData _$ToursDataFromJson(Map<String, dynamic> json) => ToursData(
  tours: (json['documents'] as List<dynamic>?)
      ?.map((e) => TourModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ToursDataToJson(ToursData instance) => <String, dynamic>{
  'documents': instance.tours?.map((e) => e.toJson()).toList(),
};

TourModel _$TourModelFromJson(Map<String, dynamic> json) => TourModel(
  json['id'] as String?,
  json['name'] as String?,
  (json['duration'] as num?)?.toInt(),
  (json['maxGroupSize'] as num?)?.toInt(),
  json['difficulty'] as String?,
  (json['ratingsAverage'] as num?)?.toDouble(),
  (json['ratingsQuantity'] as num?)?.toInt(),
  (json['price'] as num?)?.toDouble(),
  json['summary'] as String?,
  json['description'] as String?,
  json['imageCover'] as String?,
  (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  (json['startDates'] as List<dynamic>?)?.map((e) => e as String).toList(),
  json['startLocation'] == null
      ? null
      : StartLocation.fromJson(json['startLocation'] as Map<String, dynamic>),
  (json['guides'] as List<dynamic>?)
      ?.map((e) => User.fromJson(e as Map<String, dynamic>))
      .toList(),
  (json['reviews'] as List<dynamic>?)
      ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TourModelToJson(TourModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'startLocation': instance.startLocation?.toJson(),
  'duration': instance.duration,
  'maxGroupSize': instance.maxGroupSize,
  'difficulty': instance.difficulty,
  'ratingsAverage': instance.ratingsAverage,
  'ratingsQuantity': instance.ratingsQuantity,
  'price': instance.price,
  'summary': instance.summary,
  'description': instance.description,
  'imageCover': instance.imageCover,
  'images': instance.images,
  'startDates': instance.startDates,
  'guides': instance.guides?.map((e) => e.toJson()).toList(),
  'reviews': instance.reviews?.map((e) => e.toJson()).toList(),
};
