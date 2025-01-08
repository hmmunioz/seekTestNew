import 'package:flutter/material.dart';
import 'package:seektest/core/constants/app_strings.dart';
import 'package:seektest/shared/widgets/molecules/horizontal_filter_chips.dart';

List<FilterChipData> characterFilters(BuildContext context) {
  return [
    FilterChipData(title: AppStrings.filterAll(context), value: ''),
    FilterChipData(title: AppStrings.filterAlive(context), value: 'alive'),
    FilterChipData(title: AppStrings.filterDead(context), value: 'dead'),
    FilterChipData(title: AppStrings.filterUnknown(context), value: 'unknown'),
  ];
}
