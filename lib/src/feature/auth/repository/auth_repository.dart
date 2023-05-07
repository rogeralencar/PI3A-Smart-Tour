import 'package:smart_tour/src/feature/auth/service/auth_service.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future<dynamic> login(String email, String password) async {
    return await _authService.login(email, password);
  }

  Future<dynamic> register(String email, String password, String username,
      List<String> interests, int age) async {
    return await _authService.register(
        email, password, username, interests, age);
  }
}
