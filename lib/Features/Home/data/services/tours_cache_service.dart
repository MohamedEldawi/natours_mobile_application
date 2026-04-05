import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:natours_application/Features/Home/data/models/tours_response.dart';

class ToursCacheService {
  // Box names
  static const String _boxName = 'toursBox';

  // Key names
  static const String _cachedToursKey = 'cachedTours';

  late final Box<String> _box;

  Future<void> init() async {
    _box = Hive.isBoxOpen(_boxName)
        ? Hive.box<String>(_boxName)
        : await Hive.openBox<String>(_boxName);
  }

  ToursResponse? getCachedTours() {
    final cachedTours = _box.get(_cachedToursKey);
    if (cachedTours == null) return null;

    try {
      final decoded = jsonDecode(cachedTours) as Map<String, dynamic>;
      return ToursResponse.fromJson(decoded);
    } catch (_) {
      _box.delete(_cachedToursKey);
      return null;
    }
  }

  Future<void> cacheTours(ToursResponse tourResponse) async {
    final jsonString = jsonEncode(tourResponse.toJson());
    await _box.put(_cachedToursKey, jsonString);
  }
}
