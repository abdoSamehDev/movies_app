import 'package:movies_app/movies_module/domain/entities/movie.dart';
import 'package:movies_app/movies_module/domain/repository/movies_repository.dart';
class GetTopRatedMoviesUseCase{



  final MoviesRepository _repository;

  GetTopRatedMoviesUseCase(this._repository);

  Future<List<Movie>> execute() async{
    return await _repository.getTopRatedMovies();
  }

}