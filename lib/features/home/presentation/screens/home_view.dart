import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions/controller_extension.dart';
import '../../../../core/helpers/functions/app_navigation.dart';
import '../../../../core/routing/app_routes_name.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home View'),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.logout),
      //       tooltip: 'Logout',
      //       onPressed: () async {
      //         // Handle logout logic here
      //         // For example, clear user session and navigate to sign-in screen
      //         await context.signOutCubit.signOutFromFirebase();
      //         //await context.signOutCubit.signOutFromGoogle();
      //         if (context.mounted) {
      //           await AppNavigation.navigateToAndClearStack(
      //             context,
      //             AppRoutesName.signInScreen,
      //           );
      //         }
      //       },
      //     ),
      //   ],
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to the Home View!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              // Handle logout logic here
              // For example, clear user session and navigate to sign-in screen
              await context.signOutCubit.signOutFromFirebase();
              //await context.signOutCubit.signOutFromGoogle();
              if (context.mounted) {
                await AppNavigation.navigateToAndClearStack(
                  context,
                  AppRoutesName.signInScreen,
                );
              }
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
