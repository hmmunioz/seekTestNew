import 'package:flutter/material.dart';
import 'package:seektest/core/constants/app_strings.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedLabelStyle: TextStyle(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        color: Theme.of(context).unselectedWidgetColor,
      ),
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).unselectedWidgetColor,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: AppStrings.charactersTab(context),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.place),
          label: AppStrings.locationsTab(context),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.tv),
          label: AppStrings.episodesTab(context),
        ),
      ],
    );
  }
}
