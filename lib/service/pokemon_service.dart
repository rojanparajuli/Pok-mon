import 'package:http/http.dart' as http;
import 'package:pokemon/constant/api.dart';
import 'package:pokemon/model/pokemon_model.dart';

class ApiService {
  Future<Pokemon> fetchPokemon(String name) async {
    final response = await http.get(Uri.parse('${Api.baseUrl}/$name'));
    print("Response: ${response.body}");
    print("Status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        try {
          return pokemonFromJson(response.body);
        } catch (e) {
          print("Error decoding JSON: $e");
          throw Exception('Failed to parse Pokémon data');
        }
      } else {
        throw Exception('Empty response from server');
      }
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }
}
