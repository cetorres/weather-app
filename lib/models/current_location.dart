import 'dart:convert';

class CurrentLocation {
  String? name;
  double? latitude;
  double? longitude;

  CurrentLocation({required this.name, required this.latitude, required this.longitude});

  String toJSONString() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["latitude"] = latitude;
    data["longitude"] = longitude;
    return json.encode(data);
  }

  CurrentLocation.fromJSONString(String jsonString) {
    final data = json.decode(jsonString);
    name = data["name"];
    latitude = data["latitude"];
    longitude = data["longitude"];
  }
}
