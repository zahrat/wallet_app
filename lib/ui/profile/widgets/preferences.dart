import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/l10n/app_localizations.dart';
import 'package:wallet_app/ui/core/theme/app_colors.dart';
import 'package:wallet_app/ui/core/theme/spacing.dart';
import 'package:wallet_app/ui/core/ui/index.dart';
import 'package:wallet_app/ui/language/view_models/language_view_model.dart';
import 'package:wallet_app/ui/language/widgets/language_modal.dart';

class Preferences extends ConsumerStatefulWidget {
  const Preferences({super.key});

  @override
  ConsumerState<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends ConsumerState<Preferences> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appColors = Theme.of(context).extension<AppColors>();
    final appLocalizations = AppLocalizations.of(context);

    final language = ref.watch(langugeProvider);

    void onLanguageTap() async {
      await showModalBottomSheet<String>(
        context: context,
        constraints: BoxConstraints(maxHeight: 150),
        builder: (context) {
          return const LanguageModal();
        },
      );
    }

    return Column(
      spacing: Spacing.sm,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: appLocalizations!.preferences,
          style: textTheme.titleMedium?.copyWith(color: appColors?.grayText),
        ),
        RoundedCard(
          child: Row(
            spacing: Spacing.sm,
            children: [
              const Icon(Icons.language),
              AppText(
                text: appLocalizations!.language,
                style: textTheme.titleMedium,
              ),
              const Expanded(child: SizedBox()),
              GestureDetector(
                onTap: onLanguageTap,
                child: Row(
                  spacing: Spacing.sm,
                  children: [
                    AppText(
                      text: language.value?.languageCode == 'fa'
                          ? "فارسی"
                          : 'English',
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded, size: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
