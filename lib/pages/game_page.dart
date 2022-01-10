import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:round6_puzzle/controllers/game_controller.dart';
import 'package:round6_puzzle/game_settings.dart';
import 'package:round6_puzzle/models/game_opcao.dart';
import 'package:round6_puzzle/models/game_play.dart';
import 'package:round6_puzzle/widgets/card_game.dart';
import 'package:round6_puzzle/widgets/feedback_game.dart';
import 'package:round6_puzzle/widgets/game_score.dart';

import '../constants.dart';

class GamePage extends StatelessWidget {
  final GamePlay gamePlay;

  const GamePage({Key? key, required this.gamePlay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: GameScore(modo: gamePlay.modo),
        ),
        body: Observer(builder: (_) {
          if (controller.venceu) {
            return FeedbackGame(resultado: Resultado.aprovado);
          } else if (controller.perdeu) {
            return FeedbackGame(resultado: Resultado.eliminado);
          } else {
            return Center(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: GameSettings.gameBoardAxisCount(gamePlay.nivel),
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                padding: EdgeInsets.all(24),
                children: controller.gameCards
                    .map((GameOpcao go) => CardGame(
                          modo: gamePlay.modo,
                          gameOpcao: go,
                        ))
                    .toList(),
              ),
            );
          }
        }));
  }
}
