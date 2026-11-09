import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wallet_app/ui/core/theme/app_colors_extension.dart';

class LoadIndicator extends StatelessWidget {
  const LoadIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final loadSpinner = Theme.of(
      context,
    ).extension<AppColorsExtension>()!.loadSpinner;

    return SpinKitThreeBounce(color: loadSpinner, size: 10.0);
  }
}
