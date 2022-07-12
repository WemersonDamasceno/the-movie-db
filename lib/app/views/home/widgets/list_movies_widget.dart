import 'package:flutter/material.dart';
import 'package:the_movies_db/app/controllers/home_controller.dart';
import 'package:the_movies_db/app/models/movie_model.dart';
import 'package:the_movies_db/app/views/home/home_page_mixin.dart';
import 'package:the_movies_db/app/views/home/widgets/item_movie_widget.dart';

class ListMoviesWidget extends StatelessWidget with HomePageMixin {
  final HomeController homeController;
  final List<MovieModel> moviesList;
  final Axis scrollDirection;
  const ListMoviesWidget({
    Key? key,
    required this.homeController,
    required this.scrollDirection,
    required this.moviesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: moviesList.length,
          scrollDirection: scrollDirection,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            final movie = moviesList[index];
            return ItemMovieWidget(
              title: formatterTitle(movie.title ?? ""),
              imageURL: movie.posterPath ?? "",
              voteAverage: formatterVoteAverage(movie.voteAverage ?? 0),
              date: movie.releaseDate ?? "2022-06-29",
            );
          }),
    );
  }
}
