import 'package:json_annotation/json_annotation.dart';
part 'start_location.g.dart';

@JsonSerializable(explicitToJson: true)
class StartLocation {
  final List<double>? coordinates;
  final String? address;
  final String? description;

  StartLocation(this.coordinates, this.address, this.description);
  factory StartLocation.fromJson(Map<String, dynamic> json) =>
      _$StartLocationFromJson(json);

  Map<String, dynamic> toJson() => _$StartLocationToJson(this);
}
