import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies_module/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies_module/domain/entities/movie.dart';
import 'package:movies_app/movies_module/domain/entities/movie_details.dart';
import 'package:movies_app/movies_module/domain/entities/recommendation.dart';
import 'package:movies_app/movies_module/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MovieRemoteDataSource _remoteDataSource;

  MoviesRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final result = await _remoteDataSource.getNowPlaying();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await _remoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await _remoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId) async {
    final result = await _remoteDataSource.getMovieDetails(movieId);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendation>>> getMovieRecommendation(int movieId) async {
    final result = await _remoteDataSource.getMovieRecommendation(movieId);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
