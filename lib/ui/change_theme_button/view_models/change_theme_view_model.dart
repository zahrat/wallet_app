import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/services/shared_preference_service.dart';

class ChangeThemeViewModel extends AsyncNotifier<ThemeMode> {
  @override
  FutureOr<ThemeMode> build() async {
    final currentTheme = await SharedPreferenceService.getStringValue("theme");
    return currentTheme == ThemeMode.dark.name
        ? ThemeMode.dark
        : currentTheme == ThemeMode.light.name
        ? ThemeMode.light
        : ThemeMode.system;
  }

  void onSwitchTheme() async {
    state = AsyncData(
      state.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
    );
    SharedPreferenceService.setStringValue(
      "theme",
      state.value?.name ?? ThemeMode.system.name,
    );
  }
}

final changeThemeProvider =
    AsyncNotifierProvider<ChangeThemeViewModel, ThemeMode>(
      ChangeThemeViewModel.new,
    );
