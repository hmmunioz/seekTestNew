import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/app/providers/app_language_provider.dart';
import 'package:seektest/app/providers/app_theme_provider.dart';
import 'package:seektest/app/routes/app_router.dart';
import 'package:seektest/core/constants/app_styles.dart';
import 'package:seektest/core/localization/app_localization.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final themeMode = ref.watch(appThemeProvider);
        final locale = ref.watch(appLanguageProvider);

        return DevicePreview(
          enabled: false,
          builder: (context) => MaterialApp.router(
            title: 'Rick & Morty App',
            routerConfig: appRouter,
            locale: locale,
            builder: DevicePreview.appBuilder,
            localizationsDelegates: const [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('es'),
            ],
            theme: AppStyles.lightTheme(context),
            darkTheme: AppStyles.darkTheme(context),
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
