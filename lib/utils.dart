import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color? getBackgroundColor(int? isDay) {
  return isDay == 1 || isDay == null ? Colors.white : Colors.grey[800];
}

Color getForegroundColor(int? isDay) {
  return isDay == 1 || isDay == null ? Colors.black : Colors.white;
}

String getHourFromTimestamp(int timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('ha').format(date);
}

String getWeekDayFromTimestamp(int timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat(DateFormat.ABBR_WEEKDAY).format(date);
}