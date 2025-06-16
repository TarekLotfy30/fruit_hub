import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildOptimizedSvg extends StatelessWidget {
  const BuildOptimizedSvg({
    super.key,
    required this.assetPath,
    this.fit,
    this.semanticLabel,
  });

  final String assetPath;
  final BoxFit? fit;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      fit: fit ?? BoxFit.contain,
      semanticsLabel: semanticLabel,

      placeholderBuilder: (context) => const ColoredBox(
        color: Colors.transparent,
        child: Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
    );
  }
}
