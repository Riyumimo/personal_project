import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_themeData);
  static final ThemeData _themeData = initialTheme();
  static final _lightTheme = ThemeData.light(useMaterial3: true);
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
  return ThemeData.light();
}

Future<String?> getPrefTheme() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString("theme");
}
