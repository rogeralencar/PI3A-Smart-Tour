import 'package:flutter/material.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  InterestsScreenState createState() => InterestsScreenState();
}

class InterestsScreenState extends State<InterestsScreen> {
  List<String> interests = [
    'Arquitetura',
    'Artesanato',
    'Aventura',
    'Culinária',
    'História',
    'Música',
    'Natureza',
    'Paisagem',
    'Passeios de barco',
    'Praia',
    'Relaxamento',
    'Romance',
    'Surfe',
    'Vida noturna',
    'Vida selvagem',
    'Vinícolas',
  ];
  List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
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
    );
  }
}
