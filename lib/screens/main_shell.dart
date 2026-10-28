import 'package:flutter/material.dart';

import '../core/hit_areas.dart';
import '../widgets/hit_area.dart';
import 'cards_tab.dart';
import 'home_tab.dart';
import 'profile_tab.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;

  void _selectTab(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeTab(onTabSelected: _selectTab),
          CardsTab(onTabSelected: _selectTab),
          ProfileTab(onTabSelected: _selectTab),
        ],
      ),
    );
  }
}

Widget buildBottomNavigation({
  required void Function(int index) onTabSelected,
}) {
  return Stack(
    fit: StackFit.expand,
    children: [
      PositionedRect(
        rect: HitAreas.home,
        child: HitArea(onTap: () => onTabSelected(0)),
      ),
      PositionedRect(
        rect: HitAreas.cards,
        child: HitArea(onTap: () => onTabSelected(1)),
      ),
      PositionedRect(
        rect: HitAreas.profile,
        child: HitArea(onTap: () => onTabSelected(2)),
      ),
    ],
  );
}
