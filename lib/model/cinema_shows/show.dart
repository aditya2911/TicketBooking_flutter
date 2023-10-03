import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class Show {
  final int? cinemaHallId;
  final String? collectionId;
  final int? screenHall;
  String? startTime;
  final int? showID;
  get getShowID => showID;

  final String? date;

  Show(
      {this.cinemaHallId,
      this.collectionId,
      this.screenHall,
      this.startTime,
      this.date,
      this.showID}) {
    formatStartTime(getStartTime);
  }

  @override
  String toString() {
    return 'Show(cinemaHallId: $cinemaHallId, collectionId: $collectionId, screenHall: $screenHall, startTime: $startTime, date: $date ,showID: $showID)';
  }

  get getStartTime => startTime;

  set setStartTime(String startTime) => this.startTime = startTime;
  void formatStartTime(String time) {
    String formattedTime =
        DateFormat.jm().format(DateFormat('hh:mm').parse(time));
    startTime = formattedTime;
  }

  factory Show.fromJson(Map<String, dynamic> json) => Show(
      cinemaHallId: json['cinemaHallID'] as int?,
      collectionId: json['collectionID'] as String?,
      screenHall: json['screenHall'] as int?,
      startTime: json['startTime'] as String?,
      date: json['date'] as String?,
      showID: json['showID'] as int?);

  Map<String, dynamic> toJson() => {
        'cinemaHallID': cinemaHallId,
        'collectionID': collectionId,
        'screenHall': screenHall,
        'startTime': startTime,
        'date': date,
        'showID': showID
      };

  Show copyWith(
      {int? cinemaHallId,
      String? collectionId,
      int? screenHall,
      String? startTime,
      String? date,
      int? showID}) {
    return Show(
        cinemaHallId: cinemaHallId ?? this.cinemaHallId,
        collectionId: collectionId ?? this.collectionId,
        screenHall: screenHall ?? this.screenHall,
        startTime: startTime ?? this.startTime,
        date: date ?? this.date,
        showID: showID ?? this.showID);
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Show) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      cinemaHallId.hashCode ^
      collectionId.hashCode ^
      screenHall.hashCode ^
      startTime.hashCode ^
      date.hashCode ^
      showID.hashCode;
}
