import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies_module/domain/entities/movie_details.dart';
import 'package:movies_app/movies_module/domain/repository/movies_repository.dart';
import 'package:movies_app/movies_module/domain/usecases/base_usecase.dart';

class GetMovieDetailsUseCase extends BaseUseCase<int, MovieDetails> {
  final MoviesRepository _repository;

  GetMovieDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, MovieDetails>> call(int input) async {
    return await _repository.getMovieDetails(input);
  }
}
