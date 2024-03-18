class WeatherData {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  CurrentUnits? currentUnits;
  Current? current;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;
  DailyUnits? dailyUnits;
  Daily? daily;

  WeatherData(
      {this.latitude,
      this.longitude,
      this.generationtimeMs,
      this.utcOffsetSeconds,
      this.timezone,
      this.timezoneAbbreviation,
      this.elevation,
      this.currentUnits,
      this.current,
      this.hourlyUnits,
      this.hourly,
      this.dailyUnits,
      this.daily});

  WeatherData.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    currentUnits = json['current_units'] != null ? CurrentUnits.fromJson(json['current_units']) : null;
    current = json['current'] != null ? Current.fromJson(json['current']) : null;
    hourlyUnits = json['hourly_units'] != null ? HourlyUnits.fromJson(json['hourly_units']) : null;
    hourly = json['hourly'] != null ? Hourly.fromJson(json['hourly']) : null;
    dailyUnits = json['daily_units'] != null ? DailyUnits.fromJson(json['daily_units']) : null;
    daily = json['daily'] != null ? Daily.fromJson(json['daily']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['generationtime_ms'] = generationtimeMs;
    data['utc_offset_seconds'] = utcOffsetSeconds;
    data['timezone'] = timezone;
    data['timezone_abbreviation'] = timezoneAbbreviation;
    data['elevation'] = elevation;
    if (currentUnits != null) {
      data['current_units'] = currentUnits!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (hourlyUnits != null) {
      data['hourly_units'] = hourlyUnits!.toJson();
    }
    if (hourly != null) {
      data['hourly'] = hourly!.toJson();
    }
    if (dailyUnits != null) {
      data['daily_units'] = dailyUnits!.toJson();
    }
    if (daily != null) {
      data['daily'] = daily!.toJson();
    }
    return data;
  }
}

class CurrentUnits {
  String? time;
  String? interval;
  String? temperature2m;
  String? relativeHumidity2m;
  String? isDay;
  String? precipitation;
  String? rain;
  String? showers;
  String? snowfall;
  String? windSpeed10m;
  String? weatherCode;

  CurrentUnits(
      {this.time,
      this.interval,
      this.temperature2m,
      this.relativeHumidity2m,
      this.isDay,
      this.precipitation,
      this.rain,
      this.showers,
      this.snowfall,
      this.windSpeed10m,
      this.weatherCode});

  CurrentUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    temperature2m = json['temperature_2m'];
    relativeHumidity2m = json['relative_humidity_2m'];
    isDay = json['is_day'];
    precipitation = json['precipitation'];
    rain = json['rain'];
    showers = json['showers'];
    snowfall = json['snowfall'];
    windSpeed10m = json['wind_speed_10m'];
    weatherCode = json['weather_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['interval'] = interval;
    data['temperature_2m'] = temperature2m;
    data['relative_humidity_2m'] = relativeHumidity2m;
    data['is_day'] = isDay;
    data['precipitation'] = precipitation;
    data['rain'] = rain;
    data['showers'] = showers;
    data['snowfall'] = snowfall;
    data['wind_speed_10m'] = windSpeed10m;
    return data;
  }
}

class Current {
  int? time;
  int? interval;
  double? temperature2m;
  int? relativeHumidity2m;
  int? isDay;
  double? precipitation;
  double? rain;
  double? showers;
  double? snowfall;
  double? windSpeed10m;
  int? weatherCode;

  Current(
      {this.time,
      this.interval,
      this.temperature2m,
      this.relativeHumidity2m,
      this.isDay,
      this.precipitation,
      this.rain,
      this.showers,
      this.snowfall,
      this.windSpeed10m,
      this.weatherCode});

  Current.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    temperature2m = json['temperature_2m'];
    relativeHumidity2m = json['relative_humidity_2m'];
    isDay = json['is_day'];
    precipitation = json['precipitation'];
    rain = json['rain'];
    showers = json['showers'];
    snowfall = json['snowfall'];
    windSpeed10m = json['wind_speed_10m'];
    weatherCode = json['weather_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['interval'] = interval;
    data['temperature_2m'] = temperature2m;
    data['relative_humidity_2m'] = relativeHumidity2m;
    data['is_day'] = isDay;
    data['precipitation'] = precipitation;
    data['rain'] = rain;
    data['showers'] = showers;
    data['snowfall'] = snowfall;
    data['wind_speed_10m'] = windSpeed10m;
    return data;
  }
}

class HourlyUnits {
  String? time;
  String? temperature2m;
  String? relativeHumidity2m;
  String? rain;
  String? showers;
  String? snowfall;
  String? windSpeed10m;
  String? weatherCode;

  HourlyUnits(
      {this.time,
      this.temperature2m,
      this.relativeHumidity2m,
      this.rain,
      this.showers,
      this.snowfall,
      this.windSpeed10m,
      this.weatherCode});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
    relativeHumidity2m = json['relative_humidity_2m'];
    rain = json['rain'];
    showers = json['showers'];
    snowfall = json['snowfall'];
    windSpeed10m = json['wind_speed_10m'];
    weatherCode = json['weather_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['relative_humidity_2m'] = relativeHumidity2m;
    data['rain'] = rain;
    data['showers'] = showers;
    data['snowfall'] = snowfall;
    data['wind_speed_10m'] = windSpeed10m;
    data['weather_code'] = weatherCode;
    return data;
  }
}

class Hourly {
  List<int>? time;
  List<double>? temperature2m;
  List<int>? relativeHumidity2m;
  List<double>? rain;
  List<double>? showers;
  List<double>? snowfall;
  List<double>? windSpeed10m;
  List<int>? weatherCode;

  Hourly(
      {this.time,
      this.temperature2m,
      this.relativeHumidity2m,
      this.rain,
      this.showers,
      this.snowfall,
      this.windSpeed10m,
      this.weatherCode});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<int>();
    temperature2m = json['temperature_2m'].cast<double>();
    relativeHumidity2m = json['relative_humidity_2m'].cast<int>();
    rain = json['rain'].cast<double>();
    showers = json['showers'].cast<double>();
    snowfall = json['snowfall'].cast<double>();
    windSpeed10m = json['wind_speed_10m'].cast<double>();
    weatherCode = json['weather_code'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['relative_humidity_2m'] = relativeHumidity2m;
    data['rain'] = rain;
    data['showers'] = showers;
    data['snowfall'] = snowfall;
    data['wind_speed_10m'] = windSpeed10m;
    data['weather_code'] = weatherCode;
    return data;
  }
}

class DailyUnits {
  String? time;
  String? temperature2mMax;
  String? temperature2mMin;
  String? weatherCode;

  DailyUnits({this.time, this.temperature2mMax, this.temperature2mMin, this.weatherCode});

  DailyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2mMax = json['temperature_2m_max'];
    temperature2mMin = json['temperature_2m_min'];
    weatherCode = json['weather_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m_max'] = temperature2mMax;
    data['temperature_2m_min'] = temperature2mMin;
    data['weather_code'] = weatherCode;
    return data;
  }
}

class Daily {
  List<int>? time;
  List<double>? temperature2mMax;
  List<double>? temperature2mMin;
  List<int>? weatherCode;

  Daily({this.time, this.temperature2mMax, this.temperature2mMin, this.weatherCode});

  Daily.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<int>();
    temperature2mMax = json['temperature_2m_max'].cast<double>();
    temperature2mMin = json['temperature_2m_min'].cast<double>();
    weatherCode = json['weather_code'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m_max'] = temperature2mMax;
    data['temperature_2m_min'] = temperature2mMin;
    data['weather_code'] = weatherCode;
    return data;
  }
}
