import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seektest/core/constants/app_assets.dart';
import 'package:seektest/core/constants/app_strings.dart';
import 'package:seektest/shared/widgets/atoms/big_title.dart';
import 'package:seektest/shared/widgets/atoms/circular_button.dart';
import 'package:seektest/shared/widgets/atoms/small_title.dart';
import 'package:seektest/shared/widgets/organisms/logo_whit_text.dart';
import 'package:seektest/shared/widgets/templates/app_templates.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoWithText(
            imagePath: AppAssets.logoPath,
            text: AppStrings.welcomeTitle(context),
          ),
          const SizedBox(height: 24),
          BigTitle(
            text: AppStrings.exploreMultiverse(context),
          ),
          const SizedBox(height: 16),
          SmallTitle(
            text: AppStrings.welcomeDescription(context),
          ),
          const SizedBox(height: 32),
          CircularButton(
            onPressed: () {
              context.pushNamed('characters_page');
            },
            icon: Icons.arrow_forward,
            label: AppStrings.getStarted(context),
          ),
        ],
      ),
    );
  }
}
