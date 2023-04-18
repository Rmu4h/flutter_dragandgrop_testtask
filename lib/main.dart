import 'package:flutter/material.dart';
import 'package:flutter_draganddrop_testtask/start/start.dart';

import 'level_one/level_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand'),
      initialRoute: '/',
      routes: {
        '/': (context) => const Start(),
        '/main': (context) => const LevelOne(),
      },
    );
  }
}
