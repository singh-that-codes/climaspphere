import 'package:climasphere/models/weather_model.dart';
import 'package:climasphere/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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


String getWeatherAnimation(String? mainCondition){
  switch (mainCondition?.toLowerCase()) {
    case 'shower rain':
    return 'assets/cloudy.json';
    case 'clear':
      return 'assets/sunyy.json';
    case 'clouds':
      return 'assets/cloudy.json';
    case 'mist':
      return 'assets/cloudy.json';
    case 'smoke':
      return 'assets/cloudy.json';
    case 'haze':
      return 'assets/snow.json';
    case 'dust':
      return 'assets/storm.json';
    case 'fog':
      return 'assets/cloudy.json';
    default:
      return 'assets/sunny.json';
  }
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
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // City name
            Text(
              _weather?.cityName ?? 'Loading City ...',
              style:GoogleFonts.lato(fontSize: 38,color:Colors.white,fontWeight: FontWeight.bold), 
            ),
          Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
            // Temperature
            Text(
              '${_weather?.temperature?.round() ?? 0}°C',
              style:
                  GoogleFonts.lato(fontSize: 38, color: Colors.white,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }


}
