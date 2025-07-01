import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_padding.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddings.padding16.w,
        vertical: AppPaddings.padding24.w,
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          
        ],
      ),
    );
  }
}
