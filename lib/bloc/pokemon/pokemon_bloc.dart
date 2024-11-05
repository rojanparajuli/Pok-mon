import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon/pokemon_event.dart';
import 'package:pokemon/bloc/pokemon/pokemon_state.dart';
import 'package:pokemon/service/pokemon_service.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final ApiService apiService;

  PokemonBloc(this.apiService) : super(PokemonInitial()) {
    on<SearchPokemon>((event, emit) async {
      emit(PokemonLoading());
      try {
        final pokemon =
            await apiService.fetchPokemon(event.pokemonName.toLowerCase());
        print("Pokemon data loaded: ${pokemon.name}");
        print("pokemon image is ${pokemon.sprites?.frontShiny.toString()}");
        emit(PokemonLoaded(pokemon: pokemon));
      } catch (e) {
        print("Error loading Pokemon: $e");
        emit(PokemonError(e.toString()));
      }
    });
  }
}
