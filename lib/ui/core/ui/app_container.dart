import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({super.key, required this.body, this.padding = 10});
  final Widget body;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(padding: EdgeInsets.all(padding), child: body),
      ),
    );
  }
}
