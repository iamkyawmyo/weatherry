import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherry/services/weather.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    print(weatherData);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather: weatherData);
      }),
    );

    // print(weatherData);
    // print(latitude);
    // print(longitude);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
