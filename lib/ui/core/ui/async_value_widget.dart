import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/l10n/app_localizations.dart';
import 'package:wallet_app/ui/core/theme/index.dart';
import 'package:wallet_app/ui/core/ui/index.dart';

class AsyncValueView<T> extends StatelessWidget {
  const AsyncValueView({
    required this.value,
    required this.data,
    this.loadWidget,
    this.onRetry,
    super.key,
  });

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final Widget? loadWidget;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final errorColor = Theme.of(context).colorScheme.onErrorContainer;
    final retryTxt = AppLocalizations.of(context)!.retry;

    final errorStyle = Theme.of(
      context,
    ).textTheme.titleLarge?.copyWith(color: errorColor);

    if (value.isLoading || value.isRefreshing || value.isReloading) {
      return loadWidget ??
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [LoadIndicator()],
          );
    }
    return value.when(
      skipLoadingOnRefresh: true,
      data: data,
      loading: () =>
          loadWidget ??
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [LoadIndicator()],
          ),
      error: (error, _) => SizedBox(
        width: double.maxFinite,
        child: Column(
          spacing: Spacing.xxl,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            AppText(text: error.toString(), style: errorStyle),
            if (onRetry != null) AppButton(onTap: onRetry, text: retryTxt),
          ],
        ),
      ),
    );
  }
}
