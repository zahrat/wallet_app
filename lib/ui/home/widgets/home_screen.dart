import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/ui/app_container.dart';
import 'package:wallet_app/ui/home/widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppContainer(
      body: Column(children: [HomeHeader(walletAddress: "0x12345678901234")]),
    );
  }
}
