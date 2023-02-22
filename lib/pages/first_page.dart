import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_route_guard/editing_provider.dart';

class FirstPage extends ConsumerWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editingProvider);
    final controller = ref.watch(editingProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('first page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: state ? Colors.white : Colors.blue,
            ),
            onPressed: () {
              controller.state = !controller.state;
            },
            child: Text(
              state ? '編集中' : '編集する',
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/second');
              if (controller.state) {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text('編集中！！！'),
                  ),
                );
              }
            },
            child: const Text(
              '次のページへ',
            ),
          ),
        ],
      )),
    );
  }
}
