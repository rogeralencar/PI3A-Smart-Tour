import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => FormScreenState();
}

class FormScreenState extends State<FormScreen> {
  List<String> interests = [
    'Adventure',
    'Amusement parks',
    'Archaeological sites',
    'Architecture',
    'Art',
    'Beaches',
    'Bike tours',
    'Botanical gardens',
    'Brewery',
    'Churches',
    'Climbing',
    'Coral reefs',
    'Culture',
    'Dance',
    'Ecotourism',
    'Events',
    'Family vacations',
    'Festivals',
    'Forests',
    'Gastronomy',
    'Golf',
    'Helicopter tours',
    'Historical sites',
    'History',
    'Hiking',
    'Islands',
    'Kitesurfing',
    'Local experiences',
    'Luxury',
    'Markets',
    'Mountain',
    'Museums',
    'Natural wonders',
    'Nature',
    'Nightlife',
    'National parks',
    'Ocean',
    'Photography',
    'Relaxation',
    'Religious tourism',
    'Resorts',
    'River',
    'Romance',
    'Rural tourism',
    'Ruins',
    'Safaris',
    'Sanctuaries',
    'Shopping',
    'Sightseeing tours',
    'Skiing',
    'Snowboarding',
    'Spirituality',
    'Spa',
    'Surfing',
    'Theater',
    'Train tours',
    'Villages',
    'Volcanoes',
    'Water parks',
    'Wildlife',
    'Wine tasting',
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
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Select at least 3 interests',
                style: TextStyle(fontSize: 24, color: Colors.white),
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
                        Modular.to.pushNamed('/home/');
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
                child: const Text(
                  'Continue',
                  style: TextStyle(
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
