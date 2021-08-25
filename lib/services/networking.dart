import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/screens/loading_screen.dart';


class NetworkHelper  {
  var temperature;
  var condition;
  var name;

  LoadingScreen l = new LoadingScreen();


  void getData() async{
    http.Response res =  await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));

    if(res.statusCode==200) {
      String data = res.body;
      var decodeData = jsonDecode(data);

      temperature = decodeData['main']['temp'];
      condition = decodeData['weather'][0]['id'];
      name =decodeData['name'];

      print(temperature);
      print(condition);
      print(name);
    }
  }
}