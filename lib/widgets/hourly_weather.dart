import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/models/weather_codes.dart';
import 'package:weather_app/utils.dart';

class HourlyWeather extends StatelessWidget {
  final int index;
  final int isDay;
  final int time;
  final int weatherCode;
  final double temperature;

  const HourlyWeather(
      {super.key, required this.index, required this.time, required this.weatherCode, required this.temperature, required this.isDay});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Center(
        child: Column(
          children: [
            Text(index == 0 ? 'NOW' : getHourFromTimestamp(time),
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: getForegroundColor(isDay))),
            SvgPicture.asset(WEATHER_CODES[weatherCode][2], color: getForegroundColor(isDay)),
            Text('${temperature.round().toString()}°',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: getForegroundColor(isDay)))
          ],
        ),
      ),
    );
  }
}
