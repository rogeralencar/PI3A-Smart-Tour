import 'package:smart_tour/src/feature/recommendation/service/recommendation_service.dart';

class RecommendationRepository {
  final RecommendationService _recommendationService = RecommendationService();

  Future<dynamic> getRecommendation(
      int id, String local, List<dynamic> interests) async {
    return await _recommendationService.getRecommendation(id, local, interests);
  }

  Future<dynamic> getDetailPlace(String local) async {
    return await _recommendationService.getDetailsOfPlace(local);
  }
}
