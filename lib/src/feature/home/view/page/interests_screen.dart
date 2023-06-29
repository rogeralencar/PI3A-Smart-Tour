import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

import '../../../../common/custom_button.dart';
import '../../../../common/interests_data.dart';
import '../../../auth/repository/user_model.dart';
import '../../../auth/repository/user_provider.dart';

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({Key? key}) : super(key: key);

  Widget buildInterestItem(int itemIndex, BuildContext context, User? user) {
    String? interestName = user!.interests[itemIndex];
    Interests? interest = interestsList.firstWhere(
      (element) => element.name == interestName,
    );
    return SizedBox(
      height: 140,
      child: Column(
        children: [
          Icon(
            interest.iconData,
            size: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
          Text(
            interest.name,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    User? user = userProvider.user;
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'trip_interests'.i18n(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int index = 0; index < user!.interests.length; index++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: buildInterestItem(index, context, user),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButton(
                onPressed: () => Modular.to.pushNamed('interestsSelection'),
                buttonText: 'Edit Interests',
                size: screenSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
