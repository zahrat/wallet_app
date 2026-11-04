import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/ui/change_theme_button/view_models/change_theme_view_model.dart';
import 'package:wallet_app/ui/core/ui/index.dart';

class ChangeTheme extends ConsumerWidget {
  const ChangeTheme({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(changeThemeProvider);
    final onSwitchTheme = ref.read(changeThemeProvider.notifier).onSwitchTheme;

    void onTap() {
      onSwitchTheme();
    }

    return InkWell(
      onTap: onTap,
      child: AsyncValueView(
        value: theme,
        data: (data) =>
            Icon(data!.isDark ? Icons.sunny : Icons.nightlight_round_outlined),
      ),
    );
  }
}
