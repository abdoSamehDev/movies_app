import 'package:equatable/equatable.dart';
import 'package:movies_app/movies_module/domain/entities/generes.dart';

class MovieDetails extends Equatable {
  final int id;
  final String backdropPath;
  final List<Genres> genres;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final String voteAverage;

  const MovieDetails({
    required this.id,
    required this.backdropPath,
    required this.genres,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        genres,
        overview,
        releaseDate,
        runtime,
        title,
        voteAverage,
      ];
}
