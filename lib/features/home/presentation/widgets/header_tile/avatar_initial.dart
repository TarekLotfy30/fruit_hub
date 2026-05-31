import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/header_cubit/home_header_cubit.dart';

class AvatarInitial extends StatelessWidget {
  const AvatarInitial({super.key, required this.state});

  final HomeHeaderState state;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24.r,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: switch (state) {
        HomeHeaderInitial() || HomeHeaderLoading() => SizedBox(
          height: 24.h,
          width: 24.w,
          child: const CircularProgressIndicator(),
        ),
        HomeHeaderSuccess(:final firstLetter) => Text(
          firstLetter,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        HomeHeaderError() => const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
      },
    );
  }
}
