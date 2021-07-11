import 'package:flutter_weather_demo/home_page/_model/weather_in_cities.dart';

class WeatherEntry {
  late String cityName;
  late String iconURL;
  late double wind;
  late double rain;
  late double temperature;
  late String description;

  WeatherEntry(City city) {
    this.cityName = city.name;
    this.iconURL = city.weather.isNotEmpty
        ? "https://openweathermap.org/img/w/${city.weather[0].icon}.png"
        : "";
    this.description = city.weather != "" ? city.weather[0].description : "";
    this.wind = city.wind.speed.toDouble();
    this.rain = rain;
    this.temperature = city.main.temp;
  }
}
