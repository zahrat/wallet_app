import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/ui/app_container.dart';
import 'package:wallet_app/ui/profile/widgets/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(body: Column(children: [const ProfileHeader()]));
  }
}
