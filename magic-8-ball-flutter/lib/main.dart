import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text(
            "The 8 Ball of Truth!",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Bungee',
            ),
          ),
        ),
        body: Guesser(),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}

class Guesser extends StatefulWidget {
  const Guesser({Key key}) : super(key: key);

  @override
  _GuesserState createState() => _GuesserState();
}

class _GuesserState extends State<Guesser> {
  var imgNum = 1;

  void nextNum () {
    setState(() {
      imgNum = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () { nextNum(); },
        child: Image.asset('images/ball$imgNum.png'),
      ),
    );
  }
}
