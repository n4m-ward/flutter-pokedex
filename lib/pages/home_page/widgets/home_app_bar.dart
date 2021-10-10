import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/Enums/app_enum.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13.0, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.menu))
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Pokedex',
                        style: TextStyle(
                            fontFamily: 'Google',
                            fontWeight: FontWeight.bold,
                            fontSize: 28
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            height: AppEnum.APP_BAR_HEIGTH,
          )
        ],
      ),
    );
  }
}
