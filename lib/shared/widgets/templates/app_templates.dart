import 'package:flutter/material.dart';

import 'package:seektest/core/constants/app_assets.dart';
import 'package:seektest/shared/widgets/atoms/app_background.dart';

class AppTemplate extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;

  const AppTemplate({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          const AppBackground(
            imagePath: AppAssets.backgroundWelcome,
            overlayGradient: LinearGradient(
              colors: [
                Colors.black54,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          Center(child: body),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
