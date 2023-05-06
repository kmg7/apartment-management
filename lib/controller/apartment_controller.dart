import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/apartment_model.dart';
import '../service/apartment_service.dart';

part 'apartment_controller.g.dart';

final _service = ApartmentService.instance;

@riverpod
Future<List<Apartment>?> apartments(ApartmentsRef ref) async {
  ref.watch(apartmentsChangeNotifier);
  return await _service.readAll();
}

final apartmentsChangeNotifier = ChangeNotifierProvider((_) => ApartmentController.instance);

class ApartmentController extends ChangeNotifier {
  static ApartmentController? _instance;
  static ApartmentController get instance {
    _instance ??= ApartmentController._init();
    return _instance!;
  }

  ApartmentController._init();

  Future<void> create({required Apartment data}) async {
    await _service.create(data: data);
    notifyListeners();
  }

  Future<Apartment?> read({required String id}) async {
    final apartment = await _service.read(id: id);
    if (apartment != null) {
      return apartment;
    }
    return null;
  }

  Future<void> update({required String id, required Apartment data}) async {
    await _service.update(id: data.id, data: data);
    notifyListeners();
  }

  Future<void> delete({required Apartment apt}) async {
    await _service.delete(id: apt.id);
    notifyListeners();
  }

  void reload() => notifyListeners();
}
