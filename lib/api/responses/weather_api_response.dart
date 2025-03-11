/*{
"location": {
"name": "Rajkot",
"region": "Gujarat",
"country": "India",
"lat": 22.3,
"lon": 70.783,
"tz_id": "Asia/Kolkata",
"localtime_epoch": 1741688216,
"localtime": "2025-03-11 15:46"
},
"current": {
"last_updated_epoch": 1741688100,
"last_updated": "2025-03-11 15:45",
"temp_c": 38.6,
"temp_f": 101.6,
"is_day": 1,
"condition": {
"text": "Sunny",
"icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
"code": 1000
},
"wind_mph": 3.4,
"wind_kph": 5.4,
"wind_degree": 34,
"wind_dir": "NE",
"pressure_mb": 1010,
"pressure_in": 29.82,
"precip_mm": 0,
"precip_in": 0,
"humidity": 12,
"cloud": 0,
"feelslike_c": 38,
"feelslike_f": 100.3,
"windchill_c": 38.7,
"windchill_f": 101.6,
"heatindex_c": 38,
"heatindex_f": 100.3,
"dewpoint_c": 4.4,
"dewpoint_f": 39.9,
"vis_km": 10,
"vis_miles": 6,
"uv": 4.7,
"gust_mph": 3.9,
"gust_kph": 6.2
}
}*/

class WeatherApiResponse {
  Location? location;
  Current? current;

  WeatherApiResponse({
    this.location,
    this.current,
  });

  WeatherApiResponse.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    return data;
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = (json['lat'] as num?)?.toDouble();
    lon = (json['lon'] as num?)?.toDouble();
    tzId = json['tz_id'];
    localtimeEpoch = (json['localtime_epoch'] as num?)?.toInt();
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['region'] = region;
    data['country'] = country;
    data['lat'] = lat;
    data['lon'] = lon;
    data['tz_id'] = tzId;
    data['localtime_epoch'] = localtimeEpoch;
    data['localtime'] = localtime;
    return data;
  }
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  double? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  double? humidity;
  double? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = (json['last_updated_epoch'] as num?)?.toInt();
    lastUpdated = json['last_updated'];
    tempC = (json['temp_c'] as num?)?.toDouble();
    tempF = (json['temp_f'] as num?)?.toDouble();
    isDay = (json['is_day'] as num?)?.toInt();
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    windMph = (json['wind_mph'] as num?)?.toDouble();
    windKph = (json['wind_kph'] as num?)?.toDouble();
    windDegree = (json['wind_degree'] as num?)?.toDouble();
    windDir = json['wind_dir'];
    pressureMb = (json['pressure_mb'] as num?)?.toDouble();
    pressureIn = (json['pressure_in'] as num?)?.toDouble();
    precipMm = (json['precip_mm'] as num?)?.toDouble();
    precipIn = (json['precip_in'] as num?)?.toDouble();
    humidity = (json['humidity'] as num?)?.toDouble();
    cloud = (json['cloud'] as num?)?.toDouble();
    feelslikeC = (json['feelslike_c'] as num?)?.toDouble();
    feelslikeF = (json['feelslike_f'] as num?)?.toDouble();
    windchillC = (json['windchill_c'] as num?)?.toDouble();
    windchillF = (json['windchill_f'] as num?)?.toDouble();
    heatindexC = (json['heatindex_c'] as num?)?.toDouble();
    heatindexF = (json['heatindex_f'] as num?)?.toDouble();
    dewpointC = (json['dewpoint_c'] as num?)?.toDouble();
    dewpointF = (json['dewpoint_f'] as num?)?.toDouble();
    visKm = (json['vis_km'] as num?)?.toDouble();
    visMiles = (json['vis_miles'] as num?)?.toDouble();
    uv = (json['uv'] as num?)?.toDouble();
    gustMph = (json['gust_mph'] as num?)?.toDouble();
    gustKph = (json['gust_kph'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_updated_epoch'] = lastUpdatedEpoch;
    data['last_updated'] = lastUpdated;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['is_day'] = isDay;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    data['wind_mph'] = windMph;
    data['wind_kph'] = windKph;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['pressure_mb'] = pressureMb;
    data['pressure_in'] = pressureIn;
    data['precip_mm'] = precipMm;
    data['precip_in'] = precipIn;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikeC;
    data['feelslike_f'] = feelslikeF;
    data['windchill_c'] = windchillC;
    data['windchill_f'] = windchillF;
    data['heatindex_c'] = heatindexC;
    data['heatindex_f'] = heatindexF;
    data['dewpoint_c'] = dewpointC;
    data['dewpoint_f'] = dewpointF;
    data['vis_km'] = visKm;
    data['vis_miles'] = visMiles;
    data['uv'] = uv;
    data['gust_mph'] = gustMph;
    data['gust_kph'] = gustKph;
    return data;
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = (json['code'] as num?)?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['icon'] = icon;
    data['code'] = code;
    return data;
  }
}
