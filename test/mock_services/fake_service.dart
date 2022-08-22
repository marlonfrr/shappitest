import 'package:shappitest/core/models/character.dart';
import 'package:shappitest/core/services.dart';

class FakeRyMServices implements IRyMServices {
  final List<Map<String, dynamic>> mockCharacters;

  FakeRyMServices({required this.mockCharacters});

  @override
  Future<List<Character>?> getCharacters(String? gender, int? page) async {
    return Future(
        () => List.from(mockCharacters.map((e) => Character.fromJson(e))));
  }
}
