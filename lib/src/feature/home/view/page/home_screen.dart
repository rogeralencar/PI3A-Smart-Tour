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
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 60),
            const Text(
              'Smart Tour',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0096C7)),
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                const Text(
                  'What is the destination of the trip?',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0096C7)),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const AutocompletePlaces(),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Suggestions',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0096C7)),
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

@immutable
class Places {
  const Places({
    required this.location,
    required this.name,
  });

  final String location;
  final String name;

  @override
  String toString() {
    return '$name, $location';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Places && other.name == name && other.location == location;
  }

  @override
  int get hashCode => Object.hash(location, name);
}

class AutocompletePlaces extends StatelessWidget {
  const AutocompletePlaces({super.key});

  static const List<Places> _userOptions = <Places>[
    Places(name: 'São Paulo, SP', location: 'São Paulo'),
    Places(name: 'Rio de Janeiro, RJ', location: 'Rio de Janeiro'),
    Places(name: 'Brasília, DF', location: 'Distrito Federal'),
    Places(name: 'Salvador, BA', location: 'Bahia'),
    Places(name: 'Fortaleza, CE', location: 'Ceará'),
    Places(name: 'Belo Horizonte, MG', location: 'Minas Gerais'),
    Places(name: 'Manaus, AM', location: 'Amazonas'),
    Places(name: 'Curitiba, PR', location: 'Paraná'),
    Places(name: 'Recife, PE', location: 'Pernambuco'),
    Places(name: 'Porto Alegre, RS', location: 'Rio Grande do Sul'),
    Places(name: 'Belém, PA', location: 'Pará'),
    Places(name: 'Goiânia, GO', location: 'Goiás'),
    Places(name: 'Guarulhos, SP', location: 'São Paulo'),
    Places(name: 'Campinas, SP', location: 'São Paulo'),
    Places(name: 'São Luís, MA', location: 'Maranhão'),
    Places(name: 'São Gonçalo, RJ', location: 'Rio de Janeiro'),
    Places(name: 'Maceió, AL', location: 'Alagoas'),
    Places(name: 'Duque de Caxias, RJ', location: 'Rio de Janeiro'),
    Places(name: 'Natal, RN', location: 'Rio Grande do Norte'),
    Places(name: 'Teresina, PI', location: 'Piauí'),
    Places(name: 'Campo Grande, MS', location: 'Mato Grosso do Sul'),
    Places(name: 'Osasco, SP', location: 'São Paulo'),
    Places(name: 'Santo André, SP', location: 'São Paulo'),
    Places(name: 'João Pessoa, PB', location: 'Paraíba'),
    Places(name: 'Jaboatão dos Guararapes, PE', location: 'Pernambuco'),
    Places(name: 'Contagem, MG', location: 'Minas Gerais'),
    Places(name: 'São José dos Campos, SP', location: 'São Paulo'),
    Places(name: 'Uberlândia, MG', location: 'Minas Gerais'),
    Places(name: 'Feira de Santana, BA', location: 'Bahia'),
    Places(name: 'Ribeirão Preto, SP', location: 'São Paulo'),
    Places(name: 'Sorocaba, SP', location: 'São Paulo'),
    Places(name: 'Cuiabá, MT', location: 'Mato Grosso'),
    Places(name: 'Aparecida de Goiânia, GO', location: 'Goiás'),
    Places(name: 'Aracaju, SE', location: 'Sergipe'),
    Places(name: 'Londrina, PR', location: 'Paraná'),
    Places(name: 'Juiz de Fora, MG', location: 'Minas Gerais'),
    Places(name: 'Joinville, SC', location: 'Santa Catarina'),
    Places(name: 'Niterói, RJ', location: 'Rio de Janeiro'),
    Places(name: 'São João de Meriti, RJ', location: 'Rio de Janeiro'),
    Places(name: 'Ananindeua, PA', location: 'Pará'),
    Places(name: 'Belford Roxo, RJ', location: 'Rio de Janeiro'),
    Places(name: 'Ponta Grossa, PR', location: 'Paraná'),
    Places(name: 'Barra Mansa, RJ', location: 'Rio de Janeiro'),
    Places(name: 'Rio Grande, RS', location: 'Rio Grande do Sul'),
    Places(name: 'Catanduva, SP', location: 'São Paulo'),
    Places(name: 'São João de Meriti, RJ', location: 'Rio de Janeiro'),
    Places(name: 'Ferraz de Vasconcelos, SP', location: 'São Paulo'),
    Places(name: 'Jacareí, SP', location: 'São Paulo'),
    Places(name: 'São Carlos, SP', location: 'São Paulo'),
    Places(name: 'Cabo de Santo Agostinho, PE', location: 'Pernambuco'),
    Places(name: 'Varginha, MG', location: 'Minas Gerais'),
    Places(name: 'Abaetetuba, PA', location: 'Pará'),
    Places(name: 'São José, SC', location: 'Santa Catarina'),
    Places(name: 'Paragominas, PA', location: 'Pará'),
    Places(name: 'Itapecerica da Serra, SP', location: 'São Paulo'),
    Places(name: 'Guarapari, ES', location: 'Espírito Santo'),
    Places(name: 'Bragança Paulista, SP', location: 'São Paulo'),
    Places(name: 'Mauá, SP', location: 'São Paulo'),
    Places(name: 'Birigui, SP', location: 'São Paulo'),
    Places(name: 'Itapevi, SP', location: 'São Paulo'),
    Places(name: 'São Sebastião do Paraíso, MG', location: 'Minas Gerais'),
    Places(name: 'São José do Rio Preto, SP', location: 'São Paulo'),
    Places(name: 'Barretos, SP', location: 'São Paulo'),
    Places(name: 'Osasco, SP', location: 'São Paulo'),
    Places(name: 'Bento Gonçalves, RS', location: 'Rio Grande do Sul'),
    Places(name: 'Santa Bárbara d\'Oeste, SP', location: 'São Paulo'),
    Places(name: 'Votorantim, SP', location: 'São Paulo'),
    Places(name: 'Cariacica, ES', location: 'Espírito Santo'),
    Places(name: 'São Leopoldo, RS', location: 'Rio Grande do Sul'),
    Places(name: 'Porto Seguro, BA', location: 'Bahia'),
    Places(name: 'Sumaré, SP', location: 'São Paulo'),
    Places(name: 'Várzea Grande, MT', location: 'Mato Grosso'),
    Places(name: 'Alegrete, RS', location: 'Rio Grande do Sul'),
    Places(name: 'Palhoça, SC', location: 'Santa Catarina'),
    Places(name: 'Montes Claros, MG', location: 'Minas Gerais'),
    Places(name: 'Paulo Afonso, BA', location: 'Bahia'),
    Places(name: 'Araucária, PR', location: 'Paraná'),
    Places(name: 'Carapicuíba, SP', location: 'São Paulo'),
    Places(name: 'Indaiatuba, SP', location: 'São Paulo'),
    Places(name: 'Itumbiara, GO', location: 'Goiás'),
    Places(name: 'Parnaíba, PI', location: 'Piauí'),
    Places(name: 'Santana do Livramento, RS', location: 'Rio Grande do Sul'),
    Places(name: 'Itabira, MG', location: 'Minas Gerais'),
    Places(name: 'Itapipoca, CE', location: 'Ceará'),
    Places(name: 'Araras, SP', location: 'São Paulo'),
    Places(name: 'Paragominas, PA', location: 'Pará'),
    Places(name: 'Araranguá, SC', location: 'Santa Catarina'),
    Places(name: 'Itapetinga, BA', location: 'Bahia'),
    Places(name: 'Assis, SP', location: 'São Paulo'),
    Places(name: 'Ji-Paraná, RO', location: 'Rondônia'),
    Places(name: 'Almirante Tamandaré, PR', location: 'Paraná'),
    Places(name: 'Penedo, AL', location: 'Alagoas'),
    Places(name: 'Garanhuns, PE', location: 'Pernambuco'),
    Places(name: 'Luziânia, GO', location: 'Goiás'),
    Places(name: 'Tatuí, SP', location: 'São Paulo'),
    Places(name: 'Jaguarão, RS', location: 'Rio Grande do Sul'),
    Places(name: 'Santa Inês, MA', location: 'Maranhão'),
    Places(name: 'Conselheiro Lafaiete, MG', location: 'Minas Gerais'),
    Places(name: 'Balsas, MA', location: 'Maranhão'),
    Places(name: 'Tucuruí, PA', location: 'Pará'),
    Places(name: 'Maracanaú, CE', location: 'Ceará'),
    Places(name: 'São Gabriel, RS', location: 'Rio Grande do Sul'),
    Places(name: 'Jataí, GO', location: 'Goiás'),
    Places(name: 'Jaguaquara, BA', location: 'Bahia'),
    Places(name: 'Guanambi, BA', location: 'Bahia'),
    Places(name: 'Guaxupé, MG', location: 'Minas Gerais'),
    Places(name: 'Garanhuns, PE', location: 'Pernambuco'),
    Places(name: 'Mirassol, SP', location: 'São Paulo'),
    Places(name: 'Ariquemes, RO', location: 'Rondônia'),
    Places(name: 'Leme, SP', location: 'São Paulo'),
    Places(name: 'São Luiz Gonzaga, RS', location: 'Rio Grande do Sul'),
    Places(name: 'Santo Ângelo, RS', location: 'Rio Grande do Sul'),
    Places(name: 'Santa Rosa, RS', location: 'Rio Grande do Sul'),
    Places(name: 'São Sepé, RS', location: 'Rio Grande do Sul'),
    Places(name: 'São Francisco do Sul, SC', location: 'Santa Catarina'),
    Places(name: 'João Monlevade, MG', location: 'Minas Gerais'),
    Places(name: 'Palmares, PE', location: 'Pernambuco'),
  ];

  static String _displayStringForOption(Places option) => option.name;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Places>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Places>.empty();
        }
        return _userOptions.where((Places option) {
          return option
              .toString()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (Places selection) {
        debugPrint(_displayStringForOption(selection));
      },
    );
  }
}
