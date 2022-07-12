import 'package:flutter/material.dart';
import 'package:the_movies_db/app/controllers/home_controller.dart';
import 'package:the_movies_db/app/utils/custom_colors.dart';
import 'package:the_movies_db/app/utils/date_formatter.dart';
import 'package:the_movies_db/app/utils/enums.dart';
import 'package:the_movies_db/app/views/home/home_page_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageMixin {
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
      moviesType: MoviesType.upcoming,
    );

    homeController.setMoviesPrimary(primaryList);
    homeController.setMoviesSecondary(secondaryList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/tmdb_logo.JPEG',
          height: 80,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Os mais populares',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250,
                      width: 150,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w500/kAVRgw7GgK1CfYEJq8ME6EvRIgU.jpg",
                                fit: BoxFit.cover,
                                width: 150,
                                height: 225,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 15,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: CustomColors.tmdbDarkBlue,
                                border: Border.all(
                                  color: CustomColors.tmdbLighterGreen,
                                  width: 4,
                                ),
                              ),
                              child: Center(
                                  child: RichText(
                                text: TextSpan(children: [
                                  const TextSpan(
                                    text: '98',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(2, -7),
                                      child: const Text(
                                        '%',
                                        textScaleFactor: 0.5,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                              )),
                            ),
                          ),
                          Positioned(
                              right: 10,
                              top: 10,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                child: const Icon(
                                  Icons.keyboard_control_sharp,
                                  size: 30,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Text(
                      formatterMovieTitle("Jurassic World: Fallen Kingdom"),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      DateFormatter.formatDate("2022-07-06"),
                      style: const TextStyle(
                        color: CustomColors.tmdbGreyText,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Os mais populares',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
