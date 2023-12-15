import 'package:climasphere/pages/weatherpage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WeatherPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Text(
              'ClimaSphere',
              style: GoogleFonts.lato(
                  fontSize: 38,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),*/
            Lottie.asset(
              'assets/splash.json', 
              width: 400,
              height: 400,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
