import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:pokedex/Enums/api_enum.dart';
import 'package:pokedex/Models/poke_api.dart';

part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeApi? pokeApi;

  @action
  fecthPokemonList() {
    pokeApi = null;
    loadPokeApi().then((pokeList) {
      pokeApi = pokeList;
    });
  }

  @action
  getPokemon({int? index}) {
    return pokeApi!.pokemon[index ?? 0];
  }

  @action
  Widget getImage({String? number}) {
    return CachedNetworkImage(
        placeholder: (context, url) => new Container(color: Colors.transparent,),
        imageUrl: "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$number.png"
    );
  }
}

Future<PokeApi> loadPokeApi() async {
  try {
    final response = await http.get(Uri.parse(ApiEnum.BASE_URL));
    var decodeJson = jsonDecode(response.body);
    return PokeApi.fromJson(decodeJson);
  } catch (error) {
    print('Erro ao carregar lista');
    throw new Exception('Erro ao carregar lista');
  }
}