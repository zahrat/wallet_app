import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/ui/change_theme_button/widgets/change_theme.dart';

void main() {
  testWidgets('change theme icon on press on it', (tester) async {
    SharedPreferences.setMockInitialValues({'theme': ThemeMode.light.name});
    await tester.pumpWidget(
      ProviderScope(
        child: const MaterialApp(home: Scaffold(body: ChangeTheme())),
      ),
    );

    await tester.pump(Duration(microseconds: 10000));
    expect(find.byIcon(Icons.nightlight_round_outlined), findsOneWidget);

    final inkWell = find.byType(InkWell);

    await tester.tap(inkWell);
    await tester.pump();

    final afterTap = find.byIcon(Icons.sunny);

    expect(afterTap, findsOneWidget);
  });
}
