import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/resident_model.dart';
import '../service/resident_service.dart';

part 'resident_controller.g.dart';

final _service = ResidentService.instance;

@riverpod
Future<List<Resident>?> residents(ResidentsRef ref) async {
  ref.watch(residentsChangeNotifier);
  return await _service.readAll(
    'aptId',
  );
}

final residentsChangeNotifier = ChangeNotifierProvider((_) => ResidentController.instance);

class ResidentController extends ChangeNotifier {
  static ResidentController? _instance;
  static ResidentController get instance {
    _instance ??= ResidentController._init();
    return _instance!;
  }

  ResidentController._init();

  Future<void> create({required Resident data}) async {
    await _service.create('aptId', data: data);
    notifyListeners();
  }

  Future<Resident?> read({required String id}) async {
    final resident = await _service.read('aptId', id: id);
    if (resident != null) {
      return resident;
    }
    return null;
  }

  Future<void> update({required String id, required Resident data}) async {
    await _service.update('aptId', id: data.id, data: data);
    notifyListeners();
  }

  Future<void> delete({required Resident apt}) async {
    await _service.delete('aptId', id: apt.id);
    notifyListeners();
  }

  void reload() => notifyListeners();
}
