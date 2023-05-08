import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/router/app_router.dart';
import '../../controller/resident_controller.dart';

class ResidentManagementView extends HookConsumerWidget {
  const ResidentManagementView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(residentsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resident Management Module'),
        actions: const [],
      ),
      floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            context.router.push(ResidentDetailRoute());
          },
          child: const Text('New')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('name'),
                    const Spacer(),
                    const SizedBox(width: 52, child: Text('edit')),
                    SizedBox.square(
                      dimension: 24,
                      child: ElevatedButton(
                          onPressed: () {
                            ResidentController.instance.reload();
                          },
                          style:
                              ElevatedButton.styleFrom(alignment: Alignment.center, padding: const EdgeInsets.only(), backgroundColor: Colors.green),
                          child: const Icon(Icons.refresh_outlined)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Card(
                  child: controller.when(
                error: (err, __) {
                  // err.log();
                  return const Text('Something went wrong!');
                },
                loading: () => const SizedBox.shrink(),
                data: (data) {
                  if (data != null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: data.length,
                        // itemCount: 10,
                        itemBuilder: (BuildContext context, int index) => Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => context.router.push(ResidentDetailRoute(resident: data[index])),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('${data[index].block} / '),
                                    Text(data[index].residence.toString()),
                                    Text('  ${data[index].name}  '),
                                    Text(data[index].surname),
                                    const Spacer(),
                                    SizedBox.square(
                                      dimension: 24,
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            await ResidentController.instance.delete(apt: data[index]);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              alignment: Alignment.center, padding: const EdgeInsets.only(), backgroundColor: Colors.red),
                                          child: const Icon(Icons.delete_outlined)),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(thickness: 2),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Text('Nothing to show');
                  }
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
