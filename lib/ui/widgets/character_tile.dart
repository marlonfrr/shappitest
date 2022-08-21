import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shappitest/core/characters/provider.dart';
import 'package:shappitest/core/characters/view_model.dart';
import 'package:shappitest/core/models/character.dart';
import 'package:shappitest/ui/contants.dart';
import 'package:shappitest/ui/views/character_detail.dart';

class CharacterTile extends ConsumerWidget {
  final Character character;
  const CharacterTile(this.character, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CharactersViewModel viewModel =
        ref.read<CharactersViewModel>(charactersViewModel.notifier);
    return GestureDetector(
      onTap: () => viewModel.pushCharacterDetail(context, character),
      child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  blurRadius: 0.1,
                  spreadRadius: 1,
                  color: Colors.black12,
                ),
              ]),
          child: Row(
            children: <Widget>[
              Hero(
                tag: character.name + character.id.toString(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    height: 96,
                    width: 96,
                    imageUrl: character.image,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(character.name, style: Typographies.h1),
                    Text(character.species),
                    Text(character.gender),
                  ],
                ),
              ),
              Icon(Icons.chevron_right)
            ],
          )),
    );
  }
}
