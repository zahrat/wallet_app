import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/ui/change_theme_button/view_models/change_theme_view_model.dart';

void main() {
  group('change theme test', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    test('return system theme if no theme is selected', () async {
      SharedPreferences.setMockInitialValues({});

      final container = ProviderContainer();

      addTearDown(container.dispose);
      final result = await container.read(changeThemeProvider.future);
      expect(result, equals(ThemeMode.system));
    });
    test('return stored theme in sharedPreferences', () async {
      SharedPreferences.setMockInitialValues({'theme': ThemeMode.light.name});

      final container = ProviderContainer();

      addTearDown(container.dispose);
      final result = await container.read(changeThemeProvider.future);
      expect(result, equals(ThemeMode.light));
    });

    test('switch theme from light to dark', () async {
      SharedPreferences.setMockInitialValues({'theme': ThemeMode.light.name});
      final container = ProviderContainer();

      final onSwitchTheme = container
          .read(changeThemeProvider.notifier)
          .onSwitchTheme;

      await onSwitchTheme();

      final switchedTheme = await container.read(changeThemeProvider.future);

      expect(switchedTheme, ThemeMode.dark);
    });
  });
}
