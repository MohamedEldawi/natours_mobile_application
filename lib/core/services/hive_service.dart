import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  HiveService._internal();
  static final HiveService _instance = HiveService._internal();
  factory HiveService() => _instance;

  static Future<void> initHive() async {
    final appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
  }
}
