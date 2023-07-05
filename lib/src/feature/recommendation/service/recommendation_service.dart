import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class RecommendationService {
  static const _baseUrl = 'http://10.0.2.2:8000';

  Future<dynamic> getRecommendation(
      int id, String local, List<dynamic> interests) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/api/user-data/'),
      body: jsonEncode({'id': id, 'cidade': local, 'interests': interests}),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    log(response.body);

    return jsonDecode(response.body);
  }

  Future<dynamic> getDetailsOfPlace(String local) async {
    var apiKey = "AIzaSyDf7OTq3OtAmHtKQOYATKxJHrQqBwhEC5k";
    var url =
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$local&inputtype=textquery&fields=geometry,photos&key=$apiKey";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    log(response.body);

    return jsonDecode(response.body);
  }
}
