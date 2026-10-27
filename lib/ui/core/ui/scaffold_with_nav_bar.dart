import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/ui/core/theme/app_colors_extension.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>();

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: colors!.grayText, width: 0.08),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomTabItem(
                navigationShell: navigationShell,
                acitveIconData: Icons.home_rounded,
                deActiveIconData: Icons.home_outlined,
                index: 0,
              ),
              BottomTabItem(
                navigationShell: navigationShell,
                acitveIconData: Icons.account_circle,
                deActiveIconData: Icons.account_circle_outlined,
                index: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomTabItem extends StatelessWidget {
  const BottomTabItem({
    super.key,
    required this.navigationShell,
    required this.acitveIconData,
    required this.deActiveIconData,
    required this.index,
  });

  final StatefulNavigationShell navigationShell;
  final IconData acitveIconData;
  final IconData deActiveIconData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        navigationShell.currentIndex == index
            ? acitveIconData
            : deActiveIconData,
        size: 30,
      ),
      onPressed: () => navigationShell.goBranch(index),
    );
  }
}
