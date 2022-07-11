class Constants {
  // ignore: constant_identifier_names
  static const String API_KEY = "6ee08abf792ae460668806133c782b4c";
  // ignore: constant_identifier_names
  static const String BASE_API_URL = "https://api.themoviedb.org/3";
  // ignore: constant_identifier_names
  static const String API_IMAGE_URL = "https://image.tmdb.org/t/p/w500";

  static const searchMoviesURL = '$BASE_API_URL/search/movie?api_key=$API_KEY';

  static const moviesPopularURL =
      '$BASE_API_URL/movie/popular?api_key=$API_KEY';

  static const upcomingMoviesURL =
      '$BASE_API_URL/movie/upcoming?api_key=$API_KEY';

  static const topRated = '$BASE_API_URL/movie/upcoming?api_key=$API_KEY';

  static const nowPlaying = '$BASE_API_URL/movie/now_playing?api_key=$API_KEY';
}
