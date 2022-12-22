import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/models.dart';
class DataService {
  Future<WeatherResponse> getWeatherbycity(String city) async{
    final queary = {
      'q': city,
      'appid':'f35b2254a129d66303bb71038a7e6159',
      'units':'metric',
    };
    final uri = Uri.http('api.openweathermap.org','/data/2.5/weather',queary);
    
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);

  }
}