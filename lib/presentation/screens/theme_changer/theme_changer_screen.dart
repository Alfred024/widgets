import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/config/theme/app_theme.dart';
import 'package:widgets/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Para tener todos los estados de el AppThemeNotifier
    final bool darkMode = ref.watch(themeNotidierProvider).darkMode;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Theme changer'),
          actions: [
            IconButton(
                onPressed: () {
                  ref.read(themeNotidierProvider.notifier).darkModeSwitch();
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
    //final List<Color> colors = ref.watch(colorsList);
    //final int colorSelected = ref.watch(colorListSelected);
    final int selectedColor = ref.watch(themeNotidierProvider).selectedColor;

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
          groupValue: selectedColor,
          onChanged: (value) {
            ref.read(themeNotidierProvider.notifier).changeColor(index);
            //ref.read(colorListSelected.notifier).update((state) => index);
          },
        );
        //return Text('Ola');
      },
    );
  }
}
