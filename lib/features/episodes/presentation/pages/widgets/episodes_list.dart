import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/core/constants/app_strings.dart';
import 'package:seektest/features/episodes/domain/entities/episode.dart';
import 'package:seektest/features/episodes/presentation/managers/episodes_provider.dart';
import 'package:seektest/shared/widgets/atoms/error_widget_custom.dart';
import 'package:seektest/shared/widgets/atoms/loading_widget.dart';
import 'package:seektest/shared/widgets/molecules/text_info_card.dart';
import 'package:seektest/shared/widgets/organisms/infinite_scroll_list.dart';

class EpisodesList extends ConsumerStatefulWidget {
  const EpisodesList({super.key});

  @override
  ConsumerState<EpisodesList> createState() => _EpisodesListState();
}

class _EpisodesListState extends ConsumerState<EpisodesList> {
  late final episodesProviderNotifier = ref.read(episodesProvider.notifier);

  @override
  Widget build(BuildContext context) {
    final episodesState = ref.watch(episodesProvider);

    return episodesState.when(
      data: (episodes) {
        return InfiniteScrollList<Episode>(
          itemCount: episodes.length,
          itemBuilder: (context, index) {
            final episode = episodes[index];
            return TextInfoCard(
              title: episode.name,
              subtitleLeft: episode.episodeCode,
              subtitleRight: episode.airDate,
              additionalInfo: '${episode.characterIds.length} ${AppStrings.charactersCards(context)}',
              icon: Icons.person,
            );
          },
          onFetchMore: () => episodesProviderNotifier.fetchNextPage(),
          isLoadingMore: episodesProviderNotifier.isLoadingMore,
          hasMore: episodesProviderNotifier.hasMore,
        );
      },
      loading: () => const LoadingWidget(),
      error: (error, _) => ErrorWidgetCustom(
        message: '${AppStrings.unexpectedError(context)} $error',
        onRetry: () {
          ref.read(episodesProvider.notifier).fetchEpisodes();
        },
      ),
    );
  }
}
