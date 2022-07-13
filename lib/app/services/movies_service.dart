abstract class MovieService {
  getMoviesByType({required int page, required Uri url});
  Future searchMovies({required String query, required int page});
}
