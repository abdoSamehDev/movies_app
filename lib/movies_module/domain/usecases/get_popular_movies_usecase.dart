import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies_module/domain/entities/movie.dart';
import 'package:movies_app/movies_module/domain/repository/movies_repository.dart';
import 'package:movies_app/movies_module/domain/usecases/base_usecase.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>> {
  final MoviesRepository _repository;

  GetPopularMoviesUseCase(this._repository);



  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await _repository.getPopularMovies();
  }
}
