// ignore_for_file: empty_constructor_bodies

class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    try {
      return Weather(
        cityName: json["cityName"] as String,
        temperature: (json["main"]["temp"] as num).toDouble(),
        mainCondition: json['weather'][0]['main'] as String,
      );
    } catch (e) {
      // Handle parsing errors
      print('Error parsing Weather from JSON: $e');
      rethrow; // Rethrow the exception for debugging purposes or custom handling
    }
  }
}
