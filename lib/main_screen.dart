import 'package:flutter/material.dart';
import 'package:weatherapp/data_service.dart';
import 'package:weatherapp/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var city = TextEditingController();
  final dataService =DataService();
  WeatherResponse? _response ;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("Weather APP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(_response!= null)
                  Column(
                    children: [
                      Image(image: NetworkImage('${_response?.iconUrl}')),
                      Text('${_response?.tempinfo?.temperature?.round()}°',
                      style: const TextStyle(fontSize: 40),
                      ),
                      Text('${_response?.weatherInfo?.description}'),
                      Text('${_response?.cityName}'),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                TextFormField(
                  controller: city ,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "City",
                    border: OutlineInputBorder(),

                ),
                  textAlign: TextAlign.center,
                  onFieldSubmitted: (value) async{
                    final response = await dataService.getWeatherbycity(city.text);
                    setState(() {
                      _response = response;
                    });
                  },
                ),
                ElevatedButton(
                    onPressed: () async{
                      final response = await dataService.getWeatherbycity(city.text);
                      setState(() {
                        _response = response;
                      });
                    },
                    child: const Text("Search")),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
