class WeatherInCities {
  WeatherInCities({
    required this.cod,
    required this.calctime,
    required this.cnt,
    required this.cities,
  });

  final int cod;
  final double calctime;
  final int cnt;
  final List<City> cities;

  factory WeatherInCities.fromJson(Map<String, dynamic> json) =>
      WeatherInCities(
        cod: json["cod"] as int,
        calctime: json["calctime"] as double,
        cnt: json["cnt"] as int,
        cities: List<City>.from((json["list"] as List)
            .map((x) => City.fromJson(x as Map<String, dynamic>))
            .toList()),
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "calctime": calctime,
        "cnt": cnt,
        "list": List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}

class City {
  City({
    required this.id,
    required this.dt,
    required this.name,
    required this.coord,
    required this.main,
    required this.visibility,
    required this.wind,
    this.rain,
    this.snow,
    required this.clouds,
    required this.weather,
  });

  final int id;
  final int dt;
  final String name;
  final Coord coord;
  final MainClass main;
  final int visibility;
  final Wind wind;
  final dynamic rain;
  final dynamic snow;
  final Clouds clouds;
  final List<Weather> weather;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] as int,
        dt: json["dt"] as int,
        name: json["name"] as String,
        coord: Coord.fromJson(json["coord"] as Map<String, dynamic>),
        main: MainClass.fromJson(json["main"] as Map<String, dynamic>),
        visibility: json["visibility"] == 0 ? 0 : json["visibility"] as int,
        wind: Wind.fromJson(json["wind"] as Map<String, dynamic>),
        rain: json["rain"],
        snow: json["snow"],
        clouds: Clouds.fromJson(json["clouds"] as Map<String, dynamic>),
        weather: List<Weather>.from((json["weather"] as List)
            .map((x) => Weather.fromJson(x as Map<String, dynamic>))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dt": dt,
        "name": name,
        "coord": coord.toJson(),
        "main": main.toJson(),
        "visibility": visibility == null ? null : visibility,
        "wind": wind.toJson(),
        "rain": rain,
        "snow": snow,
        "clouds": clouds.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
      };
}

class Clouds {
  Clouds({
    required this.today,
  });

  final int today;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        today: json["today"] as int,
      );

  Map<String, dynamic> toJson() => {
        "today": today,
      };
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  final double lon;
  final double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: (json["Lon"] as num).toDouble(),
        lat: (json["Lat"] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Lon": lon,
        "Lat": lat,
      };
}

class MainClass {
  MainClass({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,

  });

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;


  factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: (json["temp"] as num).toDouble(),
        feelsLike: (json["feels_like"] as num).toDouble(),
        tempMin: (json["temp_min"] as num).toDouble(),
        tempMax: (json["temp_max"] as num).toDouble(),
        pressure: json["pressure"] as int,
        humidity: json["humidity"] as int,
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int id;
  final String main;
  final String description;
  final String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] as int,
        main: json["main"] as String,
        description: json["description"] as String,
        icon: json["icon"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
  });

  final num speed;
  final int deg;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"] as num,
        deg: json["deg"] as int,
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
      };
}
