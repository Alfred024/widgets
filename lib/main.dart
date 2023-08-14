import 'package:flutter/material.dart';
//RiverPod provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Router
import 'package:widgets/config/router/app_router.dart';
//Theme
import 'package:widgets/config/theme/app_theme.dart';
import 'package:widgets/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final int selectedColor = ref.watch(colorListSelected);
    // final bool darkModeState = ref.watch(darkModeOn);
    final AppTheme appThemeState = ref.watch(themeNotidierProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
              selectedColor: appThemeState.selectedColor,
              darkMode: appThemeState.darkMode)
          .getTheme(),
    );
  }
}
