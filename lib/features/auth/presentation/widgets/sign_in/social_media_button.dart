part of '../../screens/sign_in_view.dart';

class _BuildSocialMediaButton extends StatelessWidget {
  const _BuildSocialMediaButton({
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
