import 'package:flutter/material.dart';
import 'package:http_request_xir3/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  const MovieDetail(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path = movie.posterPath;

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(movie.overview),
              )
            ],
          ),
        ),
      ),
    );
  }
}