import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResidentManagementView extends ConsumerStatefulWidget {
  const ResidentManagementView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResidentManagementViewState();
}

class _ResidentManagementViewState extends ConsumerState<ResidentManagementView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resident Management Module'),
      ),
    );
  }
}
