import 'package:flutter/material.dart';

import '../core/hit_areas.dart';
import '../widgets/hit_area.dart';
import '../widgets/screenshot_background.dart';
import 'main_shell.dart';
import 'placeholder_page.dart';
import 'splash_screen.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({required this.onTabSelected, super.key});

  final void Function(int index) onTabSelected;

  void _message(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final overlays = <Widget>[
      _area(
        HitAreas.profileEnglish,
        () => _message(context, 'English selected'),
      ),
      _area(HitAreas.profileArabic, () => _message(context, 'Arabic selected')),
      _area(
        HitAreas.themeLight,
        () => _message(context, 'Light theme – coming soon'),
      ),
      _area(
        HitAreas.themeDark,
        () => _message(context, 'Dark theme – coming soon'),
      ),
      _area(
        HitAreas.themeAuto,
        () => _message(context, 'Automatic theme – coming soon'),
      ),
      _area(
        HitAreas.twoFactor,
        () => _message(context, 'Two-factor authentication – coming soon'),
      ),
      PositionedRect(
        rect: HitAreas.information,
        child: HitArea(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => const PlaceholderPage(title: 'Information'),
            ),
          ),
        ),
      ),
      PositionedRect(
        rect: HitAreas.logout,
        child: HitArea(
          onTap: () async {
            final shouldLogout = await showDialog<bool>(
              context: context,
              builder: (dialogContext) => AlertDialog(
                title: const Text('Log out?'),
                content: const Text('Are you sure you want to log out?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(dialogContext, false),
                    child: const Text('Cancel'),
                  ),
                  FilledButton(
                    onPressed: () => Navigator.pop(dialogContext, true),
                    child: const Text('Log out'),
                  ),
                ],
              ),
            );
            if (shouldLogout == true && context.mounted) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute<void>(builder: (_) => const SplashScreen()),
                (_) => false,
              );
            }
          },
        ),
      ),
      Positioned.fill(
        child: buildBottomNavigation(onTabSelected: onTabSelected),
      ),
    ];
    return ScreenshotBackground(
      asset: 'assets/images/profile.png',
      overlays: overlays,
    );
  }

  Widget _area(Rect rect, VoidCallback onTap) {
    return PositionedRect(
      rect: rect,
      child: HitArea(onTap: onTap),
    );
  }
}
