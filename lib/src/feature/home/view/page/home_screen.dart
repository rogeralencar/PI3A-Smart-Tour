import 'package:flutter/material.dart';

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
          children: [
            const SizedBox(height: 40),
            const Text(
              'Smart Tour',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'What is the destination of the trip?',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Suggestions',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
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
