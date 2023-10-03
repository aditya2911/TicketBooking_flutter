import 'dart:convert';

import 'package:collection/collection.dart';

class ObjSeat {
  int? seatNumber;
  String? seatStatus;
  int? gridSeatNum;
  get getSeatNumber => seatNumber;

  set setSeatNumber(seatNumber) => this.seatNumber = seatNumber;

  get getSeatStatus => seatStatus;

  set setSeatStatus(seatStatus) => this.seatStatus = seatStatus;

  get getGridSeatNum => gridSeatNum;

  set setGridSeatNum(gridSeatNum) => this.gridSeatNum = gridSeatNum;

  ObjSeat({this.seatNumber, this.seatStatus, this.gridSeatNum});

  @override
  String toString() {
    return 'ObjSeat(seatNumber: $seatNumber, seatStatus: $seatStatus, gridSeatNum: $gridSeatNum)';
  }

  factory ObjSeat.fromMap(Map<String, dynamic> data) => ObjSeat(
        seatNumber: data['seatNumber'] as int?,
        seatStatus: data['seatStatus'] as String?,
        gridSeatNum: data['gridSeatNum'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'seatNumber': seatNumber,
        'seatStatus': seatStatus,
        'gridSeatNum': gridSeatNum,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ObjSeat].
  factory ObjSeat.fromJson(String data) {
    return ObjSeat.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ObjSeat] to a JSON string.
  String toJson() => json.encode(toMap());

  ObjSeat copyWith({
    int? seatNumber,
    String? seatStatus,
    int? gridSeatNum,
  }) {
    return ObjSeat(
      seatNumber: seatNumber ?? this.seatNumber,
      seatStatus: seatStatus ?? this.seatStatus,
      gridSeatNum: gridSeatNum ?? this.gridSeatNum,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ObjSeat) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      seatNumber.hashCode ^ seatStatus.hashCode ^ gridSeatNum.hashCode;
}
