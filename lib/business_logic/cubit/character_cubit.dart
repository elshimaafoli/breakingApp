import 'package:bloc/bloc.dart';
import 'package:breaking_app/data/models/characters.dart';
import 'package:breaking_app/data/repository/character_repo.dart';
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterRepo characterRepo;
  List<Character> characters = [];
  CharacterCubit(this.characterRepo) : super(CharacterInitial());

  // recieve list of characters from repository
  List<Character> getAllCharacters() {
    characterRepo.getAllCharacters().then((characters) {
      emit(CharacterLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
