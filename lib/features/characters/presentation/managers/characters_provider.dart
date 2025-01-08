import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/core/error/logger.dart';
import 'package:seektest/features/characters/domain/usecases/get_caracters.dart';
import 'package:seektest/features/characters/domain/entities/character.dart';
import 'package:seektest/features/characters/presentation/managers/get_characters_provider.dart';

final charactersProvider = StateNotifierProvider<CharactersNotifier, AsyncValue<List<Character>>>((ref) {
  final getCharacters = ref.read(getCharactersUseCaseProvider);
  return CharactersNotifier(getCharacters);
});

class CharactersNotifier extends StateNotifier<AsyncValue<List<Character>>> {
  final GetCharacters getCharacters;
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  String? _currentNameFilter;
  String? _currentStatusFilter;
  bool get hasMore => _hasMore;
  bool get isLoadingMore => _isLoadingMore;

  CharactersNotifier(this.getCharacters) : super(const AsyncValue.loading());

  Future<void> fetchCharacters({
    int page = 1,
    String? nameFilter,
    String? status,
  }) async {
    try {
      if (nameFilter != null && nameFilter.isNotEmpty || status != null) {
        _currentPage = 1;
        _hasMore = true;
        _currentNameFilter = nameFilter;

        _currentStatusFilter = status;
      }

      final result = await getCharacters(GetCharactersParams(
        page: page,
        nameFilter: nameFilter,
        status: _currentStatusFilter,
      ));
      result.fold(
        (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
        (characters) {
          if (page == 1) {
            state = AsyncValue.data(characters);
          } else {
            state = AsyncValue.data([...state.value ?? [], ...characters]);
          }
          _hasMore = characters.length >= 20;
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
      final result = await getCharacters(
          GetCharactersParams(page: _currentPage + 1, nameFilter: _currentNameFilter, status: _currentStatusFilter));
      result.fold(
        (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
        (newCharacters) {
          if (newCharacters.isEmpty) _hasMore = false;
          _currentPage++;
          state = AsyncValue.data([...state.value ?? [], ...newCharacters]);
        },
      );
    } finally {
      _isLoadingMore = false;
    }
  }
}
