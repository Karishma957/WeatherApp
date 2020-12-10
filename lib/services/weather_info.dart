import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WeatherInfo {
  String location;

  String time;

  var temperature;

  String isWhatTime;

  String isWhatWeather;

  String weather;

  String description;

  var humidity;

  var windSpeed;

  WeatherInfo({this.location});

  Future<void> getWeather() async {
    try {
      Response response = await get(
          'http://api.openweathermap.org/data/2.5/weather?q=$location&units=metric&appid=51d4253be9d917c64d55f641c8667a18');
      Map data = jsonDecode(response.body);
      Map locationInfo = data['coord'];
      double longitude = locationInfo['lon'];
      double latitude = locationInfo['lat'];

      Response timeResponse = await get(
          'http://api.timezonedb.com/v2.1/get-time-zone?key=RS53SZN921N8&format=json&by=position&lat=$latitude.52&lng=$longitude');
      Map timeData = jsonDecode(timeResponse.body);
      DateTime now = DateTime.parse(timeData['formatted']);
      this.time = DateFormat.jm().format(now);

      this.weather = data['weather'][0]['main'];
      this.description = data['weather'][0]['description'];

      this.temperature = data['main']['temp'];
      this.humidity = data['main']['humidity'];

      this.windSpeed = data['wind']['speed'];

      if(now.hour>=5 && now.hour<16){
        isWhatTime='morning';
      }
      else if(now.hour>=16 && now.hour<20){
        isWhatTime='evening';
      }
      else{
        isWhatTime='night';
      }

      if(weather=='ThunderStorm' || weather=='Drizzle' || weather=='Rain' ){
        isWhatWeather='rain';
      }
      else if(weather=='Clouds'){
        isWhatWeather='clouds';
      }
      else if(weather=='Snow'){
        isWhatWeather='cold';
      }
      else if(weather=='Clear'){
        isWhatWeather='hot';
      }
      else{
        isWhatWeather='mist';
      }

    } catch (e) {
      print('error');
      time = 'error caught';
    }
  }

}
