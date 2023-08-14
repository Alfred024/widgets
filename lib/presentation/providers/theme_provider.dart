import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/theme/app_theme.dart';

final darkModeOn = StateProvider((themeMode) => false);

//Lista de colores tomada desde la constante definida en la clase Theme
final colorsList = Provider((color) => colors);
final colorListSelected = StateProvider((colorSelected) => 0);

final themeNotidierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  //Trae todos los valores de la clase AppTheme
  ThemeNotifier() : super(AppTheme());

  void darkModeSwitch() {
    state = state.copy(darkMode: !state.darkMode);
  }

  void changeColor(int userSelectedColor) {
    state = state.copy(selectedColor: userSelectedColor);
  }
}
