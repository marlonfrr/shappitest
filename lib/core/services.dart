import 'dart:convert';

import 'package:shappitest/core/end_points.dart';
import 'package:shappitest/core/models/character.dart';
import 'package:shappitest/core/repository.dart';

abstract class IRyMServices {
  Future<List<Character>?> getCharacters(String? gender, int? page);
}

class RyMServices implements IRyMServices {
  RyMServices._();

  static final RyMServices instance = RyMServices._();

  @override
  Future<List<Character>?> getCharacters(String? gender, int? page) async {
    try {
      var res = await Repository.instance.get(
        path: charactersPath,
        queryParams: gender != null ? 'gender=$gender' : null,
        page: page,
      );
      return List<Character>.from(jsonDecode(res.body)['results']
          .map((dynamic a) => Character.fromJson(a)));
    } on Exception catch (_) {
      rethrow;
    }
  }
}
