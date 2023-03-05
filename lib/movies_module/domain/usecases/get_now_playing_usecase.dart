import 'package:movies_app/movies_module/domain/entities/movie.dart';
import 'package:movies_app/movies_module/domain/repository/movies_repository.dart';

class GetPlayingNowUseCase{
  final MoviesRepository _repository;

  GetPlayingNowUseCase(this._repository);

  Future<List<Movie>> execute() async{
    return await _repository.getNowPlaying();
  }
}