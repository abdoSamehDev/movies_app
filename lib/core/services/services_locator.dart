import 'package:get_it/get_it.dart';
import 'package:movies_app/movies_module/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies_module/data/repository/movies_repository_impl.dart';
import 'package:movies_app/movies_module/domain/repository/movies_repository.dart';
import 'package:movies_app/movies_module/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_app/movies_module/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator{
  void init(){
    //Bloc
    sl.registerFactory(() => MoviesBloc(sl()));
    //Use Cases
    sl.registerLazySingleton(() => GetPlayingNowUseCase(sl()));
    //Repository
    sl.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(sl()));
    //Data Source
    sl.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl());
  }
}