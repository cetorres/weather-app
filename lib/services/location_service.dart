import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/models/location_data.dart';
import 'package:weather_app/models/current_location.dart';

class LocationService {
  static const LOCATION_URL = "https://geocoding-api.open-meteo.com/v1/search?count=10&language=en&format=json";

  LocationService();

  Future<CurrentLocation> getCurrentLocation() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled return an error message
      return Future.error('Location services are disabled.');
    }

    // Check location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // If permissions are granted, get the current location
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    String? name = placemarks[0].locality ?? 'Not location name';
    CurrentLocation currentLocation = CurrentLocation(
      name: name,
      latitude: position.latitude,
      longitude: position.longitude
    );
    return currentLocation;
  }

  Future<LocationData> searchLocationByName(String name) async {
    final response = await http.get(Uri.parse('$LOCATION_URL&name=$name'));

    if (response.statusCode == 200) {
      return LocationData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error: Could not get location data.');
    }
  }
}
