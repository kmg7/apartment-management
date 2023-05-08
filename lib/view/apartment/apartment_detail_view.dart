import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/apartment_controller.dart';
import '../../model/apartment_model.dart';

class ApartmentDetailView extends ConsumerWidget {
  ApartmentDetailView({
    super.key,
    Apartment? apartment,
  })  : apartment = apartment ?? Apartment(name: '', address: 'address', warming: 'warming'),
        _createMode = (apartment == null),
        _nameController = TextEditingController(text: apartment?.name),
        _addressController = TextEditingController(text: apartment?.address),
        _warmingController = TextEditingController(text: apartment?.warming);
  final Apartment apartment;
  final bool _createMode;
  final TextEditingController _nameController;
  final TextEditingController _addressController;
  final TextEditingController _warmingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mode = _createMode;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          !mode ? apartment.name : 'New Apartment',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                decoration: const InputDecoration(label: Text('Name'), icon: Icon(Icons.apartment), border: OutlineInputBorder()),
                controller: _nameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                decoration: const InputDecoration(label: Text('Address'), icon: Icon(Icons.location_on_outlined), border: OutlineInputBorder()),
                controller: _addressController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                decoration: const InputDecoration(label: Text('Warming'), icon: Icon(Icons.thermostat_outlined), border: OutlineInputBorder()),
                controller: _warmingController,
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  final controller = ApartmentController.instance;
                  if (mode) {
                    await controller.create(
                        data: apartment.copyWith(name: _nameController.text, address: _addressController.text, warming: _warmingController.text));
                  } else {
                    await controller.update(
                        id: apartment.id,
                        data: apartment.copyWith(name: _nameController.text, address: _addressController.text, warming: _warmingController.text));
                    mode = false;
                  }
                  if (context.mounted) {
                    context.router.pop();
                  }
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}
