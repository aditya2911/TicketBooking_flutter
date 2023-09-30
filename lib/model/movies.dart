import 'package:json_annotation/json_annotation.dart';

part 'movies.g.dart';

@JsonSerializable()
class Movies {
  final int id;

  final String title;
  final String releaseDate;
  final String genre;
  final String youtubeLink;
  final String imageLink;
  Movies(this.id, this.title, this.releaseDate, this.genre, this.youtubeLink,
      this.imageLink);
  get getId => id;

  String get getTitle {
    return title;
  }

  String get getReleaseDate {
    return releaseDate;
  }

  String get getGenre {
    return genre;
  }

  String get getYoutubeLink {
    return youtubeLink;
  }

  String get getImageLink {
    return imageLink;
  }

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}
