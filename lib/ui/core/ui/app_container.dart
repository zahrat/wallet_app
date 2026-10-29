import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/ui/app_text.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.body,
    this.padding = 10,
    this.pageTitle,
  });
  final Widget body;
  final double padding;
  final String? pageTitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: pageTitle != null
            ? AppBar(
                title: AppText(text: pageTitle ?? ''),
                leading: BackButton(),
              )
            : null,
        body: Padding(padding: EdgeInsets.all(padding), child: body),
      ),
    );
  }
}
