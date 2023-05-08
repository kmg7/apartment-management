import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/residence_model.dart';
import '../service/residence_service.dart';

part 'residence_controller.g.dart';

final _service = ResidenceService.instance;

@riverpod
Future<List<Residence>?> residences(ResidencesRef ref) async {
  ref.watch(residencesChangeNotifier);
  return await _service.readAll(
    'aptId',
  );
}

final residencesChangeNotifier = ChangeNotifierProvider((_) => ResidenceController.instance);

class ResidenceController extends ChangeNotifier {
  static ResidenceController? _instance;
  static ResidenceController get instance {
    _instance ??= ResidenceController._init();
    return _instance!;
  }

  ResidenceController._init();

  Future<void> create({required Residence data}) async {
    await _service.create('aptId', data: data);
    notifyListeners();
  }

  Future<Residence?> read({required String id}) async {
    final residence = await _service.read('aptId', id: id);
    if (residence != null) {
      return residence;
    }
    return null;
  }

  Future<void> update({required String id, required Residence data}) async {
    await _service.update('aptId', id: data.id, data: data);
    notifyListeners();
  }

  Future<void> delete({required Residence apt}) async {
    await _service.delete('aptId', id: apt.id);
    notifyListeners();
  }

  void reload() => notifyListeners();
}
