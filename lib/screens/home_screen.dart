import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_codes.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/settings_screen.dart';
import 'package:weather_app/utils.dart';
import 'package:weather_app/widgets/days_weather_list.dart';
import 'package:weather_app/widgets/hourly_weather_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = context.watch<WeatherProvider>().currentLocation;
    final weatherData = context.watch<WeatherProvider>().weatherData;

    return Scaffold(
      backgroundColor: weatherData == null ? Colors.white : getBackgroundColor(weatherData.current?.isDay),
      appBar: AppBar(
        backgroundColor: weatherData == null ? Colors.white : getBackgroundColor(weatherData.current?.isDay),
        elevation: 0,
        forceMaterialTransparency: true,
        leading: context.watch<WeatherProvider>().isLoading
            ? Transform.scale(scale: 0.4, child: CircularProgressIndicator(color: getForegroundColor(weatherData?.current?.isDay),))
            : null,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            color: getForegroundColor(weatherData?.current?.isDay),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const SettingsScreen(),
                  ));
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<WeatherProvider>().getWeather();
        },
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    currentLocation?.name ?? "Loading location...",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.w300, color: getForegroundColor(weatherData?.current?.isDay)),
                  ),
                  Text(
                    weatherData != null ? ' ${weatherData.current?.temperature2m?.round() ?? 0}°' : '--',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 90,
                        color: getForegroundColor(weatherData?.current?.isDay)),
                  ),
                  Text(
                    weatherData != null ? '${WEATHER_CODES[weatherData.current?.weatherCode][0]}' : '',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 23,
                        color: getForegroundColor(weatherData?.current?.isDay)),
                  ),
                  weatherData != null ? Lottie.asset(WEATHER_CODES[weatherData.current?.weatherCode][1][weatherData.current?.isDay==1?0:1], width: 100, height: 100) : Container(),
                ],
              ),
            ),
            weatherData != null ? const HourlyWeatherList() : const SizedBox(),
            weatherData != null ? const DaysWeatherList() : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
