import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:the_movies_db/app/core/const/constants_api.dart';
import 'package:the_movies_db/app/models/movie_model.dart';
import 'package:the_movies_db/app/services/movies_service.dart';

class MoviesServiceImplements implements MovieService {
  @override
  Future getMoviesByType({required int page, required Uri url}) async {
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
          'statusCode': response.statusCode,
        });
      }
    } catch (e) {
      return Future.value({
        'movies': [],
        'statusCode': response.statusCode,
      });
    }
  }

  @override
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
          'statusCode': response.statusCode,
        });
      }
    } catch (e) {
      return Future.value({
        'movies': [],
        'statusCode': response.statusCode,
      });
    }
  }
}
