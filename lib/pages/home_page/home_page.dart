import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/Enums/app_enum.dart';
import 'package:pokedex/Models/poke_api.dart';
import 'package:pokedex/Stores/pokeapi_store.dart';
import 'package:pokedex/pages/home_page/widgets/home_app_bar.dart';
import 'package:pokedex/pages/home_page/widgets/poke_item.dart';
import 'package:pokedex/pages/poke_detail/poke_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double appBarHeigth = 120;
  late PokeApiStore pokeApiStore;

  @override
  void initState() {
    super.initState();
    pokeApiStore = PokeApiStore();
    pokeApiStore.fecthPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -(240 / 3),
              left: screenWidth - (240 / 1.6),
              child: Opacity(
                  opacity: 0.1,
                  child: Image.asset(
                    AppEnum.BLACK_POKEBALL_URL,
                    height: 240,
                    width: 240,
                  )),
            ),
            HomeAppBar(),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        child: Observer(
                      name: 'ListaHomePage',
                      builder: (BuildContext context) {
                        PokeApi? _pokeApi = pokeApiStore.pokeApi;
                        return (_pokeApi != null)
                            ? AnimationLimiter(
                                child: GridView.builder(
                                    physics: BouncingScrollPhysics(),
                                    padding: EdgeInsets.all(12),
                                    addAutomaticKeepAlives: true,
                                    gridDelegate:
                                        new SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    itemCount:
                                        pokeApiStore.pokeApi!.pokemon.length,
                                    itemBuilder: (context, index) {
                                      Pokemon? pokemon = pokeApiStore.getPokemon(index: index);
                                      return AnimationConfiguration
                                          .staggeredGrid(
                                              position: index,
                                              duration: const Duration(
                                                  microseconds: 375),
                                              columnCount: 2,
                                              child: ScaleAnimation(
                                                child: GestureDetector(
                                                  child: PokeItem(
                                                    types: pokemon!.type,
                                                    index: index,
                                                    name: pokemon.name,
                                                    number: pokemon.num,
                                                    color: Colors.red,
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (BuildContext context) => PokeDetailPage(),
                                                            //PokeDetailPage(index: index),
                                                            fullscreenDialog: true
                                                        )
                                                    );
                                                  },
                                                ),
                                              ));
                                    }))
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
