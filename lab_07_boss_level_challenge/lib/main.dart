import 'package:flutter/material.dart';
import 'package:lab_07_boss_level_challenge/story_brain.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DestinyPage());
  }
}

class DestinyPage extends StatefulWidget {
  const DestinyPage({super.key});

  @override
  State<DestinyPage> createState() => _DestinyPageState();
}

class _DestinyPageState extends State<DestinyPage> {
  final story = StoryBrain();
  void chooseStory(int answer) {
    setState(() {
      story.nextStory(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: Center(child: Text(story.getStory()))),
              Visibility(
                visible: story.buttonShouldBeVisible(),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    chooseStory(1);
                  },
                  child: Text(story.getChoice1()),
                ),
              ),
              SizedBox(height: 16),
              Visibility(
                visible: story.buttonShouldBeVisible(),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    chooseStory(2);
                  },
                  child: Text(story.getChoice2()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
