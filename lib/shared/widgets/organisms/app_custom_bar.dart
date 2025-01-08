import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/app/providers/app_language_provider.dart';
import 'package:seektest/app/providers/app_theme_provider.dart';
import 'package:seektest/core/constants/app_assets.dart';
import 'package:seektest/core/constants/app_strings.dart';

class AppCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppCustomAppBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      leadingWidth: 100,
      titleSpacing: 0,
      title: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: 1.0,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'RickAndMorty',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Consumer(
          builder: (context, ref, _) {
            final locale = ref.watch(appLanguageProvider);
            final isSpanish = locale.languageCode == 'es';

            return GestureDetector(
              onTap: () {
                ref.read(appLanguageProvider.notifier).toggleLanguage();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isSpanish
                        ? AppStrings.languageSwitchedToEnglish(context)
                        : AppStrings.languageSwitchedToSpanish(context)),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    isSpanish ? AppAssets.flagEs : AppAssets.flagEn,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isSpanish ? 'ESP' : 'EN',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      actions: [
        Consumer(
          builder: (context, ref, _) {
            final themeMode = ref.watch(appThemeProvider);

            return GestureDetector(
              onTap: () {
                ref.read(appThemeProvider.notifier).toggleTheme();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      themeMode == ThemeMode.dark
                          ? AppStrings.modeLightActivated(context)
                          : AppStrings.modeDarkActivated(context),
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Icon(
                    themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
                    key: ValueKey(themeMode),
                    size: 28,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            );
          },
        ),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor.withValues(alpha: 0.1),
              Theme.of(context).primaryColor.withValues(alpha: 0.05),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
