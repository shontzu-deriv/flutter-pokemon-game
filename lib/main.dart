import 'package:flutter/material.dart';
import 'package:pokemon_game/Pokemon.dart';
import 'package:pokemon_game/Stone.dart';
import 'Pokemon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Game',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Pokemon Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int score = 0;
  int speed = 1500;

  void incrementScore() {
    setState(() {
      score++;
    });
  }

  //key to access pokemon states
  final GlobalKey<PokemonState> PokemonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Score: $score"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(children: <Widget>[
              Stone(),
              Positioned(
                child: Pokemon(key: PokemonKey),
              )
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              PokemonKey.currentState?.jump();
            });
          },
          child: const Text("Jump")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
