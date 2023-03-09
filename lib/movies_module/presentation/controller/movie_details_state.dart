part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final MovieDetails? movieRecommendation;
  final RequestState movieRecommendationState;
  final String movieRecommendationMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = "",
    this.movieRecommendation,
    this.movieRecommendationState = RequestState.loading,
    this.movieRecommendationMessage = "",
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    MovieDetails? movieRecommendation,
    RequestState? movieRecommendationState,
    String? movieRecommendationMessage,

  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieRecommendation: movieRecommendation ?? this.movieRecommendation,
      movieRecommendationState: movieRecommendationState ?? this.movieRecommendationState,
      movieRecommendationMessage: movieRecommendationMessage ?? this.movieRecommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        movieRecommendation,
        movieRecommendationState,
        movieRecommendationMessage,
      ];
}
