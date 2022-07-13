// ignore_for_file: constant_identifier_names

class Constants {
  static const String API_KEY = "API_KEY_HERE";
  static const String BASE_API_URL = "https://api.themoviedb.org/3";
  static const String API_IMAGE_URL = "https://image.tmdb.org/t/p/w500";

  static const searchMoviesURL = '$BASE_API_URL/search/movie?api_key=$API_KEY';

  static const moviesPopularURL =
      '$BASE_API_URL/movie/popular?api_key=$API_KEY';

  static const upcomingMoviesURL =
      '$BASE_API_URL/movie/upcoming?api_key=$API_KEY';

  static const topRated = '$BASE_API_URL/movie/top_rated?api_key=$API_KEY';

  static const nowPlaying = '$BASE_API_URL/movie/now_playing?api_key=$API_KEY';

  static const trending = '$BASE_API_URL/trending/movie/week?api_key=$API_KEY';
}
