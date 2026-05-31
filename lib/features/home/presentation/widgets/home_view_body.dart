// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'header_tile/header_tile.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: const HeaderTile(),
          ),
        ),
        const SliverFillRemaining(
          hasScrollBody: false, // Prevents scroll view sizing conflicts
          child: Center(child: Text('Welcome to the Home View!')),
        ),
      ],
    );
  }
}
