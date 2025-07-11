import 'package:flutter/material.dart';
import '../../../../core/widgets/build_optimized_svg.dart';

class BuildSocialMediaButton extends StatelessWidget {
  const BuildSocialMediaButton({
    super.key,
    required this.assetPath,
    required this.label,
    required this.onPressed,
    this.colorFilter,
  });

  final String assetPath;
  final String label;
  final void Function() onPressed;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        children: [
          BuildOptimizedSvg(assetPath: assetPath, colorFilter: colorFilter),
          const Spacer(),
          Text(label),
          const Spacer(),
        ],
      ),
    );
  }
}
