import 'package:breaking_app/data/models/characters.dart';
import 'package:breaking_app/data/web_services/character_web_services.dart';

class CharacterRepo {
  CharacterWebServices characterWebServices;
  CharacterRepo(this.characterWebServices);
  Future<List<Character>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
