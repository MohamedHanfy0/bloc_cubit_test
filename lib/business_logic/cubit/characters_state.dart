part of 'characters_cubit.dart';

sealed class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

final class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;

  const  CharactersLoaded({required this.characters});

}
