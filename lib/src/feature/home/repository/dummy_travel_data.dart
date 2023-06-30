import 'travel_model.dart';

List<Travel> travelList = [
  Travel(
    userId: "user1",
    destinyName: "Salvador, Bahia",
    departureDate: DateTime(2023, 7, 15),
    returnDate: DateTime(2023, 7, 22),
    description:
        "Explore a cidade de Salvador, com suas praias deslumbrantes, rica cultura afro-brasileira e arquitetura histórica. Visite o Pelourinho, experimente a culinária baiana e aproveite as festas e ritmos locais.",
    images: [
      "salvador_image1.jpg",
      "salvador_image2.jpg",
      "salvador_image3.jpg"
    ],
    interests: ["Praias", "Cultura", "Arquitetura", "Gastronomia", "Música"],
    rating: 4.7,
  ),
  Travel(
    userId: "user1",
    destinyName: "Fernando de Noronha, Pernambuco",
    departureDate: DateTime(2023, 8, 10),
    returnDate: DateTime(2023, 8, 20),
    description:
        "Viva uma experiência paradisíaca em Fernando de Noronha, um arquipélago com praias de tirar o fôlego e rica vida marinha. Faça mergulho, trilhas, e aproveite a tranquilidade e beleza natural desse destino único.",
    images: [
      "fernando_noronha_image1.jpg",
      "fernando_noronha_image2.jpg",
      "fernando_noronha_image3.jpg"
    ],
    interests: [
      "Praias",
      "Mergulho",
      "Natureza",
      "Ecoturismo",
      "Preservação Ambiental"
    ],
    rating: 4.5,
  ),
  Travel(
    userId: "user1",
    destinyName: "Bonito, Mato Grosso do Sul",
    departureDate: DateTime(2023, 9, 5),
    returnDate: DateTime(2023, 9, 12),
    description:
        "Descubra a beleza natural de Bonito, com suas águas cristalinas, cachoeiras deslumbrantes e grutas subterrâneas. Faça flutuação em rios, explore trilhas ecológicas e aproveite as atividades de ecoturismo oferecidas na região.",
    images: ["bonito_image1.jpg", "bonito_image2.jpg", "bonito_image3.jpg"],
    interests: [
      "Natureza",
      "Aventura",
      "Ecoturismo",
      "Cachoeiras",
      "Preservação Ambiental"
    ],
    rating: 4.8,
  ),
  Travel(
    userId: "user2",
    destinyName: "Gramado, Rio Grande do Sul",
    departureDate: DateTime(2023, 10, 8),
    returnDate: DateTime(2023, 10, 15),
    description:
        "Experimente o charme de Gramado, uma cidade encantadora com arquitetura europeia, belos jardins e clima serrano. Visite os parques temáticos, desfrute da culinária local e aproveite os festivais e eventos culturais da região.",
    images: ["gramado_image1.jpg", "gramado_image2.jpg", "gramado_image3.jpg"],
    interests: [
      "Cultura",
      "Gastronomia",
      "Natureza",
      "Festivais",
      "Arquitetura"
    ],
    rating: 4.6,
  ),
  Travel(
    userId: "user2",
    destinyName: "Manaus, Amazonas",
    departureDate: DateTime(2023, 11, 12),
    returnDate: DateTime(2023, 11, 20),
    description:
        "Explore a exuberante cidade de Manaus, cercada pela Floresta Amazônica. Descubra a biodiversidade da região, faça passeios de barco pelos rios e visite o famoso Teatro Amazonas, um marco cultural da cidade.",
    images: ["manaus_image1.jpg", "manaus_image2.jpg", "manaus_image3.jpg"],
    interests: [
      "Natureza",
      "Cultura",
      "Passeios de Barco",
      "Ecoturismo",
      "Arquitetura"
    ],
    rating: 4.9,
  ),
  Travel(
    userId: "user2",
    destinyName: "Búzios, Rio de Janeiro",
    departureDate: DateTime(2024, 1, 5),
    returnDate: DateTime(2024, 1, 12),
    description:
        "Visite Búzios, uma charmosa cidade litorânea no Rio de Janeiro, conhecida por suas praias deslumbrantes e atmosfera sofisticada. Explore as praias, pratique esportes aquáticos e aproveite a animada vida noturna.",
    images: ["buzios_image1.jpg", "buzios_image2.jpg", "buzios_image3.jpg"],
    interests: [
      "Praias",
      "Esportes Aquáticos",
      "Gastronomia",
      "Vida Noturna",
      "Turismo de Luxo"
    ],
    rating: 4.7,
  ),
  Travel(
    userId: "user3",
    destinyName: "Chapada dos Veadeiros, Goiás",
    departureDate: DateTime(2024, 2, 20),
    returnDate: DateTime(2024, 2, 27),
    description:
        "Embarque em uma aventura pela Chapada dos Veadeiros, uma região de natureza exuberante, com cachoeiras, trilhas e paisagens de tirar o fôlego. Explore os parques nacionais, desfrute de banhos em águas cristalinas e conecte-se com a natureza.",
    images: [
      "chapada_veadeiros_image1.jpg",
      "chapada_veadeiros_image2.jpg",
      "chapada_veadeiros_image3.jpg"
    ],
    interests: [
      "Natureza",
      "Aventura",
      "Cachoeiras",
      "Trilhas",
      "Preservação Ambiental"
    ],
    rating: 4.9,
  ),
  Travel(
    userId: "user3",
    destinyName: "Jericoacoara, Ceará",
    departureDate: DateTime(2024, 3, 15),
    returnDate: DateTime(2024, 3, 23),
    description:
        "Viva dias inesquecíveis em Jericoacoara, uma praia paradisíaca com dunas, lagoas e cenários de tirar o fôlego. Pratique esportes de vento, faça passeios de buggy e aproveite o pôr do sol nas famosas dunas.",
    images: [
      "jericoacoara_image1.jpg",
      "jericoacoara_image2.jpg",
      "jericoacoara_image3.jpg"
    ],
    interests: [
      "Praias",
      "Esportes de Vento",
      "Passeios de Buggy",
      "Natureza",
      "Pôr do Sol"
    ],
    rating: 4.8,
  ),
  Travel(
    userId: "user4",
    destinyName: "Lençóis Maranhenses, Maranhão",
    departureDate: DateTime(2024, 6, 20),
    returnDate: DateTime(2024, 6, 28),
    description:
        "Explore a beleza única dos Lençóis Maranhenses, um parque nacional com dunas, lagoas e paisagens deslumbrantes. Caminhe pelas dunas, refresque-se nas lagoas de água cristalina e maravilhe-se com a imensidão desse paraíso natural.",
    images: [
      "lencois_maranhenses_image1.jpg",
      "lencois_maranhenses_image2.jpg",
      "lencois_maranhenses_image3.jpg"
    ],
    interests: [
      "Natureza",
      "Aventura",
      "Fotografia",
      "Lagoas",
      "Preservação Ambiental"
    ],
    rating: 4.9,
  ),
  Travel(
    userId: "user4",
    destinyName: "Bonito, Mato Grosso do Sul",
    departureDate: DateTime(2024, 7, 10),
    returnDate: DateTime(2024, 7, 18),
    description:
        "Descubra as águas cristalinas de Bonito, um destino de ecoturismo no coração do Brasil. Faça flutuação em rios de águas transparentes, mergulhe em cavernas e conheça a rica fauna e flora da região.",
    images: ["bonito_image1.jpg", "bonito_image2.jpg", "bonito_image3.jpg"],
    interests: [
      "Natureza",
      "Ecoturismo",
      "Flutuação",
      "Mergulho",
      "Preservação Ambiental"
    ],
    rating: 4.6,
  ),
  Travel(
    userId: "user5",
    destinyName: "Fernando de Noronha, Pernambuco",
    departureDate: DateTime(2024, 8, 15),
    returnDate: DateTime(2024, 8, 23),
    description:
        "Viva uma experiência inesquecível em Fernando de Noronha, um arquipélago paradisíaco com praias de águas cristalinas e rica vida marinha. Faça mergulhos, trilhas e aprecie a beleza natural desse paraíso preservado.",
    images: [
      "fernando_noronha_image1.jpg",
      "fernando_noronha_image2.jpg",
      "fernando_noronha_image3.jpg"
    ],
    interests: [
      "Praias",
      "Mergulho",
      "Natureza",
      "Preservação Ambiental",
      "Trilhas"
    ],
    rating: 4.9,
  ),
  Travel(
    userId: "user5",
    destinyName: "Gramado, Rio Grande do Sul",
    departureDate: DateTime(2024, 9, 10),
    returnDate: DateTime(2024, 9, 18),
    description:
        "Encante-se com a atmosfera europeia de Gramado, uma cidade serrana no sul do Brasil. Explore a arquitetura charmosa, deguste chocolates artesanais, aproveite festivais temáticos e encante-se com as belezas naturais da região.",
    images: ["gramado_image1.jpg", "gramado_image2.jpg", "gramado_image3.jpg"],
    interests: [
      "Clima Serrano",
      "Cultura",
      "Gastronomia",
      "Festivais",
      "Natureza"
    ],
    rating: 4.7,
  ),
  Travel(
    userId: "user5",
    destinyName: "Chapada dos Veadeiros, Goiás",
    departureDate: DateTime(2024, 10, 8),
    returnDate: DateTime(2024, 10, 15),
    description:
        "Explore as trilhas e cachoeiras da Chapada dos Veadeiros, um paraíso natural no centro do Brasil. Descubra paisagens deslumbrantes, banhe-se em piscinas naturais e conecte-se com a energia desse lugar místico.",
    images: [
      "chapada_veadeiros_image1.jpg",
      "chapada_veadeiros_image2.jpg",
      "chapada_veadeiros_image3.jpg"
    ],
    interests: [
      "Natureza",
      "Trilhas",
      "Cachoeiras",
      "Preservação Ambiental",
      "Misticismo"
    ],
    rating: 4.6,
  ),
  Travel(
    userId: "user6",
    destinyName: "Praia do Forte, Bahia",
    departureDate: DateTime(2024, 11, 12),
    returnDate: DateTime(2024, 11, 20),
    description:
        "Relaxe nas belas praias da Praia do Forte, um refúgio tropical no nordeste do Brasil. Curta o sol, faça passeios de barco, visite o Projeto Tamar e desfrute da deliciosa gastronomia baiana.",
    images: [
      "praia_forte_image1.jpg",
      "praia_forte_image2.jpg",
      "praia_forte_image3.jpg"
    ],
    interests: [
      "Praias",
      "Natureza",
      "Passeios de Barco",
      "Preservação Ambiental",
      "Gastronomia"
    ],
    rating: 4.9,
  ),
  Travel(
    userId: "user6",
    destinyName: "Manaus, Amazonas",
    departureDate: DateTime(2024, 12, 5),
    returnDate: DateTime(2024, 12, 12),
    description:
        "Adentre a Floresta Amazônica em Manaus, a capital do estado do Amazonas. Conheça o encontro das águas dos rios Negro e Solimões, faça passeios de barco pela selva, visite comunidades indígenas e desvende os segredos da maior floresta tropical do mundo.",
    images: ["manaus_image1.jpg", "manaus_image2.jpg", "manaus_image3.jpg"],
    interests: [
      "Natureza",
      "Floresta Amazônica",
      "Passeios de Barco",
      "Cultura Indígena",
      "Preservação Ambiental"
    ],
    rating: 4.8,
  ),
  Travel(
    userId: "user6",
    destinyName: "Campos do Jordão, São Paulo",
    departureDate: DateTime(2025, 1, 8),
    returnDate: DateTime(2025, 1, 15),
    description:
        "Aproveite o clima ameno e a arquitetura europeia de Campos do Jordão, uma cidade serrana no estado de São Paulo. Explore os jardins, saboreie chocolates, visite o Palácio Boa Vista e desfrute de momentos aconchegantes nesse destino encantador.",
    images: [
      "campos_jordao_image1.jpg",
      "campos_jordao_image2.jpg",
      "campos_jordao_image3.jpg"
    ],
    interests: [
      "Clima Serrano",
      "Gastronomia",
      "Natureza",
      "Arquitetura",
      "Passeios a Pé"
    ],
    rating: 4.7,
  ),
];
