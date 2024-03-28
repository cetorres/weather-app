import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/widgets/hourly_weather.dart';

class HourlyWeatherList extends StatelessWidget {
  const HourlyWeatherList({super.key});

  final totalHours = 25;

  int _getTimeStartIndex(List<int>? times) {
    if (times == null) return 0;
    var currentHour = DateFormat('ha').format(DateTime.now());
    for (var i = 0; i < times.length; i++) {
      var date = DateTime.fromMillisecondsSinceEpoch(times[i] * 1000);
      if (DateFormat('ha').format(date) == currentHour) {
        return i;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = context.watch<WeatherProvider>().weatherData;
    final timeStartIndex = _getTimeStartIndex(weatherData?.hourly?.time);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 22.0, bottom: 8.0),
          child: Text('HOURLY FORECAST', style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
        SizedBox(
          height: 90,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: min(totalHours, weatherData?.hourly?.time?.sublist(timeStartIndex).length ?? 0),
              itemBuilder: (_, index) {
                final time = weatherData?.hourly?.time?.sublist(timeStartIndex)[index] ?? 0;
                final weatherCode = weatherData?.hourly?.weatherCode?.sublist(timeStartIndex)[index] ?? 0;
                final temperature = weatherData?.hourly?.temperature2m?.sublist(timeStartIndex)[index] ?? 0.0;
                return HourlyWeather(
                    index: index,
                    time: time,
                    weatherCode: weatherCode,
                    temperature: temperature,
                    isDay: weatherData?.current?.isDay ?? 1);
              }),
        ),
      ],
    );
  }
}
