import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/services/shared_preference_service.dart';

class ChangeLanguageViewModel extends AsyncNotifier<Locale> {
  @override
  FutureOr<Locale> build() async {
    final locale = await SharedPreferenceService.getStringValue("locale");

    return locale == null ? Locale('en') : Locale(locale);
  }

  void onChangeLanuage(Locale locale) async {
    state = AsyncData(locale);
    SharedPreferenceService.setStringValue("locale", locale.languageCode);
  }
}

final langugeProvider = AsyncNotifierProvider<ChangeLanguageViewModel, Locale>(
  ChangeLanguageViewModel.new,
);
