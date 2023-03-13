import 'package:movies_app/movies_module/domain/entities/recommendation.dart';

class MovieRecommendationModel extends MovieRecommendation {
  const MovieRecommendationModel({
    required super.id,
    super.backdropPath,
  });

  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommendationModel(
        id: json["id"],
        backdropPath: json["backdrop_path"] ?? "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg",
      );
}
