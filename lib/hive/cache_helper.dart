import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

class HiveCacheHelper<T> {
  static const String boxSources = "sources_box";
  static const String boxNews = "news_box";

  // Open box
  Future<Box<T>> _openBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<T>(boxName);
    }
    return Hive.box<T>(boxName);
  }

//Save box
  Future<void> saveBox(String boxName, T values) async {
    final box = await _openBox(boxName);
    await box.put(boxName, values);
    var logger = Logger();
    logger.i("Data saved to box => $box");
  }

  //Get box
  Future<T?> getBox(String boxName) async {
    final box = await _openBox(boxName);

    return box.get(boxName) as T?;
  }

  //Clear box
  Future<void> clearBox(String boxName) async {
    final box = await _openBox(boxName);
    box.clear();
  }
}
