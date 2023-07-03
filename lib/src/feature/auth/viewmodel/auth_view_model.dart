import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:smart_tour/src/feature/auth/repository/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final user = await _authRepository.login(email, password);

    return user;
  }

  Future<Map<String, dynamic>> register(String email, String password,
      String username, String interests) async {
    final user=
        await _authRepository.register(email, password, username, interests);

    return user;
  }

  Future<Map<String, dynamic>> resetPassword(String email) async {
    final data = await _authRepository.resetPassword(email);
    final response = jsonDecode(data);

    return response;
  }
}
