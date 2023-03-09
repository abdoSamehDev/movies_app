import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/movies_module/data/models/movie_details_model.dart';
import 'package:movies_app/movies_module/data/models/movie_model.dart';
import 'package:movies_app/movies_module/data/models/recommendation_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(int movieId);
  Future<List<MovieRecommendationModel>> getMovieRecommendation(int movieId);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource{
  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final response = await Dio().get(
        AppConstants.nowPlayingPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(
        AppConstants.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(
        AppConstants.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final response = await Dio().get(
        AppConstants.movieDetailsPath(movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieRecommendationModel>> getMovieRecommendation(int movieId) async {
    final response = await Dio().get(
        AppConstants.movieRecommendationPath(movieId));

    if (response.statusCode == 200) {
      return List<MovieRecommendationModel>.from((response.data["results"] as List).map((e) => MovieRecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

}
