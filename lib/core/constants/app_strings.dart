import 'package:flutter/material.dart';
import '../localization/app_localization.dart';

class AppStrings {
  static String welcomeTitle(BuildContext context) => AppLocalization.of(context).translate('welcomeTitle');
  static String exploreMultiverse(BuildContext context) => AppLocalization.of(context).translate('exploreMultiverse');
  static String welcomeDescription(BuildContext context) => AppLocalization.of(context).translate('welcomeDescription');
  static String getStarted(BuildContext context) => AppLocalization.of(context).translate('getStarted');
  static String charactersTab(BuildContext context) => AppLocalization.of(context).translate('charactersTab');
  static String locationsTab(BuildContext context) => AppLocalization.of(context).translate('locationsTab');
  static String episodesTab(BuildContext context) => AppLocalization.of(context).translate('episodesTab');
  static String homeTitle(BuildContext context) => AppLocalization.of(context).translate('homeTitle');
  static String gender(BuildContext context) => AppLocalization.of(context).translate('gender');

  static String modeLightActivated(BuildContext context) => AppLocalization.of(context).translate('modeLightActivated');
  static String modeDarkActivated(BuildContext context) => AppLocalization.of(context).translate('modeDarkActivated');
  static String languageSwitchedToEnglish(BuildContext context) =>
      AppLocalization.of(context).translate('languageSwitchedToEnglish');
  static String languageSwitchedToSpanish(BuildContext context) =>
      AppLocalization.of(context).translate('languageSwitchedToSpanish');
  static String residents(BuildContext context) => AppLocalization.of(context).translate('residents');
  static String charactersCards(BuildContext context) => AppLocalization.of(context).translate('characters_cards');
  static String locationCards(BuildContext context) => AppLocalization.of(context).translate('location_cards');
  static String episodeCards(BuildContext context) => AppLocalization.of(context).translate('episode_cards');
  static String search(BuildContext context) => AppLocalization.of(context).translate('search');
  static String retry(BuildContext context) => AppLocalization.of(context).translate('retry');
  static String unexpectedError(BuildContext context) => AppLocalization.of(context).translate('unexpectedError');
  static String filterAll(BuildContext context) => AppLocalization.of(context).translate('filterAll');
  static String filterPlanet(BuildContext context) => AppLocalization.of(context).translate('filterPlanet');
  static String filterSpaceStation(BuildContext context) => AppLocalization.of(context).translate('filterSpaceStation');
  static String filterAlive(BuildContext context) => AppLocalization.of(context).translate('filterAlive');
  static String filterDead(BuildContext context) => AppLocalization.of(context).translate('filterDead');
  static String filterUnknown(BuildContext context) => AppLocalization.of(context).translate('filterUnknown');
}
