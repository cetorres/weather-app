import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_data.dart';

class WeatherService {
  static const WEATHER_URL =
      "https://api.open-meteo.com/v1/forecast?past_days=10&current=temperature_2m,relative_humidity_2m,weather_code,is_day,precipitation,rain,showers,snowfall,wind_speed_10m&daily=weather_code,temperature_2m_max,temperature_2m_min&hourly=temperature_2m,relative_humidity_2m,weather_code,rain,showers,snowfall,wind_speed_10m&timezone=auto&timeformat=unixtime";

  final imperialUnits = "&temperature_unit=fahrenheit&wind_speed_unit=mph&precipitation_unit=inch";

  WeatherService();

  Future<WeatherData> getWeatherData(double latitude, double longitude, {bool isImperial = true}) async {
    final response = await http
        .get(Uri.parse('$WEATHER_URL&latitude=$latitude&longitude=$longitude${isImperial ? imperialUnits : ''}'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return WeatherData.fromJson(json);
    } else {
      throw Exception('Error: Could not get weather data.');
    }
  }
}
