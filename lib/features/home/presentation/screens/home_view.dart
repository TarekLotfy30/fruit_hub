import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions/controller_extension.dart';
import '../../../../core/helpers/functions/app_navigation.dart';
import '../../../../core/routing/app_routes_name.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // Handle logout logic here
              // For example, clear user session and navigate to sign-in screen
              await context.signOutCubit.signOut();
              if (context.mounted) {
                AppNavigation.navigateToAndClearStack(
                  context,
                  AppRoutesName.signInScreen,
                );
              }
            },
          ),
        ],
      ),
      body: const Center(child: Text('Welcome to the Home View!')),
    );
  }
}
