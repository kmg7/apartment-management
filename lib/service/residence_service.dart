import '../common/cache/cache_manager.dart';
import '../model/residence_model.dart';

class ResidenceService {
  static ResidenceService? _instance;
  static ResidenceService get instance {
    _instance ??= ResidenceService._init();
    return _instance!;
  }

  ResidenceService._init();

  final _db = CacheManager.instance;

  Future<void> create(String aptId, {required Residence data}) async {
    await _db.write('${aptId}_residences', id: data.id, data: data.toJson());
  }

  Future<Residence?> read(String aptId, {required String id}) async {
    final residence = await _db.read('${aptId}_residences', key: id);
    if (residence != null) {
      return residence.fromJson(residence);
    }
    return null;
  }

  Future<List<Residence>> readAll(String aptId) async {
    List<Residence> residences = [];
    final dbResponse = await _db.read('${aptId}_residences');
    for (var element in dbResponse) {
      residences.add(Residence.fromJson(element));
    }
    return residences;
  }

  Future<void> delete(String aptId, {required String id}) async {
    await _db.delete('${aptId}_residences', id: id);
  }

  Future<void> update(String aptId, {required String id, required Residence data}) async {
    await _db.write('${aptId}_residences', id: id, data: data.toJson());
  }

  Future<void> clear(String aptId) async {
    await _db.drop('${aptId}_residences');
  }
}
