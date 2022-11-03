import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/location.dart';

// const baseUrl =
//     'http://dataservice.accuweather.com/locations/v1/cities/search?apikey=Ib1qthW5jNCN6Yi9f2zyvqoYDPsL33nB&q=hanoi';

class LocationRepository {
  // final http.Client httpClient;
  // LocationRepository({required this.httpClient}) : assert(httpClient != null);
  Future<Location?> getCurrentLocation(String? location) async {
    try {
      var endpoint = Uri.parse(
          // "http://dataservice.accuweather.com/locations/v1/cities/search?apikey=Ib1qthW5jNCN6Yi9f2zyvqoYDPsL33nB&q=$location");
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=22e603cc8befdf8c701e16bd2c104f20&units=metric");
      var resposne = await http.get(endpoint);
      var body = jsonDecode(resposne.body);
      print(Location.fromJson(body));
      return Location.fromJson(body);
    } catch (e) {
      print(e);
      rethrow;

      // return Location.fromJson(jsonresposne[0]);
    }
  }
}
