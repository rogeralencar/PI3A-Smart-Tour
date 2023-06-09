import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

import '../../../../common/custom_button.dart';
import '../../../home/repository/interests_data.dart';
import '../../repository/user_model.dart';
import '../../repository/user_provider.dart';
import '../../viewmodel/auth_view_model.dart';

class FormScreen extends StatefulWidget {
  final User user;
  const FormScreen({
    super.key,
    required this.user,
  });

  @override
  State<FormScreen> createState() => FormScreenState();
}

class FormScreenState extends State<FormScreen> {
  List<String> selectedInterests = [];

  bool get isButtonEnabled => selectedInterests.length >= 3;
  final AuthViewModel _authViewModel = AuthViewModel();

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
    UserProvider userProvider = Provider.of(context, listen: false);

    try {
      String interests = widget.user.interests.join(', ');
      final user = await _authViewModel.register(
          widget.user.email, widget.user.password, widget.user.name, interests);

      userProvider.setUser(User.fromJson(user));
      Modular.to.navigate('/home/');
    } catch (error) {
      _showErrorDialog('unexpected_error: $error'.i18n());
    }
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context, listen: false);
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'form_title'.i18n(),
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: List<Widget>.generate(
                        interestsList.length,
                        (int index) {
                          final interest = interestsList[index];
                          return ChoiceChip(
                            selected: selectedInterests.contains(interest.name),
                            label: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Icon(interest.iconData),
                                Padding(
                                  padding: const EdgeInsets.only(left: 26.0),
                                  child: Text(
                                    interest.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: selectedInterests
                                              .contains(interest.name)
                                          ? Theme.of(context)
                                              .colorScheme
                                              .tertiary
                                          : Theme.of(context)
                                              .colorScheme
                                              .outline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            selectedColor:
                                Theme.of(context).colorScheme.secondary,
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  selectedInterests.add(interest.name);
                                } else {
                                  selectedInterests.remove(interest.name);
                                }
                              });
                            },
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                isEnabled: isButtonEnabled,
                onPressed: () {
                  widget.user.interests = selectedInterests;
                  _submit();
                  userProvider.setUser(widget.user);
                  Modular.to.navigate('/home/');
                },
                buttonText: 'continue'.i18n(),
                size: screenSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
