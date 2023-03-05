import 'package:movies_app/movies_module/domain/entities/movie.dart';
import 'package:movies_app/movies_module/domain/repository/movies_repository.dart';
class GetPopularMoviesUseCase{



  final MoviesRepository _repository;

  GetPopularMoviesUseCase(this._repository);

  Future<List<Movie>> execute() async{
  return await _repository.getPopularMovies();
  }

}