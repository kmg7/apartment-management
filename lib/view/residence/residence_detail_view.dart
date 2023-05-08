import 'package:auto_route/auto_route.dart';
import 'package:estate_management/controller/residence_controller.dart';
import 'package:estate_management/model/residence_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResidenceDetailView extends ConsumerWidget {
  ResidenceDetailView({
    super.key,
    Residence? residence,
  })  : residence = residence ?? Residence(block: 'block', floor: 0, number: 0),
        _createMode = (residence == null),
        _blockController = TextEditingController(text: residence?.block),
        _numberController = TextEditingController(text: residence?.number.toString()),
        _floorController = TextEditingController(text: residence?.floor.toString()),
        _aboutController = TextEditingController(text: residence?.info ?? '');

  final Residence residence;
  final bool _createMode;
  final TextEditingController _blockController;
  final TextEditingController _numberController;
  final TextEditingController _floorController;
  final TextEditingController _aboutController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mode = _createMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apartment Name/Block?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(label: Text('Block'), icon: Icon(Icons.home_outlined), border: OutlineInputBorder()),
                controller: _blockController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(label: Text('Number'), icon: Icon(Icons.location_on_outlined), border: OutlineInputBorder()),
                controller: _numberController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(label: Text('Floor'), icon: Icon(Icons.format_list_numbered_rtl_outlined), border: OutlineInputBorder()),
                controller: _floorController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                keyboardType: TextInputType.text,
                maxLines: 4,
                decoration: const InputDecoration(label: Text('About'), icon: Icon(Icons.info_outlined), border: OutlineInputBorder()),
                controller: _aboutController,
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  final controller = ResidenceController.instance;
                  if (mode) {
                    await controller.create(
                        data: residence.copyWith(
                      block: _blockController.text,
                      number: int.parse(_numberController.text),
                      floor: int.parse(_floorController.text),
                      info: _aboutController.text,
                    ));
                  } else {
                    await controller.update(
                        id: residence.id,
                        data: residence.copyWith(
                          block: _blockController.text,
                          number: int.parse(_numberController.text),
                          floor: int.parse(_floorController.text),
                          info: _aboutController.text,
                        ));
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
