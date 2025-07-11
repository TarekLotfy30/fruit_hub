import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/helpers/functions/app_spacing.dart';
import '../../../../core/translation/locale_keys.g.dart';
import 'build_social_media_section.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState(); 
    _initializeControllers();
  }

  /// Initialize text controllers and focus nodes
  /// Time Complexity: O(1)
  /// Space Complexity: O(1)
  void _initializeControllers() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPaddings.padding16.w,
          vertical: AppPaddings.padding24.w,
        ),
        child: Column(
          spacing: AppPaddings.padding16.h,
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUnfocus,
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                        254,
                      ), // RFC 5321 email length limit
                      FilteringTextInputFormatter.deny(
                        RegExp(r'\s'),
                      ), // No whitespace
                    ],
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    cursorHeight: 24.h,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.email.tr(),
                      prefixIcon: const Icon(AppIcons.email, size: 24),
                    ),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  verticalSpacing(Spacing.spacing16),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    inputFormatters: const [],
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),

                    textInputAction: TextInputAction.done,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    cursorHeight: 24.h,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.password.tr(),
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      prefixIcon: const Icon(AppIcons.password, size: 24),
                    ),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        LocaleKeys.forgot_password.tr(),
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                    ),
                  ),
                  verticalSpacing(Spacing.spacing16),
                  ElevatedButton(
                    onPressed: () async {},
                    child: Text(LocaleKeys.login.tr()),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.no_account.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.create_account.tr(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: <Widget>[
                const Expanded(child: Divider(endIndent: 18)),
                Text(
                  LocaleKeys.or.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),

                const Expanded(child: Divider(indent: 18)),
              ],
            ),

            const BuildSocialMediaSection(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
