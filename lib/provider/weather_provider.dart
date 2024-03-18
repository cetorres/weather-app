import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/current_location.dart';
import 'package:weather_app/models/location_data.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  final _locationService = LocationService();
  final _weatherService = WeatherService();
  var _isImperial = true;
  var _isAutomaticLocation = true;
  CurrentLocation? _currentLocation;
  LocationData? _locationData;
  WeatherData? _weatherData;
  var _isLoading = false;

  WeatherProvider() {
    readDataFromSharedPreferences();
  }

  void readDataFromSharedPreferences() async {
    // Load the shared preferences
    final prefs = await SharedPreferences.getInstance();

    // Load data from shared preference into state
    _isImperial = prefs.getBool("isImperial") ?? true;
    _isAutomaticLocation = prefs.getBool("isAutomaticLocation") ?? true;
    final currentLocationString = prefs.getString("currentLocation");
    if (currentLocationString != null) {
      final currentLocation = CurrentLocation.fromJSONString(currentLocationString);
      _currentLocation = currentLocation;
    }

    // Notify the listeners
    notifyListeners();

    // Get weather
    getWeather();
  }

  void saveDataFromSharedPreferences() async {
    // Load the shared preferences
    final prefs = await SharedPreferences.getInstance();

    // Save data to shared preferences
    await prefs.setBool("isImperial", _isImperial);
    await prefs.setBool("isAutomaticLocation", _isAutomaticLocation);
    await prefs.setString("currentLocation", _currentLocation!.toJSONString());
  }

  bool get isLoading => _isLoading;
  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isImperial => _isImperial;
  void setIsImperial(bool value) {
    _isImperial = value;
    saveDataFromSharedPreferences();
    notifyListeners();
    getWeather();
  }

  bool get isAutomaticLocation => _isAutomaticLocation;
  void setIsAutomaticLocation(bool value) {
    _isAutomaticLocation = value;
    saveDataFromSharedPreferences();
    notifyListeners();
  }

  CurrentLocation? get currentLocation => _currentLocation;
  void setCurrentLocation(CurrentLocation value) {
    _currentLocation = value;
    saveDataFromSharedPreferences();
    notifyListeners();
  }

  LocationData? get locationData => _locationData;
  void setLocationData(LocationData? value) {
    _locationData = value;
    notifyListeners();
  }

  WeatherData? get weatherData => _weatherData;
  void setWeatherData(WeatherData value) {
    _weatherData = value;
    notifyListeners();
  }

  void getWeather() async {
    try {
      setIsLoading(true);

      // Load current location
      var currentLocation = _currentLocation;
      if (_isAutomaticLocation) {
        currentLocation = await _locationService.getCurrentLocation();
        setCurrentLocation(currentLocation);
      }

      // Load weather data
      final weatherData = await _weatherService
          .getWeatherData(currentLocation?.latitude ?? 0.0, currentLocation?.longitude ?? 0.0, isImperial: _isImperial);
      setWeatherData(weatherData);
    } catch (e) {
      print('WeatherProvider.getWeather - Error: $e');
    } finally {
      setIsLoading(false);
    }
  }

  void getCurrentLocation() async {
    try {
      setIsLoading(true);
      final currentLocation = await _locationService.getCurrentLocation();
      setCurrentLocation(currentLocation);
    } catch (e) {
      print('WeatherProvider.getCurrentLocation - Error: $e');
    } finally {
      setIsLoading(false);
    }
  }

  void searchLocation(query) async {
    try {
      final locationData = await _locationService.searchLocationByName(query);
      setLocationData(locationData);
    } catch (e) {
      print('WeatherProvider.searchLocation - Error: $e');
    }
  }
}
