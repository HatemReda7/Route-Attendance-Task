import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/app_routes.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_images.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  Future<void> _navigateToHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (!context.mounted) return;

    Navigator.of(context).pushReplacementNamed(Routes.HomeScreen);
  }

  @override
  Widget build(BuildContext context) {
    _navigateToHome(context);

    return Scaffold(
      backgroundColor: secondry,
      body: Center(
        child: Image.asset(
          splash,
          height: 165.h,
          width: 396.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}