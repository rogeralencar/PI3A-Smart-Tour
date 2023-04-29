import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
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
          const Text(
            'Nome do Usuário',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'País de Origem: Brasil',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            'Idiomas Falados: Português, Inglês',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Interesses de Viagem',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [
                  Icon(Icons.beach_access, size: 50),
                  Text('Praia'),
                ],
              ),
              Column(
                children: const [
                  Icon(Icons.attractions, size: 50),
                  Text('Aventura'),
                ],
              ),
              Column(
                children: const [
                  Icon(Icons.local_activity, size: 50),
                  Text('Cultura'),
                ],
              ),
              Column(
                children: const [
                  Icon(Icons.local_dining, size: 50),
                  Text('Gastronomia'),
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
                    title: Text('Viagem ${index + 1}'),
                    subtitle: const Text('Data: 01/01/2023'),
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
