import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:the_movies_db/app/controllers/home_controller.dart';
import 'package:the_movies_db/app/utils/enums.dart';
import 'package:the_movies_db/app/views/home/widgets/list_movies_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  void initState() {
    loadMoviesByType();
    super.initState();
  }

  loadMoviesByType() async {
    final primaryList = await homeController.getMoviesByType(
      page: 1,
      moviesType: MoviesType.popular,
    );
    final secondaryList = await homeController.getMoviesByType(
      page: 1,
      moviesType: MoviesType.trending,
    );

    homeController.setMoviesPrimary(primaryList);
    homeController.setMoviesSecondary(secondaryList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Image.asset(
              'assets/images/tmdb_logo.JPEG',
              height: 80,
            ),
            centerTitle: true,
            floating: true,
          )
        ],
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Observer(builder: (_) {
                return homeController.moviesListPrimary.isNotEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Os Mais Populares',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ListMoviesWidget(
                            homeController: homeController,
                            scrollDirection: Axis.horizontal,
                            moviesList: homeController.moviesListPrimary,
                          ),
                          const Text(
                            'Em Tendencia',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ListMoviesWidget(
                            homeController: homeController,
                            scrollDirection: Axis.horizontal,
                            moviesList: homeController.moviesListSecondary,
                          ),
                        ],
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
