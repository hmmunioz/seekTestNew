import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/core/error/logger.dart';
import 'package:seektest/features/episodes/domain/usecases/get_episodes.dart';
import 'package:seektest/features/episodes/domain/entities/episode.dart';
import 'package:seektest/features/episodes/presentation/managers/get_episodes_provider.dart';

final episodesProvider = StateNotifierProvider<EpisodesNotifier, AsyncValue<List<Episode>>>((ref) {
  final getEpisodes = ref.read(getEpisodesUseCaseProvider);
  return EpisodesNotifier(getEpisodes);
});

class EpisodesNotifier extends StateNotifier<AsyncValue<List<Episode>>> {
  final GetEpisodes getEpisodes;
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoadingMore = false;

  String? _currentNameFilter;

  bool get hasMore => _hasMore;
  bool get isLoadingMore => _isLoadingMore;

  EpisodesNotifier(this.getEpisodes) : super(const AsyncValue.loading());

  Future<void> fetchEpisodes({
    int page = 1,
    String? name,
  }) async {
    try {
      if (page == 1) {
        _currentPage = 1;
        _hasMore = true;
        _currentNameFilter = name;
      }

      final result = await getEpisodes(GetEpisodesParams(
        page: page,
        name: _currentNameFilter,
      ));

      result.fold(
        (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
        (episodes) {
          if (page == 1) {
            state = AsyncValue.data(episodes);
          } else {
            state = AsyncValue.data([...state.value ?? [], ...episodes]);
          }
          _hasMore = episodes.length >= 20;
        },
      );
    } catch (e, stackTrace) {
      Logger.logError('Unexpected Notifier error: $e', stackTrace: stackTrace);
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  Future<void> fetchNextPage() async {
    if (!_hasMore || _isLoadingMore) return;
    _isLoadingMore = true;

    try {
      final result = await getEpisodes(GetEpisodesParams(
        page: _currentPage + 1,
        name: _currentNameFilter,
      ));

      result.fold(
        (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
        (newEpisodes) {
          if (newEpisodes.isEmpty) _hasMore = false;
          _currentPage++;
          state = AsyncValue.data([...state.value ?? [], ...newEpisodes]);
        },
      );
    } finally {
      _isLoadingMore = false;
    }
  }
}
