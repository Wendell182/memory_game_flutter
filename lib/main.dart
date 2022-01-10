import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:round6_puzzle/controllers/game_controller.dart';
import 'package:round6_puzzle/pages/home_page.dart';
import 'package:round6_puzzle/repositories/recordes_repository.dart';
import 'package:round6_puzzle/theme.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MultiProvider(
    providers: [
      Provider<RecordesRepository>(
        create: (_) => RecordesRepository(),
      ),
      ProxyProvider<RecordesRepository, GameController>(
        update: (_, repo, __) => GameController(recordesRepository: repo),
      ),
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Round 6 Memory',
      debugShowCheckedModeBanner: false,
      theme: Round6Theme.theme,
      home: HomePage(),
    );
  }
}
