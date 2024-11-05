import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokemon/bloc/pokemon/pokemon_event.dart';
import 'package:pokemon/bloc/pokemon/pokemon_state.dart';

class PokemonSearchScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  PokemonSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokémon Search',
          style: GoogleFonts.pressStart2p(
            fontSize: 20,
            color: Colors.yellow,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.15,
            child: Image.asset(
              'assets/Pokemon Pokeball Sticker.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter Pokémon Name',
                      labelStyle: GoogleFonts.pressStart2p(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.red,
                      ),
                    ),
                    style: GoogleFonts.pressStart2p(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      textStyle: GoogleFonts.pressStart2p(fontSize: 14),
                    ),
                    onPressed: () {
                      final pokemonName = _controller.text.trim();
                      if (pokemonName.isNotEmpty) {
                        context
                            .read<PokemonBloc>()
                            .add(SearchPokemon(pokemonName));
                      }
                    },
                    child: const Text('Search Pokémon'),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<PokemonBloc, PokemonState>(
                    builder: (context, state) {
                      if (state is PokemonLoading) {
                        return Center(
                          child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Lottie.asset('assets/loading.json')),
                        );
                      } else if (state is PokemonLoaded) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.yellow.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.red, width: 2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.network(
                                  state.pokemon.sprites!.frontShiny.toString(),
                                  errorBuilder: (BuildContext context,
                                      Object error, StackTrace? stackTrace) {
                                    return const Text('Failed to load image');
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Name: ${state.pokemon.name}',
                                style: GoogleFonts.pressStart2p(
                                  fontSize: 14,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Height: ${state.pokemon.height}',
                                style: GoogleFonts.pressStart2p(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Weight: ${state.pokemon.weight}',
                                style: GoogleFonts.pressStart2p(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Base Experience: ${state.pokemon.baseExperience}',
                                style: GoogleFonts.pressStart2p(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Species: ${state.pokemon.species?.name}',
                                style: GoogleFonts.pressStart2p(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Abilities: ${state.pokemon.abilities?.map((e) => e.ability?.name)}',
                                style: GoogleFonts.pressStart2p(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Type: ${state.pokemon.types?.map((e) => e.type?.name)}',
                                style: GoogleFonts.pressStart2p(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Moves: ${state.pokemon.moves?.map((e) => e.move?.name ?? '')}',
                                style: GoogleFonts.pressStart2p(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Stats: ${state.pokemon.stats?.map((e) => e.stat?.name ?? '')}',
                                style: GoogleFonts.pressStart2p(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Past Type: ${state.pokemon.pastTypes?.map((e) => e ?? '').join(', ') ?? ''}',
                                style: GoogleFonts.pressStart2p(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Item Held: ${state.pokemon.heldItems?.map((e) => e.item?.name ?? '')}',
                                style: GoogleFonts.pressStart2p(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Game Index: ${state.pokemon.gameIndices?.map((e) => e.gameIndex ?? '')}',
                                style: GoogleFonts.pressStart2p(fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      } else if (state is PokemonError) {
                        return Text(
                          state.message,
                          style: GoogleFonts.pressStart2p(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        );
                      } else {
                        return Center(
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Enter a Pokémon name to start',
                                textStyle: GoogleFonts.pressStart2p(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                                speed: const Duration(milliseconds: 100),
                              ),
                            ],
                            repeatForever: true,
                            pause: const Duration(milliseconds: 1000),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
