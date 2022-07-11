import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:the_movies_db/app/models/movie_model.dart';
import 'package:the_movies_db/app/utils/constants.dart';

class MoviesService {
  getMoviesByType({required int page, required Uri url}) async {
    final response = await http.get(
      url,
      headers: {'Accept': 'application/json'},
    );
    try {
      var json = convert.jsonDecode(response.body);
      if (json != null) {
        final movies = json['results']
            .map<MovieModel>((movie) => MovieModel.fromJson(movie))
            .toList();
        return Future.value({
          'movies': movies,
          'message': "success",
          'statusCode': 200,
        });
      }
    } catch (e) {
      return Future.value({
        'movies': [],
        'message': "Não foi possível carregar os filmes",
        'statusCode': 400,
      });
    }
  }

  Future searchMovies({required String query, required int page}) async {
    var url = Uri.parse('${Constants.searchMoviesURL}&page=$page&query=$query');
    final response = await http.get(
      url,
      headers: {'Accept': 'application/json'},
    );
    try {
      var json = convert.jsonDecode(response.body);
      if (json != null) {
        final movies = json['results']
            .map<MovieModel>((movie) => MovieModel.fromJson(movie))
            .toList();
        return Future.value({
          'movies': movies,
          'message': "success",
          'statusCode': 200,
        });
      }
    } catch (e) {
      return Future.value({
        'movies': [],
        'message': "Não foi possível carregar os filmes",
        'statusCode': 400,
      });
    }
  }
}
