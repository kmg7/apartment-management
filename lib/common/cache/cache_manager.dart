import 'package:hive/hive.dart';

class CacheManager {
  String path;
  CacheManager({
    required this.path,
  });

  Future<dynamic> read({String? key}) async {
    var box = await Hive.openBox(path);
    if (key == null) {
      return box.values;
    }
    return box.get(key);
  }

  Future<dynamic> write({required String id, required String data}) async {
    var box = await Hive.openBox(path);
    return box.put(id, data);
  }

  Future<dynamic> delete({required String id}) async {
    var box = await Hive.openBox(path);
    return box.delete(id);
  }

  Future<dynamic> drop() async {
    var box = await Hive.openBox(path);
    return box.deleteFromDisk();
  }
}
