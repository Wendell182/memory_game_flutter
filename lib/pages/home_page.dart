import 'package:flutter/material.dart';
import 'package:round6_puzzle/pages/nivel_page.dart';
import 'package:round6_puzzle/pages/recordes_page.dart';
import 'package:round6_puzzle/theme.dart';
import 'package:round6_puzzle/widgets/logo.dart';
import 'package:round6_puzzle/widgets/recordes.dart';
import 'package:round6_puzzle/widgets/start_button.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  showRecordes(Modo modo) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => RecordesPage(modo: modo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(),
            StartButton(
                title: 'Modo Normal',
                color: Colors.white,
                action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            NivelPage(modo: Modo.normal),
                      ),
                    )),
            StartButton(
                title: 'Modo Round 6',
                color: Round6Theme.color,
                action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            NivelPage(modo: Modo.round6),
                      ),
                    )),
            SizedBox(height: 60.0),
            Recordes(),
          ],
        ),
      ),
    );
  }
}
