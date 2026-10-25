import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/ui/index.dart';

class AssetDetailScreen extends StatefulWidget {
  const AssetDetailScreen({super.key});

  @override
  State<AssetDetailScreen> createState() => _AssetDetailScreenState();
}

class _AssetDetailScreenState extends State<AssetDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      body: Column(children: [AppText(text: "text")]),
    );
  }
}
