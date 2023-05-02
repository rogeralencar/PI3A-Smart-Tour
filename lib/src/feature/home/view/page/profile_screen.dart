import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile_title'.i18n()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('lib/assets/images/user.png'),
          ),
          const SizedBox(height: 10),
          Text(
            'user_name'.i18n(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'contry_origin'.i18n(),
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            'idions'.i18n(),
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Text(
            'trip_interests'.i18n(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(Icons.beach_access, size: 50),
                  Text('beaches'.i18n()),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.attractions, size: 50),
                  Text('adventure'.i18n()),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.local_activity, size: 50),
                  Text('culture'.i18n()),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.local_dining, size: 50),
                  Text('gastronomy'.i18n()),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('lib/assets/images/travel.jpg'),
                    ),
                    title: Text('travel ${index + 1}'),
                    subtitle: Text('date'.i18n()),
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
