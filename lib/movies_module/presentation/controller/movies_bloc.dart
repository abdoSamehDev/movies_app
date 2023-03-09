import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies_module/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_app/movies_module/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies_module/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies_module/presentation/controller/movies_event.dart';
import 'package:movies_app/movies_module/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetPlayingNowUseCase _getPlayingNowUseCase;
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;

  MoviesBloc(this._getPlayingNowUseCase, this._getPopularMoviesUseCase,
      this._getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingEvent>(_getNowPlaying);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }


Future _getNowPlaying(GetNowPlayingEvent event,Emitter<MoviesState> emit) async {
    final result = await _getPlayingNowUseCase();
    result.fold(
          (l) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        ),
      ),
          (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

Future _getPopularMovies(GetPopularMoviesEvent event,Emitter<MoviesState> emit) async {
  final result = await _getPopularMoviesUseCase();
  result.fold(
        (l) => emit(
      state.copyWith(
        popularState: RequestState.error,
        popularMessage: l.message,
      ),
    ),
        (r) => emit(
      state.copyWith(
        popularMovies: r,
        popularState: RequestState.loaded,
      ),
    ),
  );
}

Future _getTopRatedMovies(GetTopRatedMoviesEvent event,Emitter<MoviesState> emit) async {
  final result = await _getTopRatedMoviesUseCase();
  result.fold(
        (l) => emit(
      state.copyWith(
        topRatedState: RequestState.error,
        topRatedMessage: l.message,
      ),
    ),
        (r) => emit(
      state.copyWith(
        topRatedMovies: r,
        topRatedState: RequestState.loaded,
      ),
    ),
  );
}

}
