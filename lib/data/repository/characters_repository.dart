import 'package:bloc_cubit_test/data/models/characters.dart';
import 'package:bloc_cubit_test/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.fetchCharacters();
    return characters.map((characters) => Character.fromJson(characters)).toList();
  }
}
