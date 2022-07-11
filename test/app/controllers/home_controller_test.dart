import 'package:flutter_test/flutter_test.dart';
import 'package:the_movies_db/app/controllers/home_controller.dart';
import 'package:the_movies_db/app/utils/enums.dart';

void main() {
  HomeController homeController = HomeController();
  setUp(() {
    homeController = HomeController();
  });

  group("Home controller | ", () {
    test('should return a non-empty list', () async {
      await homeController.getMoviesByType(
        page: 1,
        moviesType: MoviesType.popular,
      );
      expect(homeController.moviesList.isNotEmpty, true);
    });
  });
}
