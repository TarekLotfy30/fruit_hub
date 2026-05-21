import 'package:flutter/material.dart';

import 'circles.dart';
import 'leaf.dart';
import 'logo.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
    required Animation<Offset> leafSlide,
    required Animation<double> logoOpacity,
    required Animation<double> logoScale,
    required Animation<double> circlesOpacity,
  }) : _leafSlide = leafSlide,
       _logoOpacity = logoOpacity,
       _logoScale = logoScale,
       _circlesOpacity = circlesOpacity;

  final Animation<Offset> _leafSlide;
  final Animation<double> _logoOpacity;
  final Animation<double> _logoScale;
  final Animation<double> _circlesOpacity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Leaf(animation: _leafSlide),
        Logo(opacity: _logoOpacity, scale: _logoScale),
        Circles(opacity: _circlesOpacity),
      ],
    );
  }
}
