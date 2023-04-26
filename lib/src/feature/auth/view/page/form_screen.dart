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
    'Cuisine',
    'Cultural heritage',
    'Culture',
    'Dance',
    'Ecotourism',
    'Events',
    'Family vacations',
    'Festivals',
    'Forests',
    'Gastronomic travel',
    'Gastronomy',
    'Golf',
    'Helicopter tours',
    'Historical sites',
    'History',
    'Hiking',
    'Islands',
    'Kitesurfing',
    'Luxury',
    'Luxury tourism',
    'Markets',
    'Mountain',
    'Museums',
    'Natural wonders',
    'Nature',
    'Nightlife',
    'National parks',
    'Ocean',
    'Photographic safaris',
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
    'Whale watching',
    'Wildlife',
    'Wildlife refuges',
    'Wine tasting',
    'Local experiences',
    'Adventure tourism',
    'Luxury travel',
    'Cultural life'
  ];
  List<String> selectedInterests = [];

  bool get isButtonEnabled => selectedInterests.length >= 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0096c7),
              Color(0xFF03045e),
            ],
          ),
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
                            label: Text(interest),
                            selected: selectedInterests.contains(interest),
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
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
