import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

import '../../../auth/repository/user_model.dart';
import '../../../auth/repository/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context, listen: false);
    User? user = userProvider.user;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('lib/assets/images/user.png'),
          ),
          const SizedBox(height: 10),
          Text(
            user!.name ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    'historic'.i18n(),
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
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
