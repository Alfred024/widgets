import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/presentation/providers/counter_provider.dart';
import 'package:widgets/presentation/providers/theme_provider.dart';

// ignore: must_be_immutable
class CounterScreen extends ConsumerWidget {
  int counter = 0;

  static const name = 'counter_screen';
  CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counterValue = ref.watch(counterProvider);
    final bool darkMode = ref.watch(darkModeOn);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(darkModeOn.notifier).update((state) => !state);
              },
              icon: darkMode
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode))
        ],
      ),
      body: Center(
        child: Text('Contador: $counterValue'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvider.notifier).update((state) => state + 1);
          //ref.read(counterProvider.notifier).state++;
        },
      ),
    );
  }
}
