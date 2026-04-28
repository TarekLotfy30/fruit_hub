final class OnboardingModel {
  const OnboardingModel({
    this.titleTextSpan2,
    this.titleTextSpan1,
    this.titleTextSpan3,
    this.title,
    required this.isLast,
    required this.subTitle,
    required this.image,
    required this.backgroundImage,
  });

  final String? titleTextSpan1;
  final String? titleTextSpan2;
  final String? titleTextSpan3;
  final String? title;
  final bool isLast;
  final String subTitle;
  final String image;
  final String backgroundImage;
}
