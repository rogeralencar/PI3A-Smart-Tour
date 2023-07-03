import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

import '../../repository/user_model.dart';
import '../../repository/user_provider.dart';
import '../../viewmodel/auth_view_model.dart';
import '../../../../common/custom_button.dart';
import '../../../../common/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _email = '';
  String _password = '';
  bool _isLoading = false;

  final AuthViewModel _authViewModel = AuthViewModel();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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

    UserProvider userProvider = Provider.of(context, listen: false);

    try {
      final user = await _authViewModel.login(_email, _password);

      userProvider.setUser(User.fromJson(user));
      Modular.to.navigate('/home/');
    } catch (error) {
      _showErrorDialog('unexpected_error $error'.i18n());
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
                      'login_title'.i18n(),
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
                              text: 'email_field'.i18n(),
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'email_required'.i18n();
                                }
                                return null;
                              },
                              onSaved: (email) => _email = email ?? '',
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
                              controller: _passwordController,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password_required'.i18n();
                                }
                                return null;
                              },
                              onSaved: (password) => _password = password ?? '',
                              onFieldSubmitted: (_) {
                                _submit();
                              },
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.008),
                          TextButton(
                            onPressed: () {
                              Modular.to.pushNamed('forgotPassword');
                            },
                            style: const ButtonStyle(
                              alignment: Alignment.centerRight,
                            ),
                            child: Text(
                              'forgot_password'.i18n(),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontSize: screenSize.width * 0.04,
                              ),
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
                            buttonText: 'login'.i18n(),
                            onPressed: _submit,
                          ),
                    SizedBox(height: screenSize.height * 0.12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'without_account'.i18n(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: screenSize.width * 0.04,
                          ),
                        ),
                        CustomButton(
                          size: screenSize,
                          buttonText: 'sign_up'.i18n(),
                          onPressed: () {
                            Modular.to.pushNamed('signup/');
                          },
                          isBig: false,
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.04),
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
