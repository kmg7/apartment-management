import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/router/app_router.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  // final controller = ChangeNotifierProvider((ref) => null)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Page')),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.apartment_outlined),
            trailing: const Icon(Icons.chevron_right_outlined),
            title: const Text('Apartment Management'),
            onTap: () => context.router.push(const ApartmentManagementRoute()),
          ),
          ListTile(
            leading: const Icon(Icons.people_alt_outlined),
            trailing: const Icon(Icons.chevron_right_outlined),
            title: const Text('Resident Management'),
            onTap: () => context.router.push(const ResidentManagementRoute()),
          )
        ],
      ),
    );
  }
}
