import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies_module/domain/entities/movie.dart';
import 'package:movies_app/movies_module/domain/entities/movie_details.dart';

import '../entities/recommendation.dart';

abstract class MoviesRepository{
  Future<Either<Failure, List<Movie>>> getNowPlaying();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId);
  Future<Either<Failure, List<MovieRecommendation>>> getMovieRecommendation(int movieId);
}