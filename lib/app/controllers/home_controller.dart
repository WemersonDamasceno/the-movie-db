import 'package:mobx/mobx.dart';
import 'package:the_movies_db/app/models/movie_model.dart';
import 'package:the_movies_db/app/services/movies_service.dart';
import 'package:the_movies_db/app/utils/enums.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final movieService = MoviesService();
  @observable
  List<MovieModel> moviesList = [];
  @observable
  List<MovieModel> searchMovieList = [];

  @action
  getMoviesByType({required int page, required MoviesType moviesType}) async {
    moviesList = await movieService.getMoviesByType(
      page: page,
      moviesType: moviesType,
    );
    return moviesList;
  }

  @action
  Future searchMovies({required String query, required int page}) async {
    searchMovieList = await movieService.searchMovies(
      query: query,
      page: page,
    );
    return searchMovieList;
  }
}
