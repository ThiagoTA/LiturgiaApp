import 'package:flutter/material.dart';

class ScrollSafeArea extends StatelessWidget {
 final ScrollController? controller;
  final Widget child;
  final double extraSpace;

  const ScrollSafeArea({
    super.key,
    this.controller,
    required this.child,
    this.extraSpace = 16,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    final screenHeight = media.size.height;
    final safeBottom = media.padding.bottom;

    final bottomSpace = (screenHeight * 0.001) + safeBottom + extraSpace;

    return SingleChildScrollView(
      controller: controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          child,
          SizedBox(height: bottomSpace),
        ],
      ),
    );
  }
}