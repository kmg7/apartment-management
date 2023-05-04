import 'package:flutter/material.dart';

class ApartmentManagementView extends StatefulWidget {
  const ApartmentManagementView({super.key});

  @override
  State<ApartmentManagementView> createState() => _ApartmentManagementViewState();
}

class _ApartmentManagementViewState extends State<ApartmentManagementView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apartment Management Module'),
      ),
    );
  }
}
