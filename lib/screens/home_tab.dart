import 'package:flutter/material.dart';

import '../core/hit_areas.dart';
import '../widgets/hit_area.dart';
import '../widgets/screenshot_background.dart';
import 'main_shell.dart';
import 'placeholder_page.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({required this.onTabSelected, super.key});

  final void Function(int index) onTabSelected;

  @override
  Widget build(BuildContext context) {
    final overlays = <Widget>[
      PositionedRect(
        rect: HitAreas.themeSun,
        child: HitArea(
          onTap: () => ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Theme – coming soon'))),
        ),
      ),
      ...HitAreas.homeButtons.map(
        (button) => PositionedRect(
          rect: button.rect,
          child: HitArea(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => PlaceholderPage(title: button.title),
              ),
            ),
          ),
        ),
      ),
      Positioned.fill(
        child: buildBottomNavigation(onTabSelected: onTabSelected),
      ),
    ];
    return ScreenshotBackground(
      asset: 'assets/images/home.png',
      overlays: overlays,
    );
  }
}
