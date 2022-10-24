import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../data/models/location.dart';

// const baseUrl =
//     'http://dataservice.accuweather.com/locations/v1/cities/search?apikey=Ib1qthW5jNCN6Yi9f2zyvqoYDPsL33nB&q=hanoi';

class LocationRepository {
  // final http.Client httpClient;
  // LocationRepository({required this.httpClient}) : assert(httpClient != null);
  Future<Location?> getCurrentLocation(String? location) async {
    try {
      var endpoint = Uri.parse(
          "http://dataservice.accuweather.com/locations/v1/cities/search?apikey=Ib1qthW5jNCN6Yi9f2zyvqoYDPsL33nB&q=$location");
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
