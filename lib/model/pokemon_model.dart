import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  List<Ability>? abilities;
  int? baseExperience;
  Cries? cries;
  List<Species>? forms;
  List<GameIndex>? gameIndices;
  int? height;
  List<HeldItem>? heldItems;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<Move>? moves;
  String? name;
  int? order;
  List<dynamic>? pastAbilities;
  List<dynamic>? pastTypes;
  Species? species;
  Sprites? sprites;
  List<Stat>? stats;
  List<Type>? types;
  int? weight;

  Pokemon({
    this.abilities,
    this.baseExperience,
    this.cries,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastAbilities,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        cries: Cries.fromJson(json["cries"]),
        forms:
            List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
        gameIndices: List<GameIndex>.from(
            json["game_indices"].map((x) => GameIndex.fromJson(x))),
        height: json["height"],
        heldItems: List<HeldItem>.from(
            json["held_items"].map((x) => HeldItem.fromJson(x))),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        name: json["name"],
        order: json["order"],
        pastAbilities: List<dynamic>.from(json["past_abilities"].map((x) => x)),
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: Species.fromJson(json["species"]),
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": abilities != null
            ? List<dynamic>.from(abilities!.map((x) => x.toJson()))
            : [],
        "base_experience": baseExperience,
        "cries": cries?.toJson(),
        "forms": forms != null
            ? List<dynamic>.from(forms!.map((x) => x.toJson()))
            : [],
        "game_indices": gameIndices != null
            ? List<dynamic>.from(gameIndices!.map((x) => x.toJson()))
            : [],
        "height": height,
        "held_items": heldItems != null
            ? List<dynamic>.from(heldItems!.map((x) => x.toJson()))
            : [],
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": moves != null
            ? List<dynamic>.from(moves!.map((x) => x.toJson()))
            : [],
        "name": name,
        "order": order,
        "past_abilities": pastAbilities != null
            ? List<dynamic>.from(pastAbilities!.map((x) => x))
            : [],
        "past_types": pastTypes != null
            ? List<dynamic>.from(pastTypes!.map((x) => x))
            : [],
        "species": species?.toJson(),
        "sprites": sprites?.toJson(),
        "stats": stats != null
            ? List<dynamic>.from(stats!.map((x) => x.toJson()))
            : [],
        "types": types != null
            ? List<dynamic>.from(types!.map((x) => x.toJson()))
            : [],
        "weight": weight,
      };
}

class Ability {
  Species? ability;
  bool? isHidden;
  int? slot;

  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability?.toJson() ?? {},
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  String? name;
  String? url;

  Species({
    this.name,
    this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (name != null) data["name"] = name;
    if (url != null) data["url"] = url;
    return data;
  }
}

class Cries {
  String? latest;
  String? legacy;

  Cries({
    this.latest,
    this.legacy,
  });

  factory Cries.fromJson(Map<String, dynamic> json) => Cries(
        latest: json["latest"],
        legacy: json["legacy"],
      );

  Map<String, dynamic> toJson() => {
        "latest": latest,
        "legacy": legacy,
      };
}

class GameIndex {
  int? gameIndex;
  Species? version;

  GameIndex({
    this.gameIndex,
    this.version,
  });

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: Species.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (gameIndex != null) data["game_index"] = gameIndex;
    if (version != null) data["version"] = version?.toJson();
    return data;
  }
}

class HeldItem {
  Species? item;
  List<VersionDetail>? versionDetails;

  HeldItem({
    this.item,
    this.versionDetails,
  });

  factory HeldItem.fromJson(Map<String, dynamic> json) => HeldItem(
        item: Species.fromJson(json["item"]),
        versionDetails: List<VersionDetail>.from(
            json["version_details"].map((x) => VersionDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "item": item?.toJson(),
        "version_details":
            List<dynamic>.from(versionDetails!.map((x) => x.toJson())),
      };
}

class VersionDetail {
  int? rarity;
  Species? version;

  VersionDetail({
    this.rarity,
    this.version,
  });

  factory VersionDetail.fromJson(Map<String, dynamic> json) => VersionDetail(
        rarity: json["rarity"],
        version: Species.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "rarity": rarity,
        "version": version?.toJson(),
      };
}

class Move {
  Species? move;
  List<VersionGroupDetail>? versionGroupDetails;

  Move({
    this.move,
    this.versionGroupDetails,
  });

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(
            json["version_group_details"]
                .map((x) => VersionGroupDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "move": move?.toJson(),
        "version_group_details":
            List<dynamic>.from(versionGroupDetails!.map((x) => x.toJson())),
      };
}

class VersionGroupDetail {
  int? levelLearnedAt;
  Species? moveLearnMethod;
  Species? versionGroup;

  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: Species.fromJson(json["move_learn_method"]),
        versionGroup: Species.fromJson(json["version_group"]),
      );

  Map<String, dynamic> toJson() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod?.toJson(),
        "version_group": versionGroup?.toJson(),
      };
}

class GenerationV {
  Sprites? blackWhite;

  GenerationV({
    this.blackWhite,
  });

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite: Sprites.fromJson(json["black-white"]),
      );

  Map<String, dynamic> toJson() => {
        "black-white": blackWhite?.toJson(),
      };
}

class GenerationIv {
  Sprites? diamondPearl;
  Sprites? heartgoldSoulsilver;
  Sprites? platinum;

  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        // diamondPearl: Sprites.fromJson(json["diamond-pearl"]),
        heartgoldSoulsilver: Sprites.fromJson(json["heartgold-soulsilver"]),
        platinum: Sprites.fromJson(json["platinum"]),
      );

  Map<String, dynamic> toJson() => {
        "diamond-pearl": diamondPearl?.toJson(),
        "heartgold-soulsilver": heartgoldSoulsilver?.toJson(),
        "platinum": platinum?.toJson(),
      };
}

class Versions {
  GenerationI? generationI;
  GenerationIi? generationIi;
  GenerationIii? generationIii;
  GenerationIv? generationIv;
  GenerationV? generationV;
  Map<String, Home>? generationVi;
  GenerationVii? generationVii;
  GenerationViii? generationViii;

  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromJson(json["generation-i"]),
        generationIi: GenerationIi.fromJson(json["generation-ii"]),
        generationIii: GenerationIii.fromJson(json["generation-iii"]),
        // generationIv: GenerationIv.fromJson(json["generation-iv"]),
        generationV: GenerationV.fromJson(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"])
            .map((k, v) => MapEntry<String, Home>(k, Home.fromJson(v))),
        generationVii: GenerationVii.fromJson(json["generation-vii"]),
        generationViii: GenerationViii.fromJson(json["generation-viii"]),
      );

  Map<String, dynamic> toJson() => {
        "generation-i": generationI?.toJson(),
        "generation-ii": generationIi?.toJson(),
        "generation-iii": generationIii?.toJson(),
        "generation-iv": generationIv?.toJson(),
        "generation-v": generationV?.toJson(),
        "generation-vi": Map.from(generationVi!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "generation-vii": generationVii?.toJson(),
        "generation-viii": generationViii?.toJson(),
      };
}

class Other {
  DreamWorld? dreamWorld;
  Home? home;
  OfficialArtwork? officialArtwork;
  Sprites? showdown;

  Other({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
    this.showdown,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromJson(json["dream_world"]),
        home: Home.fromJson(json["home"]),
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
        // showdown: Sprites.fromJson(json["showdown"]),
      );

  Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld?.toJson(),
        "home": home?.toJson(),
        "official-artwork": officialArtwork?.toJson(),
        "showdown": showdown?.toJson(),
      };
}

class Sprites {
  String? backDefault;
  dynamic backFemale;
  String? backShiny;
  dynamic backShinyFemale;
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;
  Other? other;
  Versions? versions;
  Sprites? animated;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: json["other"] != null ? Other.fromJson(json["other"]) : null,
        versions: json["versions"] != null
            ? Versions.fromJson(json["versions"])
            : null,
        animated: json["animated"] != null
            ? Sprites.fromJson(json["animated"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault ?? '',
        "back_female": backFemale ?? '',
        "back_shiny": backShiny ?? '',
        "back_shiny_female": backShinyFemale ?? '',
        "front_default": frontDefault ?? '',
        "front_female": frontFemale ?? '',
        "front_shiny": frontShiny ?? '',
        "front_shiny_female": frontShinyFemale ?? '',
        "other": other?.toJson() ?? {},
        "versions": versions?.toJson() ?? {},
        "animated": animated?.toJson() ?? {},
      };
}

class GenerationI {
  RedBlue? redBlue;
  RedBlue? yellow;

  GenerationI({
    this.redBlue,
    this.yellow,
  });

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromJson(json["red-blue"]),
        yellow: RedBlue.fromJson(json["yellow"]),
      );

  Map<String, dynamic> toJson() => {
        "red-blue": redBlue?.toJson(),
        "yellow": yellow?.toJson(),
      };
}

class RedBlue {
  String? backDefault;
  String? backGray;
  String? backTransparent;
  String? frontDefault;
  String? frontGray;
  String? frontTransparent;

  RedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_gray": frontGray,
        "front_transparent": frontTransparent,
      };
}

class GenerationIi {
  Crystal? crystal;
  Gold? gold;
  Gold? silver;

  GenerationIi({
    this.crystal,
    this.gold,
    this.silver,
  });

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromJson(json["crystal"]),
        gold: Gold.fromJson(json["gold"]),
        silver: Gold.fromJson(json["silver"]),
      );

  Map<String, dynamic> toJson() => {
        "crystal": crystal?.toJson(),
        "gold": gold?.toJson(),
        "silver": silver?.toJson(),
      };
}

class Crystal {
  String? backDefault;
  String? backShiny;
  String? backShinyTransparent;
  String? backTransparent;
  String? frontDefault;
  String? frontShiny;
  String? frontShinyTransparent;
  String? frontTransparent;

  Crystal({
    this.backDefault,
    this.backShiny,
    this.backShinyTransparent,
    this.backTransparent,
    this.frontDefault,
    this.frontShiny,
    this.frontShinyTransparent,
    this.frontTransparent,
  });

  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        backShinyTransparent: json["back_shiny_transparent"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontShinyTransparent: json["front_shiny_transparent"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "back_shiny_transparent": backShinyTransparent,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_shiny_transparent": frontShinyTransparent,
        "front_transparent": frontTransparent,
      };
}

class Gold {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  String? frontTransparent;

  Gold({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault ?? '',
        "back_shiny": backShiny ?? '',
        "front_default": frontDefault ?? '',
        "front_shiny": frontShiny ?? '',
        "front_transparent": frontTransparent ?? '',
      };
}

class GenerationIii {
  OfficialArtwork? emerald;
  Gold? fireredLeafgreen;
  Gold? rubySapphire;

  GenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald: OfficialArtwork.fromJson(json["emerald"]),
        fireredLeafgreen: Gold.fromJson(json["firered-leafgreen"]),
        rubySapphire: Gold.fromJson(json["ruby-sapphire"]),
      );

  Map<String, dynamic> toJson() => {
        "emerald": emerald?.toJson(),
        "firered-leafgreen": fireredLeafgreen?.toJson(),
        "ruby-sapphire": rubySapphire?.toJson(),
      };
}

class OfficialArtwork {
  String? frontDefault;
  String? frontShiny;

  OfficialArtwork({
    this.frontDefault,
    this.frontShiny,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Home {
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  Home({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class GenerationVii {
  DreamWorld? icons;
  Home? ultraSunUltraMoon;

  GenerationVii({
    this.icons,
    this.ultraSunUltraMoon,
  });

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromJson(json["icons"]),
        ultraSunUltraMoon: Home.fromJson(json["ultra-sun-ultra-moon"]),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons?.toJson(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon?.toJson(),
      };
}

class DreamWorld {
  String? frontDefault;
  dynamic frontFemale;

  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}

class GenerationViii {
  DreamWorld? icons;

  GenerationViii({
    this.icons,
  });

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons: DreamWorld.fromJson(json["icons"]),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons?.toJson(),
      };
}

class Stat {
  int? baseStat;
  int? effort;
  Species? stat;

  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat?.toJson(),
      };
}

class Type {
  int? slot;
  Species? type;

  Type({
    this.slot,
    this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type?.toJson(),
      };
}
