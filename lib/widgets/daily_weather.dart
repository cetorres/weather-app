import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/models/weather_codes.dart';
import 'package:weather_app/utils.dart';

class DailyWeather extends StatelessWidget {
  final int index;
  final int isDay;
  final int time;
  final int weatherCode;
  final double temperatureMax;
  final double temperatureMin;

  const DailyWeather(
      {super.key, required this.index, required this.time, required this.weatherCode, required this.temperatureMax, required this.temperatureMin, required this.isDay});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 50, child: Text(index == 0 ? 'Today' : getWeekDayFromTimestamp(time), style: TextStyle(fontSize: 16, color: getForegroundColor(isDay)))),
          SizedBox(width: 30, child: SvgPicture.asset(WEATHER_CODES[weatherCode][2], color: getForegroundColor(isDay))),
          SizedBox(width: 30, child: Text('${temperatureMin.round().toString()}°', style: TextStyle(fontSize: 18, color: Colors.blue[600]))),
          SizedBox(width: 30, child: Text('${temperatureMax.round().toString()}°', style: TextStyle(fontSize: 18, color: Colors.red[600]))),
        ],
      )
    );
  }
}
