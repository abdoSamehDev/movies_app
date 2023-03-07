import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies_module/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_app/movies_module/presentation/controller/movies_event.dart';
import 'package:movies_app/movies_module/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetPlayingNowUseCase getPlayingNowUseCase;

  MoviesBloc(this.getPlayingNowUseCase) : super(const MoviesState()) {
    on<GetNowPlayingEvent>((event, emit) async {
      final result = await getPlayingNowUseCase.execute();
      emit(const MoviesState(nowPlayingState: RequestState.loaded));
      result.fold(
          (l) => emit(MoviesState(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message)),
          (r) => emit(MoviesState(
                nowPlayingMovies: r,
                nowPlayingState: RequestState.loaded,
              )));
    });
  }
}
