import 'package:flutter/material.dart';

class ScreenshotBackground extends StatelessWidget {
  const ScreenshotBackground({
    required this.asset,
    required this.overlays,
    super.key,
  });

  final String asset;
  final List<Widget> overlays;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(asset, fit: BoxFit.fill),
            ...overlays,
          ],
        );
      },
    );
  }
}
