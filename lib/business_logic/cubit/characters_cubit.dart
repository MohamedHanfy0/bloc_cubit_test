import 'package:bloc/bloc.dart';
import 'package:bloc_cubit_test/data/models/characters.dart';
import 'package:bloc_cubit_test/data/repository/characters_repository.dart';
import 'package:equatable/equatable.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  late List<Character> characters;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacers() {
    try {
      charactersRepository.getAllCharacters().then((characters) {
        emit(CharactersLoaded(characters: characters));
        characters = characters;
      });
      return characters;
    } catch (e) {
      return [];
    }
  }
}
