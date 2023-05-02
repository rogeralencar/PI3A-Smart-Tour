import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../repository/user_data.dart';
import 'form_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isValidEmail(String email) {
    RegExp emailRegExp = RegExp(
        r'^[a-zA-Z0-9.!#$%&*+\=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$');
    return emailRegExp.hasMatch(email);
  }

  bool isValidPassword(String password) {
    RegExp passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(password);
  }

  bool isValidAge(String age) {
    int? ageValue = int.tryParse(age);
    return ageValue != null && ageValue > 0;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final user = User(
        name: _nameController.text,
        age: int.parse(_ageController.text),
        email: _emailController.text,
        password: _passwordController.text,
        interests: [],
      );
      Modular.to.push(
        MaterialPageRoute(
          builder: (_) => FormScreen(user: user),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0096C7),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'lib/assets/images/logo.png',
                      height: 170,
                    ),
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 60),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: '\t\t\t\t\t\tEnter your name',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                alignLabelWithHint: false,
                              ),
                              maxLines: 1,
                              keyboardType: TextInputType.emailAddress,
                              controller: _nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Por favor, insira seu nome';
                                }
                                if (value.length < 3) {
                                  return 'Seu nome deve ter pelo menos 3 caracteres';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                labelText: '\t\t\t\t\t\tEnter your Age',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              controller: _ageController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Por favor, insira sua idade';
                                } else if (!isValidAge(value)) {
                                  return 'Insira uma idade válida';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: '\t\t\t\t\t\tEnter your E-mail',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                alignLabelWithHint: false,
                              ),
                              maxLines: 1,
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Por favor, insira o e-mail';
                                } else if (!isValidEmail(value)) {
                                  return 'Insira um e-mail válido';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                labelText: '\t\t\t\t\t\tEnter Password',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              obscureText: true,
                              controller: _passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Por favor, insira a senha';
                                } else if (!isValidPassword(value)) {
                                  return 'Insira uma senha válida (mínimo de 8 caracteres com pelo menos uma letra maiúscula, uma letra minúscula, um número e um caractere especial)';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 56,
                          vertical: 6,
                        ),
                        elevation: 20,
                      ),
                      child: const Text(
                        "SIGN IN",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account ? ',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Modular.to.pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange.shade700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 4,
                            ),
                            elevation: 20,
                          ),
                          child: const Text(
                            "LOG IN",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
