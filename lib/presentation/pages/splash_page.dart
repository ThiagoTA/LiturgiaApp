import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liturgia_app/core/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    final logoSize = shortestSide * 0.80;
    final constrainedSize = logoSize.clamp(160.0, 260.0);

    return Scaffold(
      backgroundColor: AppColors.bgBase,

      body: Center(
        child: SvgPicture.asset(
          'assets/icons/liturgia_icon_clean.svg',
          width: constrainedSize,
          height: constrainedSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
