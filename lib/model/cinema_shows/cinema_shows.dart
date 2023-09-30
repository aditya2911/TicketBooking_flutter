import 'package:collection/collection.dart';

import 'show.dart';

class CinemaShows {
  int? cinemaId;
  String? name;
  List<Show>? shows;
  get getCinemaId => cinemaId;

  set setCinemaId(cinemaId) => this.cinemaId = cinemaId;

  get getName => name;

  set setName(name) => this.name = name;

  get getShows => shows;

  set setShows(shows) => this.shows = shows;

  CinemaShows({this.cinemaId, this.name, this.shows});

  @override
  String toString() {
    return 'CinemaShows(cinemaId: $cinemaId, name: $name, shows: $shows)';
  }

  factory CinemaShows.fromJson(Map<String, dynamic> json) => CinemaShows(
        cinemaId: json['cinemaID'] as int?,
        name: json['name'] as String?,
        shows: (json['shows'] as List<dynamic>?)
            ?.map((e) => Show.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'cinemaID': cinemaId,
        'name': name,
        'shows': shows?.map((e) => e.toJson()).toList(),
      };

  CinemaShows copyWith({
    int? cinemaId,
    String? name,
    List<Show>? shows,
  }) {
    return CinemaShows(
      cinemaId: cinemaId ?? this.cinemaId,
      name: name ?? this.name,
      shows: shows ?? this.shows,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CinemaShows) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => cinemaId.hashCode ^ name.hashCode ^ shows.hashCode;
}
