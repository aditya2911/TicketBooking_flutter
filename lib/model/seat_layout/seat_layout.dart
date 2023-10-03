import 'dart:convert';

import 'package:collection/collection.dart';

import 'obj_area_test.dart';

class SeatLayout {
  String? id;
  int? intMaxSeatId;
  int? intMinSeatId;
  List<ObjAreaTest>? objAreaTest;
  get getId => id;

  set setId(id) => this.id = id;

  get getIntMaxSeatId => intMaxSeatId;

  set setIntMaxSeatId(intMaxSeatId) => this.intMaxSeatId = intMaxSeatId;

  get getIntMinSeatId => intMinSeatId;

  set setIntMinSeatId(intMinSeatId) => this.intMinSeatId = intMinSeatId;

  get getObjAreaTest => objAreaTest;

  set setObjAreaTest(objAreaTest) => this.objAreaTest = objAreaTest;

  SeatLayout({
    this.id,
    this.intMaxSeatId,
    this.intMinSeatId,
    this.objAreaTest,
  });

  @override
  String toString() {
    return 'SeatLayout(id: $id, intMaxSeatId: $intMaxSeatId, intMinSeatId: $intMinSeatId, objAreaTest: $objAreaTest)';
  }

  factory SeatLayout.fromMap(Map<String, dynamic> data) => SeatLayout(
        id: data['id'] as String?,
        intMaxSeatId: data['intMaxSeatID'] as int?,
        intMinSeatId: data['intMinSeatID'] as int?,
        objAreaTest: (data['objAreaTest'] as List<dynamic>?)
            ?.map((e) => ObjAreaTest.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'intMaxSeatID': intMaxSeatId,
        'intMinSeatID': intMinSeatId,
        'objAreaTest': objAreaTest?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SeatLayout].
  factory SeatLayout.fromJson(String data) {
    return SeatLayout.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SeatLayout] to a JSON string.
  String toJson() => json.encode(toMap());

  SeatLayout copyWith({
    String? id,
    int? intMaxSeatId,
    int? intMinSeatId,
    List<ObjAreaTest>? objAreaTest,
  }) {
    return SeatLayout(
      id: id ?? this.id,
      intMaxSeatId: intMaxSeatId ?? this.intMaxSeatId,
      intMinSeatId: intMinSeatId ?? this.intMinSeatId,
      objAreaTest: objAreaTest ?? this.objAreaTest,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SeatLayout) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      intMaxSeatId.hashCode ^
      intMinSeatId.hashCode ^
      objAreaTest.hashCode;
}
