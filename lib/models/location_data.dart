class LocationData {
  List<Results>? results;
  double? generationtimeMs;

  LocationData({this.results, this.generationtimeMs});

  LocationData.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    generationtimeMs = json['generationtime_ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['generationtime_ms'] = generationtimeMs;
    return data;
  }
}

class Results {
  int? id;
  String? name;
  double? latitude;
  double? longitude;
  double? elevation;
  String? featureCode;
  String? countryCode;
  int? admin1Id;
  int? admin3Id;
  int? admin4Id;
  String? timezone;
  int? population;
  // List<String>? postcodes;
  int? countryId;
  String? country;
  String? admin1;
  String? admin3;
  String? admin4;
  int? admin2Id;
  String? admin2;

  Results(
      {this.id,
      this.name,
      this.latitude,
      this.longitude,
      this.elevation,
      this.featureCode,
      this.countryCode,
      this.admin1Id,
      this.admin3Id,
      this.admin4Id,
      this.timezone,
      this.population,
      // this.postcodes,
      this.countryId,
      this.country,
      this.admin1,
      this.admin3,
      this.admin4,
      this.admin2Id,
      this.admin2});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    elevation = json['elevation'];
    featureCode = json['feature_code'];
    countryCode = json['country_code'];
    admin1Id = json['admin1_id'];
    admin3Id = json['admin3_id'];
    admin4Id = json['admin4_id'];
    timezone = json['timezone'];
    population = json['population'];
    // postcodes = json['postcodes'].cast<String>();
    countryId = json['country_id'];
    country = json['country'];
    admin1 = json['admin1'];
    admin3 = json['admin3'];
    admin4 = json['admin4'];
    admin2Id = json['admin2_id'];
    admin2 = json['admin2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['elevation'] = elevation;
    data['feature_code'] = featureCode;
    data['country_code'] = countryCode;
    data['admin1_id'] = admin1Id;
    data['admin3_id'] = admin3Id;
    data['admin4_id'] = admin4Id;
    data['timezone'] = timezone;
    data['population'] = population;
    // data['postcodes'] = postcodes;
    data['country_id'] = countryId;
    data['country'] = country;
    data['admin1'] = admin1;
    data['admin3'] = admin3;
    data['admin4'] = admin4;
    data['admin2_id'] = admin2Id;
    data['admin2'] = admin2;
    return data;
  }
}
