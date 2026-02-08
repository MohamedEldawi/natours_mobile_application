// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartLocation _$StartLocationFromJson(Map<String, dynamic> json) =>
    StartLocation(
      (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      json['address'] as String?,
      json['description'] as String?,
    );

Map<String, dynamic> _$StartLocationToJson(StartLocation instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
      'address': instance.address,
      'description': instance.description,
    };
