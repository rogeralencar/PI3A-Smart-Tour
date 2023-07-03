import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../../../../common/custom_button.dart';
import '../../../../common/custom_text_field.dart';
import '../../repository/user_model.dart';
import '../../viewmodel/auth_view_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthViewModel _authViewModel = AuthViewModel();
  bool _isLoading = false;

  String isValidEmail(String email) {
    // RegExp emailRegExp = RegExp(
    //     r'^[a-zA-Z0-9.!#$%&*+\=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$');
    // return emailRegExp.hasMatch(email);
    return email;
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

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('error_occurred'.i18n()),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('close'.i18n()),
          ),
        ],
      ),
    );
  }

  void _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }
    setState(() => _isLoading = true);

    _formKey.currentState!.save();

    try {
      final user = User(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        interests: [],
      );

      Modular.to.pushNamed('form', arguments: user);
    } catch (error) {
      _showErrorDialog(error.toString());
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.1,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'lib/assets/images/logo.png',
                      height: screenSize.height * 0.2,
                    ),
                    Text(
                      'sign_up_title'.i18n(),
                      style: TextStyle(
                        fontSize: screenSize.width * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenSize.height * 0.06),
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
                            child: CustomTextField(
                              text: 'name_field'.i18n(),
                              keyboardType: TextInputType.emailAddress,
                              controller: _nameController,
                              textInputAction: TextInputAction.next,
                              validator: (name) {
                                if (name!.isEmpty) {
                                  return 'name_required'.i18n();
                                }
                                if (name.length < 3) {
                                  return 'name_invalid'.i18n();
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.016),
                          Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: CustomTextField(
                              text: 'email_field'.i18n(),
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              textInputAction: TextInputAction.next,
                              // validator: (email) {
                              //   if (email!.isEmpty) {
                              //     return 'email_required'.i18n();
                              //   } else if (!isValidEmail(email)) {
                              //     return 'email_invalid'.i18n();
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.016),
                          Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: CustomTextField(
                              text: 'password_field'.i18n(),
                              obscureText: true,
                              controller: _passwordController,
                              textInputAction: TextInputAction.next,
                              validator: (password) {
                                if (password!.isEmpty) {
                                  return 'password_required'.i18n();
                                } else if (!isValidPassword(password)) {
                                  return 'password_invalid'.i18n();
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.016),
                          Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: CustomTextField(
                              text: 'confirm_password'.i18n(),
                              obscureText: true,
                              validator: (password) {
                                if (password != _passwordController.text) {
                                  return 'passwords_do_not_match'.i18n();
                                }
                                return null;
                              },
                              onFieldSubmitted: (_) {
                                _submit();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.04),
                    _isLoading
                        ? CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.outline,
                          )
                        : CustomButton(
                            size: screenSize,
                            onPressed: _submit,
                            buttonText: 'sign_in'.i18n(),
                          ),
                    SizedBox(height: screenSize.height * 0.08),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'with_account'.i18n(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: screenSize.width * 0.04,
                          ),
                        ),
                        CustomButton(
                          size: screenSize,
                          onPressed: () {
                            Modular.to.pop();
                          },
                          buttonText: 'login'.i18n(),
                          isBig: false,
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.02),
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
