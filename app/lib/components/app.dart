import 'package:flutter/material.dart';

import './pages/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO app',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
            primaryVariant: Colors.blueGrey,
            surface: Color.fromARGB(255, 60, 68, 77),
            background: Color.fromARGB(255, 7, 13, 43)),
      ),
      home: const HomePage(),
    );
  }
}
