import 'package:flutter/cupertino.dart';
import 'package:smart_tour/src/feature/recommendation/repository/recommendation_repository.dart';

class RecommendationViewModel extends ChangeNotifier {
  final RecommendationRepository _recommendationRepository =
      RecommendationRepository();

  Future<Map<String, dynamic>> getRecommendation(
      int id, String local, List<dynamic> interests) async {
    final recommendations =
        await _recommendationRepository.getRecommendation(id, local, interests);

    return recommendations;
  }
}
