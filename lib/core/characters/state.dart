import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shappitest/core/models/character.dart';

class CharactersState {
  AsyncValue<List<Character>> characters;
  int page;
  int pageSize;
  String? nextPage;
  String? error;
  bool fetching;

  CharactersState({
    this.characters = const AsyncValue.loading(),
    this.page = 0,
    this.pageSize = 10,
    this.nextPage,
    this.error,
    this.fetching = false,
  });

  CharactersState copyWith({
    AsyncValue<List<Character>>? newCharacters,
    int? newPage,
    String? newNextPage,
    String? newError,
    bool? newFetching,
  }) =>
      CharactersState(
        characters: newCharacters ?? characters,
        page: newPage ?? page,
        nextPage: newNextPage ?? nextPage,
        error: newError ?? error,
        fetching: newFetching ?? fetching,
      );
}
