import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies_module/domain/entities/movie.dart';
import 'package:movies_app/movies_module/domain/repository/movies_repository.dart';
import 'package:movies_app/movies_module/domain/usecases/base_usecase.dart';

class GetPlayingNowUseCase extends BaseUseCase<NoParameters, List<Movie>>{
  final MoviesRepository _repository;

  GetPlayingNowUseCase(this._repository);

  @override
  Future<Either<Failure, List<Movie>>> call(input) async{
    return await _repository.getNowPlaying();
  }
}
