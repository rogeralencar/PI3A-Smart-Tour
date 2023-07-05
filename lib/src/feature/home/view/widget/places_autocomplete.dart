import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'dart:developer';

import 'package:smart_tour/src/feature/recommendation/viewmodel/recommendation_view_model.dart';

import '../../../../common/location_util.dart';
import '../../repository/dummy_travel_data.dart';

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

// ignore: must_be_immutable
class AutocompletePlaces extends StatefulWidget {
  final List userInterests;
  final int? userId;
  Map<String, dynamic> detail;

  AutocompletePlaces({
    super.key,
    required this.userInterests,
    required this.userId,
    required this.detail,
  });

  static final RecommendationViewModel _recommendationViewModel =
      RecommendationViewModel();

  static const List<Places> _userOptions = <Places>[
    Places(name: 'São Paulo, SP', location: 'São Paulo'),
    Places(name: 'Ilhabela, SP', location: 'Ilhabela'),
    Places(name: 'Ipojuca, PE', location: 'Ipojuca'),
    Places(name: 'Itacaré, BA', location: 'Itacaré'),
    Places(
        name: 'Jijoca de Jericoacoara, CE', location: 'Jijoca de Jericoacoara'),
    Places(name: 'Maragogi, AL', location: 'Maragogi'),
    Places(name: 'Maceió, AL', location: 'Maceió'),
    Places(name: 'Ouro Preto, MG', location: 'Ouro Preto'),
    Places(name: 'Olinda, PE', location: 'Olinda'),
    Places(name: 'Petrópolis, RJ', location: 'Petrópolis'),
    Places(name: 'Porto Seguro, BA', location: 'Porto Seguro'),
    Places(name: 'Rio de Janeiro, RJ', location: 'Rio de Janeiro'),
    Places(name: 'Salvador, BA', location: 'Salvador'),
    Places(name: 'Santos, SP', location: 'Santos'),
    Places(name: 'Vitória, ES', location: 'Vitória'),
  ];

  static String _displayStringForOption(Places option) => option.name;

  @override
  State<AutocompletePlaces> createState() => _AutocompletePlacesState();
}

class _AutocompletePlacesState extends State<AutocompletePlaces> {
  bool isLoading = false;

  Future<void> gerarListaDetalhesPontosTuristicos(
      Map<String, dynamic> detail) async {
    final travelDetails =
        await LocationUtil.obterDetalhesPontosTuristicos([detail['nome']]);
    if (travelDetails != null) {
      travelList.add(travelDetails);
    }
  }

  void _submit(int id, String local, List<dynamic> interests) async {
    try {
      setState(() => isLoading = true);
      travelList.clear();
      final rec = await AutocompletePlaces._recommendationViewModel
          .getRecommendation(id, local, interests);

      widget.detail = await AutocompletePlaces._recommendationViewModel
          .getDetailPlace(rec['recomendações'][0]);

      await gerarListaDetalhesPontosTuristicos(widget.detail);
    } catch (error) {
      log('unexpected_error $error'.i18n());
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.outline,
            ),
          )
        : Column(
            children: [
              Autocomplete<Places>(
                displayStringForOption:
                    AutocompletePlaces._displayStringForOption,
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return AutocompletePlaces._userOptions;
                  } else {
                    return AutocompletePlaces._userOptions.where((option) {
                      return option.name
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  }
                },
                onSelected: (Places selection) {
                  _submit(
                      widget.userId!, selection.location, widget.userInterests);

                  List<Places> filteredDestinations =
                      AutocompletePlaces._userOptions.where((destination) {
                    return widget.userInterests.contains(destination.name);
                  }).toList();

                  log(filteredDestinations.toString());
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController textEditingController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: 'search'.i18n(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: onFieldSubmitted,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
  }
}
