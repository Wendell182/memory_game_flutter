import 'package:flutter/material.dart';
import 'package:round6_puzzle/controllers/game_controller.dart';
import 'package:round6_puzzle/models/game_play.dart';
import 'package:round6_puzzle/pages/game_page.dart';
import 'package:round6_puzzle/theme.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class CardNivel extends StatelessWidget {
  final GamePlay gamePlay;

  const CardNivel({Key? key, required this.gamePlay}) : super(key: key);

  startGame(BuildContext context) {
    context.read<GameController>().startGame(gamePlay: gamePlay);
    Navigator.push(
      context,
      MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) => GamePage(
                gamePlay: gamePlay,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => startGame(context),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 90,
        height: 90,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                gamePlay.modo == Modo.normal ? Colors.white : Round6Theme.color,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: gamePlay.modo == Modo.normal
              ? Colors.transparent
              : Round6Theme.color.withOpacity(1),
        ),
        child: Center(
          child: Text(
            gamePlay.nivel.toString(),
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
