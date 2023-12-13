import 'package:bloc/bloc.dart';
import 'package:dicoding_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_themeData);
  static final ThemeData _themeData = initialTheme();
  static final _lightTheme = initialTheme();
  static final _darkTheme = ThemeData.dark(useMaterial3: true);
  void getThemeFromPref() async {
    print(state.brightness.name);
    final String? theme = await getPrefTheme();
    if (theme != null) {
      if (theme == Brightness.dark.name) {
        emit(_darkTheme);
      } else {
        emit(_lightTheme);
      }
    } else {
      emit(_lightTheme);
    }
  }

  void toggleTheme() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("theme", state.brightness.name);
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}

ThemeData initialTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: ColorName.primary100,
        onPrimary: ColorName.primary200,
        secondary: ColorName.accent100,
        onSecondary: ColorName.accent200,
        error: Colors.red,
        onError: Colors.redAccent,
        background: ColorName.bg100,
        onBackground: ColorName.bg200,
        surface: ColorName.text100,
        onSurface: ColorName.text200),
    hintColor: ColorName.text100,
    primaryIconTheme: const IconThemeData(color: ColorName.primary100),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(backgroundColor: ColorName.primary100),
    ),
  );
}

Future<String?> getPrefTheme() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString("theme");
}
