import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

Future<List> apiResponse(query) async {
  String apiKey = 'D0H1102ESxdfYd4MOO3lzccHeAuPIcfkqfzuivLLu_M';
  var client = http.Client();

  try {
    final response = await client.get(
        'https://api.unsplash.com/search/photos?per_page=30&client_id=$apiKey&query=$query');
    final jsonData = json.decode(response.body);
    // for (var item in jsonData["results"]) {
    //   print((item["urls"].length));
    // }
    // print(jsonData);
    return (jsonData["results"] as List);
  } catch (e) {
    print(e);
    return [];
  }
}
