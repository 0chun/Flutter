import 'package:flutter/material.dart';

import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screen/weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikey = '5a73d48b63d820f93eff5bde8484b522';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? latitude3;
  double? longitude3;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;

    print(latitude3);
    print(longitude3);
    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longitude3&appid=$apikey');

    var weather = await network.getJsonData();

    print(weather);

    var air = await network.getAirData();

    print(air);
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return WeatherScreen(
          parseWeatherData: weather,
          parseAirData: air,
        );
      },
    ));
  }

  // void fetchData() async {

  //     var myJson = parsingData['weather'][0]['description'];
  //     print(myJson);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80,
        ),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       null;
      //     },
      //     style: ElevatedButton.styleFrom(
      //       textStyle: const TextStyle(color: Colors.white),
      //       primary: Colors.blue,
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(4),
      //       ),
      //     ),
      //     child: const Text('Get My Location'),
      //   ),
      // ),
    );
  }
}
