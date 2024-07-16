import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class BlueRouteIcon extends StatelessWidget {
  const BlueRouteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      blueRoute,
      fit: BoxFit.contain,
      color: secondry,
    );
  }
}
