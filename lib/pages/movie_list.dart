import 'package:flutter/material.dart';
import 'package:http_request_xir3/models/movie.dart';
import 'package:http_request_xir3/pages/movie_detail.dart';
import 'package:http_request_xir3/service/http_service.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount = 0;
  List<Movie> movies = [];
  HttpService service = HttpService();

  @override
  void initState() {
    super.initState();
    service = HttpService();
    initialize();
  }

  Future<void> initialize() async {
    movies = await service.getPopularMovies() as List<Movie>;
    setState(() {
      moviesCount = movies.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Movies"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: moviesCount,
        itemBuilder: (context, position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: Image(
                  image: NetworkImage(movies[position].posterPath ??
                      "https://m.media-amazon.com/images/M/MV5BNjQwZDIyNjAtZGQxMC00OTUwLWFiOWYtNzg2NDc5Mjc1MDQ5XkEyXkFqcGdeQXVyMTAxNzQ1NzI@._V1_.jpg")),
              title: Text(movies[position].title),
              subtitle:
                  Text('Rating: ${movies[position].voteAverage.toString()}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MovieDetail(movies[position]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
