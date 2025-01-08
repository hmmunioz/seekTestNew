import 'package:flutter/material.dart';

class HorizontalFilterChips extends StatelessWidget {
  final List<FilterChipData> filters;
  final ValueChanged<FilterChipData> onFilterSelected;

  final bool Function(FilterChipData filter)? isSelected;

  const HorizontalFilterChips({
    super.key,
    required this.filters,
    required this.onFilterSelected,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters
            .map(
              (filter) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: FilterChip(
                  label: Text(filter.title),
                  selected: isSelected?.call(filter) ?? filter.isSelected,
                  onSelected: (isSelected) {
                    onFilterSelected(filter.copyWith(isSelected: isSelected));
                  },
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color:
                        (isSelected?.call(filter) ?? filter.isSelected) ? Colors.white : Theme.of(context).primaryColor,
                  ),
                  selectedColor: Theme.of(context).primaryColor,
                  backgroundColor: (isSelected?.call(filter) ?? filter.isSelected)
                      ? Theme.of(context).primaryColor.withOpacity(0.8)
                      : Theme.of(context).scaffoldBackgroundColor,
                  side: BorderSide(
                    color: (isSelected?.call(filter) ?? filter.isSelected)
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).dividerColor,
                    width: 1.5,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class FilterChipData {
  final String title;
  final String? value;
  final bool isSelected;

  const FilterChipData({
    required this.title,
    this.value,
    this.isSelected = false,
  });

  FilterChipData copyWith({bool? isSelected}) {
    return FilterChipData(
      title: title,
      value: value,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
