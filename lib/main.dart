import 'package:flutter/material.dart';
//RiverPod provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Router
import 'package:widgets/config/router/app_router.dart';
//Theme
import 'package:widgets/config/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 2).getTheme(),
    );
  }
}
