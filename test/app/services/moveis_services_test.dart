import 'package:flutter_test/flutter_test.dart';
import 'package:the_movies_db/app/core/const/constants_api.dart';
import 'package:the_movies_db/app/models/movie_model.dart';
import 'package:the_movies_db/app/services/implements/movies_service_implements.dart';

void main() {
  MoviesServiceImplements movieService = MoviesServiceImplements();
  setUp(() {
    movieService = MoviesServiceImplements();
  });

  group("Movies service", () {
    test('should return a list of movies', () async {
      final response = await movieService.getMoviesByType(
        page: 1,
        url: Uri.parse('${Constants.upcomingMoviesURL}&page=1'),
      );
      expect(response["movies"], isA<List<MovieModel>>());
    });

    test('should return a list of movies with a message', () async {
      final response = await movieService.getMoviesByType(
        page: 1,
        url: Uri.parse('${Constants.upcomingMoviesURL}&page=1'),
      );
      expect(response['message'], "success");
    });

    test('should return a list of movies with a status code', () async {
      final response = await movieService.getMoviesByType(
        page: 1,
        url: Uri.parse('${Constants.upcomingMoviesURL}&page=1'),
      );
      expect(response['statusCode'], 200);
    });

    test('should not return a list of movies with an empty list', () async {
      final response = await movieService.getMoviesByType(
        page: 1,
        url: Uri.parse('${Constants.upcomingMoviesURL}&page=1'),
      );
      expect(response['movies'].isNotEmpty, true);
    });

    test('should return movies with the query string', () async {
      final response = await movieService.searchMovies(query: "club", page: 1);
      expect(response['movies'].isNotEmpty, true);
    });
    test('should return a list movies', () async {
      final response = await movieService.searchMovies(query: "club", page: 1);
      expect(response['movies'], isA<List<MovieModel>>());
    });
  });
}
