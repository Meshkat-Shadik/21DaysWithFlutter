import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherData});
  final dynamic weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();

  double temperature;
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
    if (weatherData != null) {
      temperature = weatherData['main']['temp'];
      weatherCondition = weatherModel
          .getWeatherIcon(weatherData['weather'][0]['id'])
          .toString();
      cityName = weatherData['name'];
      message = weatherModel.getMessage(weatherData['main']['temp']).toString();
    } else {
      temperature = 0;
      weatherCondition = 'Error';
      cityName = ' ';
      message = 'Unable to get weather Data!';
      return;
    }
  }

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
                    onPressed: () {
                      Navigator.pushNamed(context, '/searchScreen');
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
                      '${temperature.toStringAsFixed(1)}°',
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
