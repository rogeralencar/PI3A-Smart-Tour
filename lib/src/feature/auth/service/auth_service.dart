import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class AuthService {
  static const _baseUrl = 'http://10.0.2.2:8000';

  Future<dynamic> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/jwt/create/'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    final user = await http.get(
      Uri.parse('$_baseUrl/auth/users/me/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'JWT ${json.decode(response.body)['access']}'
      },
    );

    return jsonDecode(user.body);
  }

  List<String> splitInterests(String text) {
    return text.split(',');
  }

  Future<dynamic> register(
      String email, String password, String name, String interests) async {
    await http.post(
      Uri.parse('$_baseUrl/auth/users/'),
      body: jsonEncode({
        'email': email,
        'name': name,
        'password': password,
        'interests': interests,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    final userlogin = login(email, password);

    return userlogin;
  }

  Future<dynamic> resetPassword(String email) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/users/reset_password/'),
      body: jsonEncode({
        'email': email,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    log('Response: ${response.body}');
    return response.body;
  }
}
