import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_request_xir3/models/movie.dart';


class HttpService {
  final String baseUrl = 'https://movie.tukanginyuk.com/api/getmovie';
 
  Future<List<Movie>?> getPopularMovies() async {
    final String uri = baseUrl;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Success");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['data'];
      List<Movie> movies =
          List<Movie>.from(moviesMap.map((i) => Movie.fromJson(i)));
      return movies;
    } else {
      print("Failed: ${result.statusCode}");
      return null;
    }
  }
}

