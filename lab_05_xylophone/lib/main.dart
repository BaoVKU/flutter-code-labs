import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: XylophonePage(),
    );
  }
}

class XylophonePage extends StatelessWidget {
  const XylophonePage({super.key});

  void playSound(int index) {
    final player = AudioPlayer();
    player.play(AssetSource("sound_0$index.wav"));
  }

  Expanded buildItem({required color, required index}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: () {
          playSound(index);
        },
        child: Text(""),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildItem(color: Colors.green, index: 1),
            buildItem(color: Colors.red, index: 2),
            buildItem(color: Colors.purple, index: 3),
            buildItem(color: Colors.blue, index: 4),
            buildItem(color: Colors.yellow, index: 5),
            buildItem(color: Colors.orange, index: 6),
            buildItem(color: Colors.pink, index: 7),
          ],
        ),
      ),
    );
  }
}
