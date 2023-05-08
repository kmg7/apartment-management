import 'package:auto_route/auto_route.dart';
import 'package:estate_management/controller/resident_controller.dart';
import 'package:estate_management/model/resident_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResidentDetailView extends ConsumerWidget {
  ResidentDetailView({
    super.key,
    Resident? resident,
  })  : resident = resident ??
            Resident(
              block: 'block',
              email: 'email',
              name: 'name',
              phone: 'phone',
              residence: 0,
              surname: 'surname',
            ),
        _createMode = (resident == null),
        _blockController = TextEditingController(text: resident?.block),
        _residenceController = TextEditingController(text: resident?.residence.toString()),
        _phoneController = TextEditingController(text: resident?.phone),
        _emailController = TextEditingController(text: resident?.email),
        _nameController = TextEditingController(text: resident?.name),
        _surnameController = TextEditingController(text: resident?.surname);

  final Resident resident;
  final bool _createMode;
  final TextEditingController _blockController;
  final TextEditingController _residenceController;
  final TextEditingController _phoneController;
  final TextEditingController _emailController;
  final TextEditingController _nameController;
  final TextEditingController _surnameController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mode = _createMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apartment Name/Block?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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
                  decoration: const InputDecoration(label: Text('residence'), icon: Icon(Icons.location_on_outlined), border: OutlineInputBorder()),
                  controller: _residenceController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(label: Text('Name'), icon: Icon(Icons.person_2_outlined), border: OutlineInputBorder()),
                  controller: _nameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(label: Text('Surname'), icon: Icon(Icons.person_2_outlined), border: OutlineInputBorder()),
                  controller: _surnameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(label: Text('Phone'), icon: Icon(Icons.phone_outlined), border: OutlineInputBorder()),
                  controller: _phoneController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(label: Text('Email'), icon: Icon(Icons.email_outlined), border: OutlineInputBorder()),
                  controller: _emailController,
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final controller = ResidentController.instance;
                    if (mode) {
                      await controller.create(
                        data: resident.copyWith(
                          block: _blockController.text,
                          residence: int.parse(_residenceController.text),
                          phone: _phoneController.text,
                          email: _emailController.text,
                          name: _nameController.text,
                          surname: _surnameController.text,
                        ),
                      );
                    } else {
                      await controller.update(
                        id: resident.id,
                        data: resident.copyWith(
                          block: _blockController.text,
                          residence: int.parse(_residenceController.text),
                          phone: _phoneController.text,
                          email: _emailController.text,
                          name: _nameController.text,
                          surname: _surnameController.text,
                        ),
                      );
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
      ),
    );
  }
}
