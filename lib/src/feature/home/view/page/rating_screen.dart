import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  RatingScreenState createState() => RatingScreenState();
}

class RatingScreenState extends State<RatingScreen> {
  final List<Map<String, dynamic>> _trips = [
    {
      'destination': 'Rio de Janeiro',
      'rating': 4.5,
      'date': '12/05/2021',
    },
    {
      'destination': 'Orlando',
      'rating': 5,
      'date': '07/11/2021',
    },
    {
      'destination': 'Paris',
      'rating': 4,
      'date': '03/08/2022',
    },
  ];

  @override
  Widget build(BuildContext context) {
    _trips.sort((a, b) => b['rating'].compareTo(a['rating']));

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          Text(
            'rating_title'.i18n(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _trips.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('lib/assets/images/travels/travel.jpg'),
                    ),
                    title: Text(_trips[index]['destination']),
                    subtitle: Text('Note: ${_trips[index]['rating']}'),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'your_rating'.i18n(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _trips.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('lib/assets/images/travels/travel.jpg'),
                    ),
                    title: Text(_trips[index]['destination']),
                    subtitle: Text('Note: ${_trips[index]['rating']}'),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
