import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../repository/dummy_travel_data.dart';

class SuggestionsWidget extends StatelessWidget {
  const SuggestionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(travelList.length, (index) {
          return GestureDetector(
            onTap: () {
              Modular.to
                  .pushNamed('travelDetail', arguments: travelList[index]);
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
                  travelList[index].images[0],
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
