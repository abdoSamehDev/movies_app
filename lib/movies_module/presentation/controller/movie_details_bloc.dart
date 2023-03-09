import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies_module/domain/entities/movie_details.dart';
import 'package:movies_app/movies_module/domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  MovieDetailsBloc(this._getMovieDetailsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  Future _getMovieDetails(event, emit) async {
    final result = await _getMovieDetailsUseCase(event.id);
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: l.message,
        ),
      ),
      (r) => state.copyWith(
        movieDetailsState: RequestState.loaded,
        movieDetails: r,
      ),
    );
  }

  Future _getMovieRecommendation(event, emit) async {
    final result = await _getMovieDetailsUseCase(event.id);
    result.fold(
      (l) => emit(
        state.copyWith(
          movieRecommendationState: RequestState.error,
          movieRecommendationMessage: l.message,
        ),
      ),
      (r) => state.copyWith(
        movieRecommendationState: RequestState.loaded,
        movieRecommendation: r,
      ),
    );
  }
}
