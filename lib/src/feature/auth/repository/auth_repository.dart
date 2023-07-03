import 'package:smart_tour/src/feature/auth/service/auth_service.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future<dynamic> login(String email, String password) async {
    return await _authService.login(email, password);
  }

  Future<dynamic> register(String email, String password, String name,
      String interests) async {
    return await _authService.register(
        email, password, name, interests);
  }

  Future<dynamic> resetPassword(String email) async {
    return await _authService.resetPassword(email);
  }
}
