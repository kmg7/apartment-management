import 'package:hive/hive.dart';

class CacheManager {
  static CacheManager? _instance;
  static CacheManager get instance {
    _instance ??= CacheManager._init();
    return _instance!;
  }

  CacheManager._init();
  Future<dynamic> read(String path, {String? key}) async {
    var box = await Hive.openBox(path);
    // await drop();
    if (key == null) {
      // box.toString();
      // box.values.log();
      return box.values;
    }
    return box.get(key);
  }

  Future<dynamic> write(String path, {required String id, required String data}) async {
    var box = await Hive.openBox(path);
    return box.put(id, data);
  }

  Future<dynamic> delete(String path, {required String id}) async {
    var box = await Hive.openBox(path);
    return box.delete(id);
  }

  Future<dynamic> drop(String path) async {
    var box = await Hive.openBox(path);
    return box.deleteFromDisk();
  }
}
