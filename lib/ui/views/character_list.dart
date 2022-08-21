import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shappitest/core/characters/enum.dart';
import 'package:shappitest/core/characters/provider.dart';
import 'package:shappitest/core/characters/state.dart';
import 'package:shappitest/core/characters/view_model.dart';
import 'package:shappitest/core/models/character.dart';
import 'package:shappitest/ui/contants.dart';
import 'package:shappitest/ui/widgets/bottom_bar.dart';
import 'package:shappitest/ui/widgets/character_tile.dart';

class CharactersListView extends ConsumerStatefulWidget {
  const CharactersListView({Key? key}) : super(key: key);

  @override
  ConsumerState<CharactersListView> createState() => _CharactersListViewState();
}

class _CharactersListViewState extends ConsumerState<CharactersListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CharactersState state = ref.watch<CharactersState>(charactersViewModel);
    CharactersViewModel viewModel =
        ref.read<CharactersViewModel>(charactersViewModel.notifier);
    AsyncValue<List<Character>> charactersState = state.characters;
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      var nextPageTrigger = 0.99 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        if (!state.fetching) {
          viewModel.requestMoreCharacters();
        }
      }
    });
    return Scaffold(
      bottomNavigationBar: GenderDropDownBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: charactersState.when(data: (characters) {
            return ListView.builder(
              itemCount: characters.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) =>
                  CharacterTile(characters[index]),
            );
          }, error: (err, st) {
            return const Text('error');
          }, loading: () {
            return const Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }
}
