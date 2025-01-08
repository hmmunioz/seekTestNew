import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/core/constants/app_strings.dart';
import 'package:seektest/features/episodes/presentation/managers/episodes_provider.dart';
import 'package:seektest/shared/widgets/atoms/error_widget_custom.dart';
import 'package:seektest/shared/widgets/atoms/loading_widget.dart';
import 'package:seektest/shared/widgets/atoms/search_custom_bar.dart';
import 'package:seektest/shared/widgets/templates/page_template.dart';
import '../widgets/episodes_list.dart';

class EpisodesPage extends ConsumerStatefulWidget {
  const EpisodesPage({super.key});

  @override
  ConsumerState<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends ConsumerState<EpisodesPage> {
  @override
  void initState() {
    super.initState();
    ref.read(episodesProvider.notifier).fetchEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    final episodesState = ref.watch(episodesProvider);

    return PageTemplate(
      title: AppStrings.episodesTab(context),
      body: Column(
        children: [
          SearchBarCustom(
            hintText: '${AppStrings.search(context)} ${AppStrings.episodeCards(context)}...',
            onSearchChanged: (query) {
              if (query.isNotEmpty) {
                ref.read(episodesProvider.notifier).fetchEpisodes(
                      name: query,
                    );
              } else if (query.isEmpty) {
                ref.read(episodesProvider.notifier).fetchEpisodes();
              }
            },
          ),
          Expanded(
            child: episodesState.when(
              data: (episodes) {
                return EpisodesList();
              },
              loading: () => const LoadingWidget(),
              error: (error, _) => ErrorWidgetCustom(
                message: '${AppStrings.unexpectedError(context)} $error',
                onRetry: () {
                  ref.read(episodesProvider.notifier).fetchEpisodes();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
