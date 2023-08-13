import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool darkMode = ref.watch(darkModeOn);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Theme changer'),
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
        body: const _TheChangerView());
  }
}

class _TheChangerView extends ConsumerWidget {
  const _TheChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorsList);
    final int colorSelected = ref.watch(colorListSelected);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color colorOnIndex = colors[index];

        return RadioListTile(
          activeColor: colorOnIndex,
          title: Text(
            'Color X',
            style: TextStyle(color: colorOnIndex),
          ),
          value: index,
          groupValue: colorSelected,
          onChanged: (value) {
            ref.read(colorListSelected.notifier).update((state) => index);
          },
        );
        //return Text('Ola');
      },
    );
  }
}
