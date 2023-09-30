// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
      json['id'] as int,
      json['title'] as String,
      json['releaseDate'] as String,
      json['genre'] as String,
      json['youtubeLink'] as String,
      json['imageLink'] as String,
    );

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'releaseDate': instance.releaseDate,
      'genre': instance.genre,
      'youtubeLink': instance.youtubeLink,
      'imageLink': instance.imageLink,
    };
