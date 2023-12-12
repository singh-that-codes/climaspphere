import 'package:climasphere/models/weather_model.dart';
import 'package:climasphere/services/weather_service.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  //api key
  final _WeatherService = WeatherService("bd695a9226b149568d762c1e8709bacb");

  Weather? _weather;

 _fetchWeather() async {
  //get the current city
  String cityName =  await _WeatherService.getCurrentCity();

  //get weather for the fetched city
  try{
    final weather = await _WeatherService.getWeather(cityName);
    setState(() {
      _weather = weather;
  });
  }
  catch(e){
    print(e);}
}

  @override
  //init state
  void initState(){
    super.initState();
    //fetch weather on startup
    _fetchWeather();
  }
  
  
  Widget build(BuildContext context) {
    print('_weather: $_weather'); // Log the value of _weather for debugging

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // City name
          Text(
            _weather?.cityName ?? 'City ...',
            style:
                TextStyle(color: Colors.black), // Add text color for visibility
          ),

          // Temperature
          Text(
            '${_weather?.temperature?.round() ?? 0}°C',
            style:
                TextStyle(color: Colors.black), // Add text color for visibility
          ),
        ],
      ),
    );
  }


}
