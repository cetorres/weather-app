import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/widgets/daily_weather.dart';

class DaysWeatherList extends StatelessWidget {
  const DaysWeatherList({super.key});

  final totalDays = 6;

  List<Widget> _getItems(Daily? dailyData, int isDay) {
    List<Widget> items = [];

    for (var i = 0; i < totalDays; i++) {
      final time = dailyData?.time?[i] ?? 0;
      final weatherCode = dailyData?.weatherCode?[i] ?? 0;
      final temperatureMax = dailyData?.temperature2mMax?[i] ?? 0.0;
      final temperatureMin = dailyData?.temperature2mMin?[i] ?? 0.0;
      items.add(DailyWeather(
          index: i,
          time: time,
          weatherCode: weatherCode,
          temperatureMax: temperatureMax,
          temperatureMin: temperatureMin,
          isDay: isDay));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = context.watch<WeatherProvider>().weatherData;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
          child: Text('5-DAY FORECAST', style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
        Column(
          children: _getItems(weatherData?.daily, weatherData?.current?.isDay ?? 1),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
