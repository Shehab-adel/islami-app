import 'dart:convert';

import '../../model/radio_response.dart';
import 'package:http/http.dart' as http;

class DataResponse {
  static Future<RadioResponse> fetchRadio() async {
    http.Response response =
    await http.get(
        Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json'));
    RadioResponse radioResponse = radioResponseFromJson(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return radioResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }
}