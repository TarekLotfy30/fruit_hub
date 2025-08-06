import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BuildOptimizedSvg extends StatelessWidget {
  const BuildOptimizedSvg({
    super.key,
    required this.assetPath,
    this.fit,
    this.semanticLabel,
    this.colorFilter,
  });

  final String assetPath;
  final BoxFit? fit;
  final String? semanticLabel;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      fit: fit ?? BoxFit.contain,
      semanticsLabel: semanticLabel,
      colorFilter: colorFilter,
      placeholderBuilder: (context) => ColoredBox(
        color: Colors.transparent,
        child: Center(
          child: SizedBox(
            width: 24.w,
            height: 24.h,
            child: const CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
    );
  }
}
