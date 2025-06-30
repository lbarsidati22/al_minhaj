import 'package:al_minhaj/core/services/shared_pref.dart';
import 'package:al_minhaj/core/settings/cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState.initial()) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    print("LANG start loaADING"); // 👈

    final lang =
        AppPreferences.getString('language') ?? 'ar';
    final themeStr =
        AppPreferences.getString('theme') ?? 'light';
    print("LANG: $lang, THEME: $themeStr"); // 👈

    emit(
      state.copyWith(
        language: lang,
        themeMode: themeStr == 'dark'
            ? ThemeMode.dark
            : ThemeMode.light,
      ),
    );
  }

  Future<void> changeLanguage(String newLang) async {
    if (state.language == newLang) return;
    await AppPreferences.setString(
      'language',
      newLang,
    );
    emit(state.copyWith(language: newLang));
  }

  Future<void> changeTheme(ThemeMode newTheme) async {
    if (state.themeMode == newTheme) return;
    await AppPreferences.setString(
      'theme',
      newTheme.name,
    );
    emit(state.copyWith(themeMode: newTheme));
  }
}
