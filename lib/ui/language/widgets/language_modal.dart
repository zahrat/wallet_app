import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/theme/index.dart';
import 'package:wallet_app/ui/core/ui/app_text.dart';

class LanguageModal extends StatelessWidget {
  const LanguageModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () => {},
      builder: (context) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return LanguageItem(
              name: "English",
              flag: "EN",
              isLastItem: index == 1,
            );
          },
          itemCount: 2,
          padding: EdgeInsetsGeometry.all(Spacing.xxl),
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
    super.key,
  });
  final String name;
  final String flag;
  final bool isLastItem;

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
              AppText(text: name),
            ],
          ),
          if (!isLastItem) SizedBox(height: Spacing.sm),
          if (!isLastItem) Divider(height: 3, thickness: 1),
        ],
      ),
    );
  }
}
