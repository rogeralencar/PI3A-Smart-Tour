import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class AuthService {
  static const _baseUrl = 'http://10.0.2.2:8000';

  Future<dynamic> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login/'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    log('User: ${response.body}');

    return response.body;
  }

  Future<dynamic> register(String email, String password, String username,
      List<String> interests, int age) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register/'),
      body: jsonEncode({
        'email': email,
        'password': password,
        'interests': interests,
        'username': username,
        'age': age
      }),
      headers: {'Content-Type': 'application/json'},
    );

    log('User: ${response.body}');

    return response.body;
  }

  Future<dynamic> resetPassword(String email) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/resetPassword/'),
      body: jsonEncode({
        'email': email,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    log('Response: ${response.body}');

    return response.body;
  }
}
