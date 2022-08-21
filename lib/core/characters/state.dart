import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shappitest/core/models/character.dart';

class CharactersState {
  AsyncValue<List<Character>> characters;
  int page;
  bool fetching;

  CharactersState({
    this.characters = const AsyncValue.loading(),
    this.page = 0,
    this.fetching = false,
  });

  CharactersState copyWith({
    AsyncValue<List<Character>>? newCharacters,
    int? newPage,
    bool? newFetching,
  }) =>
      CharactersState(
        characters: newCharacters ?? characters,
        page: newPage ?? page,
        fetching: newFetching ?? fetching,
      );
}
