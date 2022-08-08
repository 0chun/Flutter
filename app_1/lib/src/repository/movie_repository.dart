import 'dart:convert';

import 'package:app_1/src/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<List<Movie>> loadMovies() async {
    List<Movie> returnlist = <Movie>[];
    var queryParameters = {'api_key': '93a2f683e1d611b0f008a2e09cef8c2a'};
    var uri =
        Uri.https('api.themoviedb.org', '/3/movie/popular', queryParameters);
    var response = await http.get(uri);

    //if (response.statusCode == 200) {
    Map<String, dynamic> body = json.decode(response.body);
    //if (body['results'] != null) {
    List<dynamic> list = body['results'];
    return list.map<Movie>((item) => Movie.fromJson(item)).toList();
    // }
    // }
    //return returnlist;
  }
}
