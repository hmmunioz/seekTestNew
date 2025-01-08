import 'package:flutter/material.dart';
import 'package:seektest/core/constants/app_assets.dart';

class LoadingWidget extends StatelessWidget {
  final double size;

  const LoadingWidget({
    super.key,
    this.size = 300.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Image.asset(
          AppAssets.loading,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
