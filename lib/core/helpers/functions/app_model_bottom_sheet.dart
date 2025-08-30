import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_corners.dart';
import '../../constants/app_elevation.dart';
import '../extensions/theme_extension.dart';

Future<void> openModalBottomSheet({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) async {
  await showModalBottomSheet(
    context: context,
    builder: builder, //el builder hena hat2ol 3ayzo wakhod height a
    useRootNavigator: true,
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: true, //tefta7 fulllscreen //allow scrolling
    useSafeArea: true,
    backgroundColor: context.colorScheme.surfaceContainerHigh,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: AppElevation.dialogElevation,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppCorners.smallBorderRadius.r),
      ),
    ),
  );
}



// https://www.youtube.com/watch?v=mI3QwwwZrn4&list=WL&index=59


// usage
/* 
DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppPaddings.padding16.w,
            vertical: AppPaddings.padding24.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: AppPaddings.padding16.h,
            children: [
              Expanded(
                child: Column(
                  spacing: AppPaddings.padding16.h,
                  children: [
                    const BuildDragHandleBar(),
                    // Title
                    Text(
                      LocaleKeys.terms_and_conditions.tr(),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Content
                    Text(
                      LocaleKeys.terms_content.tr(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),

              // Close button
              ElevatedButton(
                onPressed: () => AppNavigation.goBack(context),
                child: Text(LocaleKeys.close.tr()),
              ),
            ],
          ),
        );
      },
    );
*/






// usage : 
//  const SizedBox(
//               height: 20,
//             ),
//             Builder(      ///====>>>>>>>>>> using builder in the button
//               builder: (BuildContext context) {
//                 return ElevatedButton(
//                   onPressed: () {
//                     showBottomSheet(
//                       showDragHandle: true,
//                       backgroundColor: Colors.purple,
//                       context: context,
//                       builder: (context) {
//                         return Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 IconButton(
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                   icon: const Icon(
//                                     Icons.close,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const Text(
//                               "Hello in bottom sheet",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                   child: const Text("Click here"),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }