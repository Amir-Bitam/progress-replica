import 'package:flutter/material.dart';

import '../main.dart';

class HitArea extends StatelessWidget {
  const HitArea({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: ColoredBox(
        color: kShowHitAreas
            ? Colors.red.withValues(alpha: 0.35)
            : Colors.transparent,
      ),
    );
  }
}
