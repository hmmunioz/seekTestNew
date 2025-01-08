import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/core/constants/app_strings.dart';
import 'package:seektest/features/characters/presentation/managers/characters_provider.dart';
import 'package:seektest/features/characters/presentation/pages/widgets/characters_list.dart';
import 'package:seektest/shared/widgets/atoms/error_widget_custom.dart';
import 'package:seektest/shared/widgets/atoms/loading_widget.dart';
import 'package:seektest/shared/widgets/atoms/search_custom_bar.dart';
import 'package:seektest/shared/widgets/templates/page_template.dart';

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
              if (query.isNotEmpty) {
                ref.read(charactersProvider.notifier).fetchCharacters(page: 1, nameFilter: query);
              } else if (query.isEmpty) {
                ref.read(charactersProvider.notifier).fetchCharacters();
              }
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
