class AppConstants{
  static const String apiKey = "c8a93a95339f4ab7a815ecd659d13f6e";
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String nowPlayingPath = "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath = "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath = "$baseUrl/movie/top_rated?api_key=$apiKey";
  static String movieDetailsPath(int movieId) => "$baseUrl/movie/$movieId?api_key=$apiKey";
  static String movieRecommendationPath(int movieId) => "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";


  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => "$baseImageUrl$path";
}