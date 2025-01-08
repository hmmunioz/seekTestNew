import 'package:seektest/shared/widgets/molecules/horizontal_filter_chips.dart';
import 'package:flutter/material.dart';
import 'package:seektest/core/constants/app_strings.dart';

List<FilterChipData> locationFilters(BuildContext context) {
  return [
    FilterChipData(title: AppStrings.filterAll(context), value: ''),
    FilterChipData(title: AppStrings.filterPlanet(context), value: 'Planet'),
    FilterChipData(title: AppStrings.filterSpaceStation(context), value: 'Space station'),
  ];
}
