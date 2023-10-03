import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class BookSeat {
  final String _basePath = "http://localhost:8080/book-seat/";
  final Dio _dio = Dio();

  Future<void> bookSeatByID(
      {required int rowI,
      required int colI,
      required int areaI,
      required int showI}) async {
    debugPrint("rowI:$rowI  , colI:$colI  , areaCodeI:$areaI , showI:$showI ");
    try {
      Response response = await _dio.post(_basePath, data: {
        "area_id": areaI,
        "row_id": rowI,
        "seat_id": colI,
        "showId": showI,
        "user_id": 1
      });

      if (response.statusCode == 200) {
        debugPrint("Success");
      }
    } catch (e) {
      debugPrint("Error Occured in Auth $e");
    }
  }
}
