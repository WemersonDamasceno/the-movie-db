import 'package:flutter_test/flutter_test.dart';
import 'package:the_movies_db/app/models/movie_model.dart';
import 'package:the_movies_db/app/services/movies_service.dart';
import 'package:the_movies_db/app/utils/enums.dart';

void main() {
  MoviesService movieService = MoviesService();
  setUp(() {
    movieService = MoviesService();
  });

  group("Movies service", () {
    test('should return a list of movies', () async {
      final response = await movieService.getMoviesByType(
          page: 1, moviesType: MoviesType.popular);
      expect(response["movies"], isA<List<MovieModel>>());
    });

    test('should return a list of movies with a message', () async {
      final response = await movieService.getMoviesByType(
          page: 1, moviesType: MoviesType.popular);
      expect(response['message'], "success");
    });

    test('should return a list of movies with a status code', () async {
      final response = await movieService.getMoviesByType(
          page: 1, moviesType: MoviesType.popular);
      expect(response['statusCode'], 200);
    });

    test('should not return a list of movies with an empty list', () async {
      final response = await movieService.getMoviesByType(
        page: 1,
        moviesType: MoviesType.popular,
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
