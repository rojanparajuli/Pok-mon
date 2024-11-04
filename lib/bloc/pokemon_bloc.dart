

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_event.dart';
import 'package:pokemon/bloc/pokemon_state.dart';
import 'package:pokemon/service/pokemon_service.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final ApiService apiService;

  PokemonBloc(this.apiService) : super(PokemonInitial()) {
    on<SearchPokemon>((event, emit) async {
      emit(PokemonLoading());
      try {
        final pokemon = await apiService.fetchPokemon(event.pokemonName.toLowerCase());
        print("Pokemon data loaded: ${pokemon.name}"); 
        emit(PokemonLoaded(pokemon));
      } catch (e) {
        print("Error loading Pokemon: $e"); 
        emit(const PokemonError('Could not find Pokémon'));
      }
    });
  }
}
