import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/movies.dart';

class FetchMovies {
  Future<List<Movies>> getMoviesByPage(String path) async {
    try {
      Response response = await Dio().get(path);

      if (response.statusCode == 200) {
        //   print(response.data['content'][0]["title"]);
        List<dynamic> data = response.data['content'];
        List<Movies> test = data.map((e) => Movies.fromJson(e)).toList();
        debugPrint("hello ${test[0].getTitle}");
        return test;
      } else {
        throw FetchDataException(
            'Failed to fetch movies: ${response.statusCode}');
      }
    } catch (e) {
      throw FetchDataException('Error during HTTP request: $e');
    }
  }
}

class FetchDataException implements Exception {
  final String message;
  FetchDataException(this.message);
}
