import 'dart:convert';

import 'package:collection/collection.dart';

import 'obj_seat.dart';

class ObjRow {
  List<ObjSeat>? objSeat;
  int? gridRowId;
  String? phyRowId;

  get getObjSeat => objSeat;

  set setObjSeat(objSeat) => this.objSeat = objSeat;

  get getGridRowId => gridRowId;

  set setGridRowId(gridRowId) => this.gridRowId = gridRowId;

  get getPhyRowId => phyRowId;

  set setPhyRowId(phyRowId) => this.phyRowId = phyRowId;
  ObjRow({this.objSeat, this.gridRowId, this.phyRowId});

  @override
  String toString() {
    return 'ObjRow(objSeat: $objSeat, gridRowId: $gridRowId, phyRowId: $phyRowId)';
  }

  factory ObjRow.fromMap(Map<String, dynamic> data) => ObjRow(
        objSeat: (data['objSeat'] as List<dynamic>?)
            ?.map((e) => ObjSeat.fromMap(e as Map<String, dynamic>))
            .toList(),
        gridRowId: data['gridRowId'] as int?,
        phyRowId: data['phyRowId'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'objSeat': objSeat?.map((e) => e.toMap()).toList(),
        'gridRowId': gridRowId,
        'phyRowId': phyRowId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ObjRow].
  factory ObjRow.fromJson(String data) {
    return ObjRow.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ObjRow] to a JSON string.
  String toJson() => json.encode(toMap());

  ObjRow copyWith({
    List<ObjSeat>? objSeat,
    int? gridRowId,
    String? phyRowId,
  }) {
    return ObjRow(
      objSeat: objSeat ?? this.objSeat,
      gridRowId: gridRowId ?? this.gridRowId,
      phyRowId: phyRowId ?? this.phyRowId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ObjRow) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => objSeat.hashCode ^ gridRowId.hashCode ^ phyRowId.hashCode;
}
