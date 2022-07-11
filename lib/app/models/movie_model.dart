import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  @JsonKey(name: 'vote_average')
  double? voteAverage;

  bool? isFavorite;

  MovieModel({
    this.title,
    this.posterPath,
    this.overview,
    this.releaseDate,
    this.voteAverage,
    this.id,
    this.isFavorite = false,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
