import 'dart:convert';

import 'package:collection/collection.dart';

import 'obj_row.dart';

class ObjAreaTest {
  List<ObjRow>? objRow;
  bool? hasCurrentOrder;
  String? areaDesc;
  String? areaCode;
  int? areaNum;

  List<ObjRow>? get getObjRow => objRow;

  set setObjRow(List<ObjRow>? objRow) => this.objRow = objRow;

  get getHasCurrentOrder => hasCurrentOrder;

  set setHasCurrentOrder(hasCurrentOrder) =>
      this.hasCurrentOrder = hasCurrentOrder;

  get getAreaDesc => areaDesc;

  set setAreaDesc(areaDesc) => this.areaDesc = areaDesc;

  get getAreaCode => areaCode;

  set setAreaCode(areaCode) => this.areaCode = areaCode;

  get getAreaNum => areaNum;

  set setAreaNum(areaNum) => this.areaNum = areaNum;
  ObjAreaTest({
    this.objRow,
    this.hasCurrentOrder,
    this.areaDesc,
    this.areaCode,
    this.areaNum,
  });

  @override
  String toString() {
    return 'ObjAreaTest(objRow: $objRow, hasCurrentOrder: $hasCurrentOrder, areaDesc: $areaDesc, areaCode: $areaCode, areaNum: $areaNum)';
  }

  factory ObjAreaTest.fromMap(Map<String, dynamic> data) => ObjAreaTest(
        objRow: (data['objRow'] as List<dynamic>?)
            ?.map((e) => ObjRow.fromMap(e as Map<String, dynamic>))
            .toList(),
        hasCurrentOrder: data['hasCurrentOrder'] as bool?,
        areaDesc: data['areaDesc'] as String?,
        areaCode: data['areaCode'] as String?,
        areaNum: data['areaNum'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'objRow': objRow?.map((e) => e.toMap()).toList(),
        'hasCurrentOrder': hasCurrentOrder,
        'areaDesc': areaDesc,
        'areaCode': areaCode,
        'areaNum': areaNum,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ObjAreaTest].
  factory ObjAreaTest.fromJson(String data) {
    return ObjAreaTest.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ObjAreaTest] to a JSON string.
  String toJson() => json.encode(toMap());

  ObjAreaTest copyWith({
    List<ObjRow>? objRow,
    bool? hasCurrentOrder,
    String? areaDesc,
    String? areaCode,
    int? areaNum,
  }) {
    return ObjAreaTest(
      objRow: objRow ?? this.objRow,
      hasCurrentOrder: hasCurrentOrder ?? this.hasCurrentOrder,
      areaDesc: areaDesc ?? this.areaDesc,
      areaCode: areaCode ?? this.areaCode,
      areaNum: areaNum ?? this.areaNum,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ObjAreaTest) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      objRow.hashCode ^
      hasCurrentOrder.hashCode ^
      areaDesc.hashCode ^
      areaCode.hashCode ^
      areaNum.hashCode;
}
