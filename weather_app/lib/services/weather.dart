import 'package:weather_app/services/location.dart';

import 'networking.dart';

const appId = '126a1bfa19c59da5f3fcb88d289614c5';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(double temp) {
    if (temp >= 30) {
      return 'It\'s 🍦 time in';
    } else if (temp > 20 && temp < 30) {
      return 'Time for 🩳 and 👕 in';
    } else if (temp < 20) {
      return 'You\'ll need 🧣 and 🧤 in';
    } else {
      return 'Bring a 🧥 just in case in';
    }
  }
}

class WeatherDataReturn {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?lat=${location.lattitude}&lon=${location.longitude}&appid=${appId}&units=metric');

    dynamic decodeData = await networkHelper.getData();
    return decodeData;
  }
}
