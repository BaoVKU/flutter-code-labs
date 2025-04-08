import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/image.JPG'),
                ),
                SizedBox(height: 8),
                Text(
                  "Dao Gia Bao",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Android developer",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Divider(),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 4),
                    Text("baodg.22itb@vku.udn.vn"),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 4),
                    Text("0969127921"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
