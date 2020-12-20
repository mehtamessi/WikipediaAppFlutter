import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' show Client;

import 'package:wikipedia_app/model/wikipedia_response_model.dart';

class ApiProvider {
  Client client = Client();

  //This is the London weather API url available at this link: https://openweathermap.org/current
  final _baseUrl =
      "https://en.wikipedia.org//w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description&gpssearch=";
     // "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22";

  Future<WikipediaResponse> fetchLondonWeather(String searchKey) async {

    final response = await client.get(_baseUrl+searchKey+"&gpslimit=10");
    // Make the network call asynchronously to fetch the London weather data.
    print("RES"+response.body.toString());
   /* Fluttertoast.showToast(
      msg: searchKey,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      fontSize: 16.0,
      // textColor: Colors.pink
    );*/
    if (response.statusCode == 200) {
      return WikipediaResponse.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load weather');
    }
  }
}