import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/ui/core/theme/index.dart';
import 'package:wallet_app/ui/core/ui/app_text.dart';
import 'package:wallet_app/ui/language/view_models/language_view_model.dart';

class LanguageModal extends ConsumerWidget {
  const LanguageModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onChangeLanuage = ref.read(langugeProvider.notifier).onChangeLanuage;

    void onClose() {
      Navigator.pop(context);
    }

    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return ListView(
          padding: EdgeInsetsGeometry.all(Spacing.xxl),
          children: [
            LanguageItem(
              name: "English",
              flag: "EN",
              isLastItem: false,
              onTap: () {
                onChangeLanuage(Locale('en'));
                onClose();
              },
            ),
            LanguageItem(
              name: "فارسی",
              flag: "FA",
              isLastItem: true,
              onTap: () {
                onChangeLanuage(Locale('fa'));
                onClose();
              },
            ),
          ],
        );
      },
    );
  }
}

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    required this.name,
    this.isLastItem = false,
    required this.flag,
    required this.onTap,
    super.key,
  });
  final String name;
  final String flag;
  final bool isLastItem;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final secondary = Theme.of(context).colorScheme.secondary;
    return Padding(
      padding: EdgeInsets.only(bottom: Spacing.sm),
      child: Column(
        children: [
          Row(
            spacing: Spacing.md,

            children: [
              CircleAvatar(
                backgroundColor: secondary,
                child: AppText(text: flag),
              ),
              InkWell(
                onTap: onTap,
                child: AppText(text: name),
              ),
            ],
          ),
          if (!isLastItem) SizedBox(height: Spacing.sm),
          if (!isLastItem) Divider(height: 3, thickness: 1),
        ],
      ),
    );
  }
}
