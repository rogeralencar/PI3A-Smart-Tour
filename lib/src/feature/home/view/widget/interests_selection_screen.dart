import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

import '../../../../common/custom_button.dart';
import '../../../../common/interests_data.dart';
import '../../../auth/repository/user_model.dart';
import '../../../auth/repository/user_provider.dart';

class InterestsSelectionScreen extends StatefulWidget {
  const InterestsSelectionScreen({super.key});

  @override
  InterestsSelectionScreenState createState() =>
      InterestsSelectionScreenState();
}

class InterestsSelectionScreenState extends State<InterestsSelectionScreen> {
  late UserProvider userProvider;
  late User? user;
  List<String> selectedInterests = [];

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    user = userProvider.user;
    if (user != null) {
      selectedInterests = user!.interests;
    }
  }

  bool get isButtonEnabled => selectedInterests.length >= 3;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'form_title'.i18n(),
        style: TextStyle(
          fontSize: 24,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      )),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                  user!.interests = selectedInterests;
                  userProvider.setUser(user!);
                  Modular.to.pop();
                },
                buttonText: 'save'.i18n(),
                size: screenSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
