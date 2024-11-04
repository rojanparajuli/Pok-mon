import 'package:http/http.dart' as http;
import 'package:pokemon/constant/api.dart';
import 'package:pokemon/model/pokemon_model.dart';

class ApiService {
  Future<Pokemon> fetchPokemon(String name) async {
    final response = await http.get(Uri.parse('${Api.baseUrl}/$name'));
    print("Response :${response.body}");
        print("Statuscode :${response.statusCode}");

    if (response.statusCode == 200) {
      return pokemonFromJson(response.body);
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }
}
