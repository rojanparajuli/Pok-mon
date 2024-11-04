import 'package:equatable/equatable.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class SearchPokemon extends PokemonEvent {
  final String pokemonName;

  const SearchPokemon(this.pokemonName);

  @override
  List<Object> get props => [pokemonName];
}
