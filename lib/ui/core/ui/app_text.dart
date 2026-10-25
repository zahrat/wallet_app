import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/ui/language/view_models/language_view_model.dart';

class AppText extends ConsumerWidget {
  const AppText({super.key, required this.text, this.style});
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(langugeProvider);
    return Text(
      text,
      style: style?.copyWith(
        fontFamily: locale.value?.languageCode == 'fa' ? 'IranYekan' : null,
      ),
    );
  }
}
