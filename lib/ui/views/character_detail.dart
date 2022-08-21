import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shappitest/core/models/character.dart';
import 'package:shappitest/ui/contants.dart';

class CharacterDetail extends ConsumerStatefulWidget {
  final Character character;
  const CharacterDetail(this.character, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CharacterDetailState();
}

class _CharacterDetailState extends ConsumerState<CharacterDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Character',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colorss.mainYellow,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: Layout.large, horizontal: Layout.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: widget.character.name + widget.character.id.toString(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Layout.medium),
                  child: CachedNetworkImage(
                    height: Layout.xxxlarge,
                    width: Layout.xxxlarge,
                    imageUrl: widget.character.image,
                  ),
                ),
              ),
              Spacing.spacingV16,
              Text(
                widget.character.name,
                style: Typographies.h0,
              ),
              Spacing.spacingV16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Gender',
                      style: Typographies.b0,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(widget.character.gender),
                  ),
                ],
              ),
              Spacing.spacingV16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Status',
                      style: Typographies.b0,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(widget.character.status),
                  ),
                ],
              ),
              Spacing.spacingV16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Expanded(
                    child: Text(
                      'Episodes',
                      style: Typographies.b0,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: widget.character.episode.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) =>
                          Text(widget.character.episode.elementAt(index)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
