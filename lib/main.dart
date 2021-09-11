import 'package:flutter/material.dart';
import 'package:lifepets/screens/home.screen.dart';

void main () => runApp(MyApp());

/// sempre perguntar se a tela vai ter alguma alteração em tempo de execução
/// se não tiver deve ser stateless, caso contrário statefull
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Life Pet",
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
    );
  }
}
