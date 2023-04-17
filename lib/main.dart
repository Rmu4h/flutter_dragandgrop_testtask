import 'package:flutter/material.dart';
import 'package:flutter_draganddrop_testtask/start/start.dart';

import 'game/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Quicksand'
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Start(), //SearchWidget MainPage

        // '/main': (context) => WillPopScope(
        //     onWillPop: () => Future.value(false),
        //     child: const MapPage()),

        '/main': (context) => const Game(),
      },
    );
  }
}
