import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shappitest/core/characters/enum.dart';
import 'package:shappitest/core/characters/state.dart';
import 'package:shappitest/core/characters/view_model.dart';
import 'package:shappitest/core/services.dart';

final StateNotifierProvider<CharactersViewModel, CharactersState>
    charactersViewModel =
    StateNotifierProvider<CharactersViewModel, CharactersState>(
  CharactersViewModel.new,
);

final StateProvider<CharactersGender?> genderProvider =
    StateProvider<CharactersGender?>((ref) => null);

final serviceProvider = Provider<IRyMServices>((ref) => RyMServices.instance);
