import 'package:estate_management/model/apartment_model.dart';

import '../common/cache/cache_manager.dart';

class ApartmentService {
  static ApartmentService? _instance;
  static ApartmentService get instance {
    _instance ??= ApartmentService._init();
    return _instance!;
  }

  ApartmentService._init();

  final CacheManager _db = CacheManager(path: 'apartments');

  Future<void> create({required Apartment data}) async {
    await _db.write(id: data.id, data: data.toJson());
  }

  Future<Apartment?> read({required String id}) async {
    final apartment = await _db.read(key: id);
    if (apartment != null) {
      return Apartment.fromJson(apartment);
    }
    return null;
  }

  Future<List<Apartment>> readAll() async {
    List<Apartment> apartments = [];
    final dbResponse = await _db.read();
    for (var element in dbResponse) {
      apartments.add(Apartment.fromJson(element));
    }
    return apartments;
  }

  Future<void> delete({required String id}) async {
    await _db.delete(id: id);
  }

  Future<void> update({required String id, required Apartment data}) async {
    await _db.write(id: id, data: data.toJson());
  }

  Future<void> clear() async {
    await _db.drop();
  }
}
