import 'package:mobx/mobx.dart';
import 'package:the_movies_db/app/models/movie_model.dart';
import 'package:the_movies_db/app/services/movies_service.dart';
import 'package:the_movies_db/app/utils/constants.dart';
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
    Uri url;
    switch (moviesType) {
      case MoviesType.popular:
        url = Uri.parse('${Constants.moviesPopularURL}&page=$page');
        break;
      case MoviesType.topRated:
        url = Uri.parse('${Constants.topRated}&page=$page');
        break;
      case MoviesType.upcoming:
        url = Uri.parse('${Constants.upcomingMoviesURL}&page=$page');
        break;
      case MoviesType.nowPlaying:
        url = Uri.parse('${Constants.nowPlaying}&page=$page');
        break;
      default:
        url = Uri.parse('${Constants.upcomingMoviesURL}&page=$page');
    }
    final response = await movieService.getMoviesByType(
      page: page,
      url: url,
    );
    moviesList = response['movies'];
    return moviesList;
  }

  @action
  Future searchMovies({required String query, required int page}) async {
    final response = await movieService.searchMovies(
      query: query,
      page: page,
    );
    searchMovieList = response['movies'];
    return searchMovieList;
  }
}
