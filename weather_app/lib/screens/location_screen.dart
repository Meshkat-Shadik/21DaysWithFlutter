import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/utilities/constants.dart';

import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  static const String pathId = '/locationScreen';

  LocationScreen({this.weatherData});
  final dynamic weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();

  var temperature;
  String weatherCondition;
  String cityName;
  String message;
  @override
  void initState() {
    super.initState();
    weatherDataGrab(widget.weatherData);
  }

  void weatherDataGrab(dynamic weatherData) {
    // print('Updated');
    setState(() {
      if (weatherData != null) {
        temperature = (weatherData['main']['temp']);
        weatherCondition = weatherModel
            .getWeatherIcon(weatherData['weather'][0]['id'])
            .toString();
        cityName = weatherData['name'];
        message =
            weatherModel.getMessage(weatherData['main']['temp']).toString();
      } else {
        temperature = 0;
        weatherCondition = 'Error';
        cityName = ' ';
        message = 'Unable to get weather Data!';
        return;
      }
    });
  }
//main.temp   weather[0].id   name

  // void cityDataGrab(dynamic data2) {
  //   setState(() {
  //      if (data2 != null) {
  //     print(data2);
  //     //  print((double.parse(data['main']['temp'])).toString());
  //     temperature = (data2['main']['temp']);
  //     print(data2['main']['temp']);
  //     //   temperature = double.parse(data['main']['temp']);
  //     //temperature = (doudata['main']['temp']);
  //     // message = weatherModel.getMessage(data['main']['temp']);
  //     // weatherCondition = weatherModel.getWeatherIcon(data['weather'][0]['id']).toString();
  //     // cityName = data['name'];
  //     //    message = weatherModel.getMessage(data['main']['temp']).toString();
  //   }
  //   });

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      dynamic data =
                          await WeatherDataReturn().getLocationWeather();
                      weatherDataGrab(data);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedData =
                          await Navigator.pushNamed(context, CityScreen.pathId);
                      if (typedData != null) {
                        dynamic wData =
                            await WeatherDataReturn().getCityWeather(typedData);
                        // weatherDataGrab(wData);

                        weatherDataGrab(wData);
                        // print(wData['main']['temp']);
                        //  print(weatherModel.getWeatherIcon(wData['weather'][0]['id']).toString());
                        // print(weatherModel.getMessage(wData['main']['temp']));
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temperature}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherCondition',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "${message}",
                      textAlign: TextAlign.right,
                      style: kMessageTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "$cityName !",
                          style: kMessageTextStyle
                              .merge(TextStyle(color: Colors.orangeAccent)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
