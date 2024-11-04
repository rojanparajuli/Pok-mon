import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon/bloc/pokemon_event.dart';
import 'package:pokemon/bloc/pokemon_state.dart';


class PokemonSearchScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  PokemonSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter Pokémon Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final pokemonName = _controller.text.trim();
                if (pokemonName.isNotEmpty) {
                  context.read<PokemonBloc>().add(SearchPokemon(pokemonName));
                }
              },
              child: const Text('Search'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoading) {
                  return const CircularProgressIndicator();
                } else if (state is PokemonLoaded) {
                  // Display Pokémon data if loaded
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${state.pokemon.name}', style: const TextStyle(fontSize: 18)),
                      Text('Height: ${state.pokemon.height}', style: const TextStyle(fontSize: 18)),
                      Text('Weight: ${state.pokemon.weight}', style: const TextStyle(fontSize: 18)),
                      // Add more details as desired
                    ],
                  );
                } else if (state is PokemonError) {
                  return Text(state.message, style: const TextStyle(color: Colors.red));
                } else {
                  return const Text('Enter a Pokémon name to start');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
