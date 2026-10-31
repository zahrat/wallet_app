import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/l10n/app_localizations.dart';
import 'package:wallet_app/routing/app_router.dart';
import 'package:wallet_app/ui/change_theme_button/view_models/change_theme_view_model.dart';
import 'package:wallet_app/ui/core/theme/app_theme.dart';
import 'package:wallet_app/ui/language/view_models/language_view_model.dart';

void main() {
  runZonedGuarded(
    () {
      runApp(const ProviderScope(child: MyApp()));
    },
    (error, stackTrace) {
      print('${error}');
      print('${stackTrace}');
    },
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(changeThemeProvider);
    final locale = ref.watch(langugeProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: theme.value ?? ThemeMode.system,
      routerConfig: appRouter,
      locale: locale.value ?? AppLocalizations.supportedLocales.first,
      localizationsDelegates: [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
