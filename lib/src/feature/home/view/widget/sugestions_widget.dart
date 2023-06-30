import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../auth/repository/user_model.dart';
import '../../repository/dummy_travel_data.dart';
import '../../repository/travel_model.dart';

class SuggestionsWidget extends StatelessWidget {
  final User user;
  const SuggestionsWidget({Key? key, required this.user}) : super(key: key);

  List<Travel> _generateSuggestions(User user) {
    List<Travel> suggestions = [];

    for (var travel in travelList) {
      if (travel.interests
          .any((interest) => user.interests.contains(interest))) {
        suggestions.add(travel);
      }
    }

    return suggestions;
  }

  @override
  Widget build(BuildContext context) {
    List<Travel> suggestions = [];
    suggestions = _generateSuggestions(user);
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(suggestions.length, (index) {
          return GestureDetector(
            onTap: () {
              Modular.to.pushNamed('travelDetail', arguments: {
                'userId': user.userId,
                'travel': suggestions[index],
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  suggestions[index].images[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}