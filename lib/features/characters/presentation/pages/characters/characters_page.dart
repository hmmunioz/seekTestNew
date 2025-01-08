import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/core/constants/app_strings.dart';
import 'package:seektest/features/characters/presentation/managers/characters_filters.dart';
import 'package:seektest/features/characters/presentation/managers/characters_provider.dart';
import 'package:seektest/features/characters/presentation/pages/widgets/characters_list.dart';
import 'package:seektest/shared/widgets/atoms/error_widget_custom.dart';
import 'package:seektest/shared/widgets/atoms/loading_widget.dart';
import 'package:seektest/shared/widgets/atoms/search_custom_bar.dart';
import 'package:seektest/shared/widgets/molecules/horizontal_filter_chips.dart';
import 'package:seektest/shared/widgets/templates/page_template.dart';

final selectedFilterProvider = StateProvider<String?>((ref) => null);
final textFilterProvider = StateProvider<String?>((ref) => null);

class CharactersPage extends ConsumerStatefulWidget {
  const CharactersPage({super.key});

  @override
  ConsumerState<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends ConsumerState<CharactersPage> {
  @override
  void initState() {
    super.initState();
    ref.read(charactersProvider.notifier).fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final charactersState = ref.watch(charactersProvider);

    return PageTemplate(
      title: AppStrings.charactersTab(context),
      body: Column(
        children: [
          SearchBarCustom(
            hintText: '${AppStrings.search(context)} ${AppStrings.charactersCards(context)}...',
            onSearchChanged: (query) {
              ref.read(textFilterProvider.notifier).state = query;
              final status = ref.read(selectedFilterProvider);
              if (query.isNotEmpty) {
                ref.read(charactersProvider.notifier).fetchCharacters(
                      nameFilter: query,
                      status: status,
                    );
              } else if (query.isEmpty) {
                ref.read(charactersProvider.notifier).fetchCharacters(status: status);
              }
            },
          ),
          HorizontalFilterChips(
            filters: characterFilters(context),
            onFilterSelected: (filter) {
              final text = ref.read(textFilterProvider);
              ref.read(selectedFilterProvider.notifier).state = filter.isSelected ? filter.value : null;
              ref.read(charactersProvider.notifier).fetchCharacters(
                    nameFilter: text,
                    page: 1,
                    status: filter.value,
                  );
            },
            isSelected: (filter) {
              return ref.read(selectedFilterProvider) == filter.value;
            },
          ),
          Expanded(
            child: charactersState.when(
              data: (characters) {
                return CharactersList();
              },
              loading: () => const LoadingWidget(),
              error: (error, _) => ErrorWidgetCustom(
                message: '${AppStrings.unexpectedError(context)} $error',
                onRetry: () {
                  ref.read(charactersProvider.notifier).fetchCharacters();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
