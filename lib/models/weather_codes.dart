/*
Code	Description
0	Clear sky
1, 2, 3	Mainly clear, partly cloudy, and overcast
45, 48	Fog and depositing rime fog
51, 53, 55	Drizzle: Light, moderate, and dense intensity
56, 57	Freezing Drizzle: Light and dense intensity
61, 63, 65	Rain: Slight, moderate and heavy intensity
66, 67	Freezing Rain: Light and heavy intensity
71, 73, 75	Snow fall: Slight, moderate, and heavy intensity
77	Snow grains
80, 81, 82	Rain showers: Slight, moderate, and violent
85, 86	Snow showers slight and heavy
95 *	Thunderstorm: Slight or moderate
96, 99 *	Thunderstorm with slight and heavy hail
 */

const Map<int, dynamic> WEATHER_CODES = {
  0: ['Clear sky', ['assets/sun.json', 'assets/moon.json'], 'assets/weather_icons/wi-day-sunny.svg'],
  1: ['Mainly clear', ['assets/sun.json', 'assets/moon.json'], 'assets/weather_icons/wi-day-sunny-overcast.svg'],
  2: ['Partly cloudy', ['assets/partially_cloudy.json', 'assets/partially_cloudy.json'], 'assets/weather_icons/wi-day-cloudy.svg'],
  3: ['Overcast', ['assets/clouds.json', 'assets/clouds.json'], 'assets/weather_icons/wi-day-cloudy-high.svg'],
  45: ['Fog', ['assets/fog.json', 'assets/fog.json'], 'assets/weather_icons/wi-fog.svg'],
  48: ['Depositing rime fog', ['assets/fog.json', 'assets/fog.json'], 'assets/weather_icons/wi-fog.svg'],
  51: ['Light drizzle', ['assets/sun_rain.json', 'assets/sun_rain.json'], 'assets/weather_icons/wi-rain-mix.svg'],
  53: ['Moderate drizzle', ['assets/sun_rain.json', 'assets/sun_rain.json'], 'assets/weather_icons/wi-rain-mix.svg'],
  55: ['Dense drizzle', ['assets/sun_rain.json', 'assets/sun_rain.json'], 'assets/weather_icons/wi-rain-mix.svg'],
  56: ['Light freezing drizzle', ['assets/freezing_drizzle.json', 'assets/freezing_drizzle.json'], 'assets/weather_icons/wi-rain-mix.svg'],
  57: ['Dense freezing drizzle', ['assets/freezing_drizzle.json', 'assets/freezing_drizzle.json'], 'assets/weather_icons/wi-rain-mix.svg'],
  61: ['Slight rain', ['assets/rain.json', 'assets/rain.json'], 'assets/weather_icons/wi-rain.svg'],
  63: ['Moderate rain', ['assets/rain.json', 'assets/rain.json'], 'assets/weather_icons/wi-rain.svg'],
  65: ['Heavy rain', ['assets/rain.json', 'assets/rain.json'], 'assets/weather_icons/wi-rain.svg'],
  66: ['Light freezing rain', ['assets/freezing_drizzle.json', 'assets/freezing_drizzle.json'], 'assets/weather_icons/wi-snow-wind.svg'],
  67: ['Heavy freezing rain', ['assets/freezing_drizzle.json', 'assets/freezing_drizzle.json'], 'assets/weather_icons/wi-snow-wind.svg'],
  71: ['Slight snow fall', ['assets/snowing.json', 'assets/snowing.json'], 'assets/weather_icons/wi-snow.svg'],
  73: ['Moderate snow fall', ['assets/snowing.json', 'assets/snowing.json'], 'assets/weather_icons/wi-snow.svg'],
  75: ['Heavy snow fall', ['assets/snowing.json', 'assets/snowing.json'], 'assets/weather_icons/wi-snow.svg'],
  77: ['Snow grains', ['assets/snowing.json', 'assets/snowing.json'], 'assets/weather_icons/wi-snowflake-cold.svg'],
  80: ['Slight rain showers', ['assets/rain.json', 'assets/rain.json'], 'assets/weather_icons/wi-showers.svg'],
  81: ['Moderate rain showers', ['assets/rain.json', 'assets/rain.json'], 'assets/weather_icons/wi-showers.svg'],
  82: ['Heavy rain showers', ['assets/rain.json', 'assets/rain.json'], 'assets/weather_icons/wi-showers.svg'],
  85: ['Slight snow showers', ['assets/snowing.json', 'assets/snowing.json'], 'assets/weather_icons/wi-snow.svg'],
  86: ['Moderate snow showers', ['assets/snowing.json', 'assets/snowing.json'], 'assets/weather_icons/wi-snow.svg'],
  95: ['Thunderstorm', ['assets/lightning.json', 'assets/lightning.json'], 'assets/weather_icons/wi-storm-showers.svg'],
  96: ['Slight thunderstorm with hail', ['assets/lightning.json', 'assets/lightning.json'], 'assets/weather_icons/wi-storm-showers.svg'],
  99: ['Heavy thunderstorm with hail', ['assets/lightning.json', 'assets/lightning.json'], 'assets/weather_icons/wi-storm-showers.svg'],
};
