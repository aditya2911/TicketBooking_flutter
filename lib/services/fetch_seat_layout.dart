import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking/services/fetch_movies.dart';

import '../model/seat_layout/seat_layout.dart';

class FetchSeatLayout {
  Future<SeatLayout> fetchSeatLayoutByID(String id, String collectionID) async {
    SeatLayout output;
    // debugPrint("id is $id");
    debugPrint("id is $collectionID");
    try {
      debugPrint(
          "http://localhost:8080/get-seat-id?seatID=$collectionID&id=$id");
      Response response = await Dio()
          .get("http://localhost:8080/get-seat-id?seatID=$collectionID&id=$id");
      if (response.statusCode == 200) {
        dynamic data1 = response.data;

        output = SeatLayout.fromMap(data1);
        // debugPrint(output.toString());
        return output;
      } else {
        throw FetchDataException(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      throw FetchDataException(e.toString());
    }
  }
}
