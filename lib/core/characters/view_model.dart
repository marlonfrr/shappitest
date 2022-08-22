import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shappitest/core/characters/enum.dart';
import 'package:shappitest/core/characters/provider.dart';
import 'package:shappitest/core/characters/state.dart';
import 'package:shappitest/core/models/character.dart';
import 'package:shappitest/ui/views/character_detail.dart';

class CharactersViewModel extends StateNotifier<CharactersState> {
  final StateNotifierProviderRef<CharactersViewModel, CharactersState> ref;

  CharactersViewModel(this.ref) : super(CharactersState()) {
    getCharacters();
  }

  void getCharacters({int? page = 0}) async {
    final CharactersGender? gender =
        ref.watch<CharactersGender?>(genderProvider);
    try {
      List<Character>? characters =
          await ref.read(serviceProvider).getCharacters(gender?.value, page);
      final currentCharacters = state.characters.asData?.value ?? [];
      currentCharacters.addAll(characters!);
      state = state.copyWith(newCharacters: AsyncValue.data(currentCharacters));
      state = state.copyWith(newFetching: false);
    } on Exception catch (_) {
      state = state.copyWith(
          newCharacters: const AsyncValue.error('An error ocurred'));
    }
  }

  void requestMoreCharacters() {
    state = state.copyWith(newFetching: true);
    getCharacters(page: state.page + 1);
    state = state.copyWith(newPage: state.page + 1);
  }

  void switchGenderFilter({CharactersGender? newGender}) async {
    ref.read(genderProvider.notifier).state = newGender;
  }

  void pushCharacterDetail(BuildContext context, Character character) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => CharacterDetail(character)));
  }
}
