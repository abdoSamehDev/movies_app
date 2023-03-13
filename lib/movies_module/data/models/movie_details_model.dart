import 'package:movies_app/movies_module/data/models/genres_model.dart';
import 'package:movies_app/movies_module/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {

  const MovieDetailsModel(
      {required super.id,
      required super.backdropPath,
      required super.genres,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => MovieDetailsModel(
      id: json["id"],
      title: json["title"],
      backdropPath: json["backdrop_path"],
      genres: List<GenresModel>.from(json["genres"].map((e) => GenresModel.fromJson(e))),
      overview: json["overview"],
      runtime: json["runtime"],
      voteAverage: json["vote_average"].toDouble(),
      releaseDate: json["release_date"]);
}
