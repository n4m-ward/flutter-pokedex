import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:pokedex/Enums/app_enum.dart';

class PokeItem extends StatelessWidget {
  final String? name;
  final int? index;
  final Color? color;
  final String? number;
  final List<String>? types;

  Widget getTipos() {
    List<Widget> lista = [];
    types!.forEach((nome) {
      lista.add(
        Column(
          children: [Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(80, 255, 255, 255)
            ),
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Text(
                nome.trim(),
                style: TextStyle(
                  fontFamily: 'Google',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
          ),
            SizedBox(
              height: 5,
            )
          ],

        )
      );
    });
    return Column(
      children: lista,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  const PokeItem(
      {Key? key,
      this.name,
      required this.index,
      required this.color,
      this.types,
      this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      AppEnum.WHITE_POKEBALL_URL,
                      height: 85,
                      width: 85,
                    ),
                  ),
                  Align(
                    child: CachedNetworkImage(
                        height: 80,
                        width: 80,
                        placeholder: (context, url) => new Container(
                              color: Colors.transparent,
                            ),
                        imageUrl:
                            "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$number.png"),
                    alignment: Alignment.bottomRight,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? '',
                      style: TextStyle(
                          fontFamily: 'Google',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    Container(height: 5,),
                    getTipos()
                  ],
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: AppEnum.getColorType(type: types![0]),
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('number', number));
  }
}
