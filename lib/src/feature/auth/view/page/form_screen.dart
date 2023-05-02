import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../../repository/user_data.dart';

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
  List<String> interests = [
    'Adventure'.i18n(),
    'Amusement parks'.i18n(),
    'Archaeological sites'.i18n(),
    'Architecture'.i18n(),
    'Art'.i18n(),
    'Beaches'.i18n(),
    'Bike tours'.i18n(),
    'Botanical gardens'.i18n(),
    'Brewery'.i18n(),
    'Churches'.i18n(),
    'Climbing'.i18n(),
    'Coral reefs'.i18n(),
    'Culture'.i18n(),
    'Dance'.i18n(),
    'Ecotourism'.i18n(),
    'Events'.i18n(),
    'Family vacations'.i18n(),
    'Festivals'.i18n(),
    'Forests'.i18n(),
    'Gastronomy'.i18n(),
    'Golf'.i18n(),
    'Helicopter tours'.i18n(),
    'Historical sites'.i18n(),
    'History'.i18n(),
    'Hiking'.i18n(),
    'Islands'.i18n(),
    'Kitesurfing'.i18n(),
    'Local experiences'.i18n(),
    'Luxury'.i18n(),
    'Markets'.i18n(),
    'Mountain'.i18n(),
    'Museums'.i18n(),
    'Natural wonders'.i18n(),
    'Nature'.i18n(),
    'Nightlife'.i18n(),
    'National parks'.i18n(),
    'Ocean'.i18n(),
    'Photography'.i18n(),
    'Relaxation'.i18n(),
    'Religious tourism'.i18n(),
    'Resorts'.i18n(),
    'River'.i18n(),
    'Romance'.i18n(),
    'Rural tourism'.i18n(),
    'Ruins'.i18n(),
    'Safaris'.i18n(),
    'Sanctuaries'.i18n(),
    'Shopping'.i18n(),
    'Sightseeing tours'.i18n(),
    'Skiing'.i18n(),
    'Snowboarding'.i18n(),
    'Spirituality'.i18n(),
    'Spa'.i18n(),
    'Surfing'.i18n(),
    'Theater'.i18n(),
    'Train tours'.i18n(),
    'Villages'.i18n(),
    'Volcanoes'.i18n(),
    'Water parks'.i18n(),
    'Wildlife'.i18n(),
    'Wine tasting'.i18n(),
  ];
  List<String> selectedInterests = [];

  bool get isButtonEnabled => selectedInterests.length >= 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0096C7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'form_title'.i18n(),
                style: const TextStyle(fontSize: 24, color: Colors.white),
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
                        interests.length,
                        (int index) {
                          final interest = interests[index];
                          return ChoiceChip(
                            selected: selectedInterests.contains(interest),
                            label: Text(
                              interest,
                              style: TextStyle(
                                fontSize: 18,
                                color: selectedInterests.contains(interest)
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            selectedColor: Colors.orange.shade700,
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  selectedInterests.add(interest);
                                } else {
                                  selectedInterests.remove(interest);
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
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        widget.user.interests = selectedInterests;
                        Modular.to.pushNamed('/home/', arguments: widget.user);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 6,
                  ),
                  elevation: 20,
                ),
                child: Text(
                  'continue'.i18n(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
