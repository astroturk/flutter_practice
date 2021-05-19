import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.black12,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'LaunchPad',
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
        body: ButtonComplex(),
      ),
    );
  }
}



class ButtonComplex extends StatelessWidget {
  void playSound(String soundFile) {
    /*final player = AudioCache();
    player.play(soundFile);*/
  }

  Expanded buildButton(String soundFile, String buttonTitle){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          child: Center(
            child: Text(
              buttonTitle,
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          ),
          onPressed: () { playSound(soundFile);},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                buildButton('deja-vu.mp3', 'Deja Vu 😬'),
                buildButton('epic-sax.mp3', 'Epic Sax 🎷'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                buildButton('harmane.mp3', 'Patlamaya 👽'),
                buildButton('directed-by-robert.mp3', 'Directed by 🎥'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                buildButton('deja-vu.mp3', 'Deja Vu 😬'),
                buildButton('epic-sax.mp3', 'Epic Sax 🎷'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                buildButton('deja-vu.mp3', 'Deja Vu 😬'),
                buildButton('epic-sax.mp3', 'Epic Sax 🎷'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

