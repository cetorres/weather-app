import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/current_location.dart';
import 'package:weather_app/models/location_data.dart';
import 'package:weather_app/provider/weather_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = context.watch<WeatherProvider>().currentLocation;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: context.watch<WeatherProvider>().isLoading
            ? [Transform.scale(scale: 0.5, child: const CircularProgressIndicator())]
            : null,
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            // leading: const Icon(Icons.location_on),
            secondary: const Icon(Icons.my_location),
            title: const Text('Use my current location'),
            value: context.watch<WeatherProvider>().isAutomaticLocation,
            onChanged: (newValue) {
              context.read<WeatherProvider>().setIsAutomaticLocation(newValue);
              if (newValue == true) {
                context.read<WeatherProvider>().getCurrentLocation();
                context.read<WeatherProvider>().getWeather();
              }
            },
          ),
          ListTile(
            enabled: !context.watch<WeatherProvider>().isAutomaticLocation,
            leading: const Icon(Icons.location_on),
            title: const Text('Select location'),
            trailing: Text(currentLocation?.name ?? '',
                style: context.watch<WeatherProvider>().isAutomaticLocation
                    ? Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[500])
                    : Theme.of(context).textTheme.titleMedium),
            onTap: () {
              showSearch(context: context, delegate: SearchLocation());
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Units'),
            trailing: DropdownButton<String>(
              value: context.watch<WeatherProvider>().isImperial ? 'Fahrenheit' : 'Celcius',
              onChanged: (String? newValue) {
                context.read<WeatherProvider>().setIsImperial(newValue == 'Fahrenheit' ? true : false);
              },
              items: <String>['Fahrenheit', 'Celcius'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const Divider(),
          AboutListTile(
            applicationIcon: Image.asset('assets/icon.png', scale: 1.0, width: 36.0, height: 36.0),
            applicationName: 'Weather',
            aboutBoxChildren: const [
              Text('A weather app made in Flutter using Open Meteo (https://open-meteo.com/) API.'),
              Text('Please visit the GitHub repo for more info: https://github.com/cetorres/weather-app.'),
            ],
            applicationVersion: '1.0',
            applicationLegalese: '© 2024 Carlos E. Torres',
            icon: const Icon(Icons.info),
          )
        ],
      ),
    );
  }
}

class SearchLocation extends SearchDelegate {
  String? selectedResult;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          query = '';
          context.read<WeatherProvider>().setLocationData(null);
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<WeatherProvider>().searchLocation(query.trim());
    LocationData? locationData = context.watch<WeatherProvider>().locationData;

    return ListView.builder(
        itemCount: locationData?.results?.length,
        itemBuilder: (_, index) {
          final locationName =
              '${locationData?.results?[index].name}${locationData?.results?[index].admin1 != null ? ', ${locationData?.results?[index].admin1}' : ''}';
          return ListTile(
            title: Text(
                locationData?.results?[index] != null ? '$locationName, ${locationData?.results?[index].country}' : ''),
            onTap: () {
              final currentLocation = CurrentLocation(
                  name: locationData?.results?[index].name ?? '',
                  latitude: locationData?.results?[index].latitude ?? 0.0,
                  longitude: locationData?.results?[index].longitude ?? 0.0);
              context.read<WeatherProvider>().setCurrentLocation(currentLocation);
              context.read<WeatherProvider>().getWeather();
              Navigator.pop(context);
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
