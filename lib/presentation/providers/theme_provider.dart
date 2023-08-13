import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/theme/app_theme.dart';

final darkModeOn = StateProvider((themeMode) => false);

//Lista de colores tomada desde la constante definida en la clase Theme
final colorsList = Provider((color) => colors);
final colorListSelected = StateProvider((colorSelected) => 0);
