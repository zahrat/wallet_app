import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    this.isAsset = true,
    required this.imageUri,
    required this.width,
    required this.height,
  });
  final bool isAsset;
  final String imageUri;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image(
      width: width,
      height: height,
      image: isAsset ? AssetImage(imageUri) : NetworkImage(imageUri),
    );
  }
}
