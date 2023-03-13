import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies_module/domain/entities/recommendation.dart';
import 'package:movies_app/movies_module/domain/repository/movies_repository.dart';
import 'package:movies_app/movies_module/domain/usecases/base_usecase.dart';

class GetRecommendationMoviesUseCase
    extends BaseUseCase<int, List<MovieRecommendation>> {
  final MoviesRepository _repository;

  GetRecommendationMoviesUseCase(this._repository);
  @override
  Future<Either<Failure, List<MovieRecommendation>>> call(int input) async {
    return await _repository.getMovieRecommendation(input);
  }
}
