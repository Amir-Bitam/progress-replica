import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../core/hit_areas.dart';
import 'main_shell.dart';

class CardsTab extends StatefulWidget {
  const CardsTab({required this.onTabSelected, super.key});

  final void Function(int index) onTabSelected;

  @override
  State<CardsTab> createState() => _CardsTabState();
}

class _CardsTabState extends State<CardsTab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  late final CurvedAnimation _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );
  bool _showBack = false;

  @override
  void dispose() {
    _animation.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _flip() {
    if (_controller.isAnimating) return;
    setState(() => _showBack = !_showBack);
    if (_showBack) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final cardArea = Rect.fromLTRB(
          80 * width / referenceWidth,
          322 * height / referenceHeight,
          1000 * width / referenceWidth,
          1790 * height / referenceHeight,
        );

        return Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/empty_card.png', fit: BoxFit.fill),
            Positioned(
              left: cardArea.left,
              top: cardArea.top,
              width: cardArea.width,
              height: cardArea.height,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _flip,
                onHorizontalDragEnd: (details) {
                  if ((details.primaryVelocity ?? 0).abs() > 100) {
                    _flip();
                  }
                },
                child: _FlippableCard(
                  animation: _animation,
                  size: cardArea.size,
                ),
              ),
            ),
            Positioned.fill(
              child: buildBottomNavigation(onTabSelected: widget.onTabSelected),
            ),
          ],
        );
      },
    );
  }
}

class _FlippableCard extends StatelessWidget {
  const _FlippableCard({required this.animation, required this.size});

  final Animation<double> animation;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final angle = animation.value * math.pi;
        final showingBack = angle > math.pi / 2;
        final imageAngle = showingBack ? angle - math.pi : angle;

        return Center(
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(imageAngle + (showingBack ? math.pi : 0)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                60 * size.width / referenceWidth,
              ),
              child: Image.asset(
                showingBack
                    ? 'assets/images/card_back.png'
                    : 'assets/images/card_front.png',
                width: size.width,
                height: size.height,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
