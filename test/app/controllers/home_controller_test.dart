import 'package:flutter_test/flutter_test.dart';
import 'package:the_movies_db/app/controllers/home_controller.dart';
import 'package:the_movies_db/app/core/enums/enums.dart';

void main() {
  HomeController homeController = HomeController();
  setUp(() {
    homeController = HomeController();
  });

  group("Home controller | ", () {
    test('should return a non-empty list', () async {
      final movies = await homeController.getMoviesByType(
        page: 1,
        moviesType: MoviesType.popular,
      );
      homeController.setMoviesPrimary(movies);
      expect(homeController.moviesListPrimary.isNotEmpty, true);
    });

    test("Should return a list of movies with starting with 'club'", () async {
      final movies = await homeController.searchMovies(page: 1, query: "club");
      expect(movies.every((element) {
        return element.title!.toLowerCase().contains("club");
      }), true);
    });
  });
}
