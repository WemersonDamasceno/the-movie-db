// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$moviesListAtom =
      Atom(name: '_HomeControllerBase.moviesList', context: context);

  @override
  List<MovieModel> get moviesList {
    _$moviesListAtom.reportRead();
    return super.moviesList;
  }

  @override
  set moviesList(List<MovieModel> value) {
    _$moviesListAtom.reportWrite(value, super.moviesList, () {
      super.moviesList = value;
    });
  }

  late final _$searchMovieListAtom =
      Atom(name: '_HomeControllerBase.searchMovieList', context: context);

  @override
  List<MovieModel> get searchMovieList {
    _$searchMovieListAtom.reportRead();
    return super.searchMovieList;
  }

  @override
  set searchMovieList(List<MovieModel> value) {
    _$searchMovieListAtom.reportWrite(value, super.searchMovieList, () {
      super.searchMovieList = value;
    });
  }

  late final _$getMoviesByTypeAsyncAction =
      AsyncAction('_HomeControllerBase.getMoviesByType', context: context);

  @override
  Future getMoviesByType({required int page, required MoviesType moviesType}) {
    return _$getMoviesByTypeAsyncAction
        .run(() => super.getMoviesByType(page: page, moviesType: moviesType));
  }

  late final _$searchMoviesAsyncAction =
      AsyncAction('_HomeControllerBase.searchMovies', context: context);

  @override
  Future<dynamic> searchMovies({required String query, required int page}) {
    return _$searchMoviesAsyncAction
        .run(() => super.searchMovies(query: query, page: page));
  }

  @override
  String toString() {
    return '''
moviesList: ${moviesList},
searchMovieList: ${searchMovieList}
    ''';
  }
}
