import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/ui/core/ui/index.dart';

class AsyncValueView<T> extends StatelessWidget {
  const AsyncValueView({required this.value, required this.data, super.key});

  final AsyncValue<T> value;
  final Widget Function(T data) data;

  @override
  Widget build(BuildContext context) {
    final errorColor = Theme.of(context).colorScheme.onErrorContainer;

    final errorStyle = Theme.of(
      context,
    ).textTheme.bodyMedium?.copyWith(color: errorColor);

    return value.when(
      skipLoadingOnRefresh: true,
      data: data,
      loading: () =>
          const Center(heightFactor: 2, child: CircularProgressIndicator()),
      error: (error, _) => AppText(text: error.toString(), style: errorStyle),
    );
  }
}
