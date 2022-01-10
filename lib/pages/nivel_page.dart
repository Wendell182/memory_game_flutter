import 'package:flutter/material.dart';
import 'package:round6_puzzle/game_settings.dart';
import 'package:round6_puzzle/models/game_play.dart';
import 'package:round6_puzzle/widgets/card_nivel.dart';

import '../constants.dart';

class NivelPage extends StatelessWidget {
  final Modo modo;

  const NivelPage({
    Key? key,
    required this.modo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final niveis = GameSettings.niveis
        .map((n) => CardNivel(gamePlay: GamePlay(modo: modo, nivel: n)))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Nível do jogo'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: EdgeInsets.all(24),
          children: niveis,
        ),
      ),
    );
  }
}
