import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BmiPage());
  }
}

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  String result = "";

  void calculateBMI() {
    final double? weight = double.tryParse(weightController.text);
    final double? height = double.tryParse(heightController.text);

    if (weight != null && height != null && height > 0) {
      final double bmi = weight / (height * height);
      String feedback;

      if (bmi < 18.5) {
        feedback = "Underweight";
      } else if (bmi < 24.9) {
        feedback = "Normal weight";
      } else if (bmi < 29.9) {
        feedback = "Overweight";
      } else {
        feedback = "Obesity";
      }

      setState(() {
        result = "Your BMI is ${bmi.toStringAsFixed(2)} ($feedback)";
      });
    } else {
      setState(() {
        result = "Please enter valid weight and height!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(child: Center(child: Text(result))),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Weight (kg)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Height (m)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  calculateBMI();
                },
                child: Text("Calculate"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
