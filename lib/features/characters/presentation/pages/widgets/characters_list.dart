import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/core/constants/app_strings.dart';
import 'package:seektest/features/characters/domain/entities/character.dart';
import 'package:seektest/features/characters/presentation/managers/characters_provider.dart';
import 'package:seektest/shared/widgets/atoms/error_widget_custom.dart';
import 'package:seektest/shared/widgets/atoms/loading_widget.dart';

import 'package:seektest/shared/widgets/molecules/image_info_card.dart';
import 'package:seektest/shared/widgets/organisms/infinite_scroll_list.dart';

class CharactersList extends ConsumerStatefulWidget {
  const CharactersList({super.key});

  @override
  ConsumerState<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends ConsumerState<CharactersList> {
  late final charactersProviderNotifier = ref.read(charactersProvider.notifier);

  @override
  Widget build(BuildContext context) {
    final charactersState = ref.watch(charactersProvider);

    return charactersState.when(
      data: (characters) {
        return InfiniteScrollList<Character>(
          itemCount: characters.length,
          itemBuilder: (context, index) {
            final character = characters[index];
            return ImageInfoCard(
              title: character.name,
              subtitle: "${AppStrings.gender(context)} ${character.gender}",
              description: character.status,
              imageUrl: character.image,
            );
          },
          onFetchMore: () => charactersProviderNotifier.fetchNextPage(),
          isLoadingMore: charactersProviderNotifier.isLoadingMore,
          hasMore: charactersProviderNotifier.hasMore,
        );
      },
      loading: () => const LoadingWidget(),
      error: (error, _) => ErrorWidgetCustom(
        message: '${AppStrings.unexpectedError(context)} $error',
        onRetry: () {
          ref.read(charactersProvider.notifier).fetchCharacters();
        },
      ),
    );
  }
}
