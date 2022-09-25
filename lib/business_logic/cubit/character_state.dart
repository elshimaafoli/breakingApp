part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoaded extends CharacterState {
  //? expect : have list of characters;
  final List<Character> characters;
  CharacterLoaded(this.characters);
}
