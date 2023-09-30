import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ticket_booking/model/cinema_shows/cinema_shows.dart';
import 'package:ticket_booking/services/fetch_movies.dart';

class FetchShows {
  Future<List<CinemaShows>> fetchShowsByIdAndDate(
      String id, String date) async {
    List<CinemaShows> output = [];
    try {
      Response response = await Dio()
          .get("http://localhost:8080/getShow/?movieId=$id&date=$date");

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        output = data.map((e) => CinemaShows.fromJson(e)).toList();
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
