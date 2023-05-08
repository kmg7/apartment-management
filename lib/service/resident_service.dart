import '../model/resident_model.dart';

import '../common/cache/cache_manager.dart';

class ResidentService {
  static ResidentService? _instance;
  static ResidentService get instance {
    _instance ??= ResidentService._init();
    return _instance!;
  }

  ResidentService._init();

  final _db = CacheManager.instance;

  Future<void> create(String aptId, {required Resident data}) async {
    await _db.write('${aptId}_residents', id: data.id, data: data.toJson());
  }

  Future<Resident?> read(String aptId, {required String id}) async {
    final apartment = await _db.read('${aptId}_residents', key: id);
    if (apartment != null) {
      return Resident.fromJson(apartment);
    }
    return null;
  }

  Future<List<Resident>> readAll(String aptId) async {
    List<Resident> apartments = [];
    final dbResponse = await _db.read('${aptId}_residents');
    for (var element in dbResponse) {
      apartments.add(Resident.fromJson(element));
    }
    return apartments;
  }

  Future<void> delete(String aptId, {required String id}) async {
    await _db.delete('${aptId}_residents', id: id);
  }

  Future<void> update(String aptId, {required String id, required Resident data}) async {
    await _db.write('${aptId}_residents', id: id, data: data.toJson());
  }

  Future<void> clear(String aptId) async {
    await _db.drop('${aptId}_residents');
  }
}
