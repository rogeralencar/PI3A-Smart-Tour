import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:smart_tour/src/feature/auth/repository/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final data = await _authRepository.login(email, password);
    final user = jsonDecode(data);

    return user;
  }

  Future<Map<String, dynamic>> register(String email, String password,
      String username, List<String> interests, int age) async {
    final data = await _authRepository.register(
        email, password, username, interests, age);
    final user = jsonDecode(data);

    return user;
  }
}
