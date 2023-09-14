// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields

import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _resultado = "....";
  String selectedImage = "images/padrao.png";
  Color userWin = Colors.white;
  String selectedImageApp = "images/padrao.png";
  var textSyle = TextStyle(
    fontSize: 20,
    color: Colors.black
  );

  List<String> gestures = [
    "pedra",
    "papel",
    "tesoura",
  ];

  void startGame(int selectedGesture) {
    var appChoice = Random().nextInt(2);
    var result;

    switch(selectedGesture) {
      case 0:
        if (appChoice == 0) result = "Empate";
        if (appChoice == 1) result = "App Ganhou";
        if (appChoice == 2) result = "Usuário Ganhou";
        break;
      case 1:
        if (appChoice == 0) result = "Usuário Ganhou";
        if (appChoice == 1) result = "Empate";
        if (appChoice == 2) result = "App Ganhou";
        break;
      case 2:
        if (appChoice == 0) result = "App Ganhou";
        if (appChoice == 1) result = "Usuário Ganhou";
        if (appChoice == 2) result = "Empate";
        break;
    }

    setState(() {
      selectedImage = "images/${gestures[selectedGesture]}.png";
      selectedImageApp = "images/${gestures[appChoice]}.png";
      _resultado = "Resultado: $result";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Escolha do usuario", style: textSyle),
                        Padding(padding: EdgeInsets.all(8)),
                        Image.asset(selectedImage),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Escolha do app", style: textSyle),
                        Padding(padding: EdgeInsets.all(8)),
                        Image.asset(selectedImageApp),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(_resultado, style: textSyle,),
                Padding(padding: EdgeInsets.all(8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        "images/pedra.png",
                        width: 100.0,
                        height: 100.0,
                      ),
                      onTap: () => startGame(0),
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "images/papel.png",
                        width: 100.0,
                        height: 100.0,
                      ),
                      onTap: () => startGame(1),
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "images/tesoura.png",
                        width: 100.0,
                        height: 100.0,
                      ),
                      onTap: () => startGame(2),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}