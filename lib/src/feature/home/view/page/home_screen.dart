import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

import '../../../auth/repository/user_model.dart';
import '../../../auth/repository/user_provider.dart';
import '../widget/places_autocomplete.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    'https://cdn.iset.io/assets/56017/produtos/1275/thumb_400-400-praia.jpg',
    'https://jornaldomedico.com.br/wp-content/uploads/C63D4B10-6687-4E46-9757-A47B648B6086.jpeg',
    'https://d2yfnz5to9nvdi.cloudfront.net/wp-content/uploads/2017/07/guia-destinos-voesimples-australia-oceania-sydney-400x400.jpg',
    'https://estaticos.globoradio.globo.com/fotos/2017/08/4b385647-c166-4b5c-9e89-b35f28cdd4f7.jpg.400x400_q75_box-568%2C0%2C1480%2C912_crop_detail.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/f/f4/Catedral_Metropolitana_de_Brasilia.jpg',
    'https://vc.cvc.com.br/media/8155284/salvador-elevador_lacerda_021-credito-divulgacaocvc.jpg',
    'https://static.vecteezy.com/ti/fotos-gratis/t1/11176357-galhos-de-carvalho-sobre-trilha-no-parque-da-cidade-foto.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context, listen: false);
    User? user = userProvider.user;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 60),
            Text(
              'app_name'.i18n(),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                Text(
                  'home_question'.i18n(),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AutocompletePlaces(
                    userInterests: user!.interests,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'suggestions'.i18n(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(images.length, (index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    width: 150,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: NetworkImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
