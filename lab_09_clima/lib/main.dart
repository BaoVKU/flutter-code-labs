import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ClimaPage());
  }
}

class ClimaPage extends StatefulWidget {
  const ClimaPage({super.key});

  @override
  State<ClimaPage> createState() => _ClimaPageState();
}

class _ClimaPageState extends State<ClimaPage> {
  final locationController = TextEditingController();
  static const apiKey = "14f57b6b58c07d2b9a9834bd6cd1850f";
  Map<String, dynamic>? currentWeather;
  Map<String, dynamic>? cityWeather;
  Expanded buildItem({required data}) {
    final temp = data['main']['temp'];
    final cityName = data['name'];
    final weather = data['weather'][0];
    final iconCode = weather['icon'];
    final desc = weather['description'];
    return Expanded(
      child: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://openweathermap.org/img/wn/$iconCode@2x.png',
                  height: 80,
                ),
                Text(
                  weather['main'].toString(),
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            "${temp.toString()}°",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(cityName),
          SizedBox(height: 8),
          Text(desc),
        ],
      ),
    );
  }

  Future<void> getCurrentLocationClimate() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) return;
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    }
    if (locationPermission == LocationPermission.deniedForever) {
      return;
    }
    final position = await Geolocator.getCurrentPosition();
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    setState(() {
      currentWeather =
          response.statusCode == 200 ? json.decode(response.body) : null;
      print("\x1B[31m[ERROR] $currentWeather\x1B[0m");
    });
  }

  Future<void> fetchWeatherByCity(String cityName) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    setState(() {
      cityWeather =
          response.statusCode == 200 ? json.decode(response.body) : null;
      print("\x1B[31m[ERROR] $currentWeather\x1B[0m");
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocationClimate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  labelText: "Search city",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      fetchWeatherByCity(locationController.text);
                    },
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Visibility(
                visible: cityWeather == null ? false : true,
                child:
                    cityWeather == null
                        ? Text("Cannot find climate")
                        : buildItem(data: cityWeather),
              ),
              Divider(),
              Center(child: Text("Your current climate")),
              Visibility(
                visible: currentWeather == null ? false : true,
                child:
                    currentWeather == null
                        ? Text("Cannot find climate")
                        : buildItem(data: currentWeather),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
