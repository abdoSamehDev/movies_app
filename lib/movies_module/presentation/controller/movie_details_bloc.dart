import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/movies_module/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies_module/domain/usecases/get_recommendation_movies_usecase.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(
      this._getMovieDetailsUseCase, this._getRecommendationMoviesUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  final GetRecommendationMoviesUseCase _getRecommendationMoviesUseCase;

  Future _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await _getMovieDetailsUseCase(event.id);
    result.fold(
        (l) => emit(
              state.copyWith(
                movieDetailsState: RequestState.error,
                movieDetailsMessage: l.message,
              ),
            ),
        (r) => emit(
              state.copyWith(
                movieDetailsState: RequestState.loaded,
                movieDetails: r,
              ),
            ));
  }

  Future _getMovieRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await _getRecommendationMoviesUseCase(event.id);
    result.fold(
        (l) => emit(
              state.copyWith(
                movieRecommendationState: RequestState.error,
                movieRecommendationMessage: l.message,
              ),
            ),
        (r) => emit(
              state.copyWith(
                movieRecommendationState: RequestState.loaded,
                movieRecommendation: r,
              ),
            ));
  }
}
