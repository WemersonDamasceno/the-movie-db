// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$moviesListPrimaryAtom =
      Atom(name: '_HomeControllerBase.moviesListPrimary', context: context);

  @override
  List<MovieModel> get moviesListPrimary {
    _$moviesListPrimaryAtom.reportRead();
    return super.moviesListPrimary;
  }

  @override
  set moviesListPrimary(List<MovieModel> value) {
    _$moviesListPrimaryAtom.reportWrite(value, super.moviesListPrimary, () {
      super.moviesListPrimary = value;
    });
  }

  late final _$moviesListSecondaryAtom =
      Atom(name: '_HomeControllerBase.moviesListSecondary', context: context);

  @override
  List<MovieModel> get moviesListSecondary {
    _$moviesListSecondaryAtom.reportRead();
    return super.moviesListSecondary;
  }

  @override
  set moviesListSecondary(List<MovieModel> value) {
    _$moviesListSecondaryAtom.reportWrite(value, super.moviesListSecondary, () {
      super.moviesListSecondary = value;
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

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  dynamic setMoviesPrimary(List<MovieModel> moviesList) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setMoviesPrimary');
    try {
      return super.setMoviesPrimary(moviesList);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMoviesSecondary(List<MovieModel> moviesList) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setMoviesSecondary');
    try {
      return super.setMoviesSecondary(moviesList);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
moviesListPrimary: ${moviesListPrimary},
moviesListSecondary: ${moviesListSecondary},
searchMovieList: ${searchMovieList}
    ''';
  }
}
