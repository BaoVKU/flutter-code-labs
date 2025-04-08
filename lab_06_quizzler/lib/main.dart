import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizzlerPage(),
    );
  }
}

class QuizzlerPage extends StatefulWidget {
  const QuizzlerPage({super.key});

  @override
  State<QuizzlerPage> createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {
  int score = 0;
  int currentQuestionIndex = 0;
  final List<Map<String, Object>> _questions = [
    {'question': 'The sky is blue.', 'answer': true},
    {'question': 'Cats can fly.', 'answer': false},
    {'question': 'Flutter is a framework.', 'answer': true},
    {'question': 'Dart is used with Flutter.', 'answer': true},
    {'question': 'Flutter can only be used for mobile apps.', 'answer': false},
    {'question': 'Hot Reload is a feature of Flutter.', 'answer': true},
    {'question': 'Widgets in Flutter are immutable.', 'answer': true},
    {'question': 'Flutter was developed by Microsoft.', 'answer': false},
    {'question': 'StatefulWidget has a mutable state.', 'answer': true},
    {'question': 'Flutter supports web development.', 'answer': true},
    {
      'question': 'The default programming language for Flutter is Java.',
      'answer': false,
    },
    {'question': 'Flutter apps can run on iOS and Android.', 'answer': true},
  ];

  void answerQuestion({required answer}) {
    setState(() {
    if (answer == _questions[currentQuestionIndex]["answer"]) {
      score++;
    }
    if (currentQuestionIndex < _questions.length) {
      currentQuestionIndex++;
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    currentQuestionIndex < _questions.length
                        ? "${_questions[currentQuestionIndex]["question"]}"
                        : "Your score: $score / ${_questions.length}",
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                onPressed: () {
                  answerQuestion(answer: true);
                },
                child: Text("True"),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                onPressed: () {
                  answerQuestion(answer: false);
                },
                child: Text("False"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
