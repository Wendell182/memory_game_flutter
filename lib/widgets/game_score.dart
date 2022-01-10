import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:round6_puzzle/controllers/game_controller.dart';

import '../constants.dart';

class GameScore extends StatelessWidget {
  final Modo modo;
  const GameScore({Key? key, required this.modo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(modo == Modo.round6
                ? Icons.my_location
                : Icons.touch_app_rounded),
            SizedBox(
              width: 10,
            ),
            Observer(
              builder: (_) => Text(
                controller.score.toString(),
                style: TextStyle(fontSize: 25),
              ),
            )
          ],
        ),
        Image.asset(
          'images/host.png',
          width: 387.0,
          height: 60.0,
        ),
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Sair',
              style: TextStyle(fontSize: 18),
            ))
      ],
    );
  }
}
