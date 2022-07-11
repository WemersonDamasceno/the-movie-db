// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      title: json['title'] as String?,
      posterPath: json['poster_path'] as String?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      id: json['id'] as int?,
      isFavorite: json['isFavorite'] as bool? ?? false,
    )..backdropPath = json['backdrop_path'] as String?;

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'isFavorite': instance.isFavorite,
    };
