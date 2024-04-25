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
        title: Text('Detail Movies'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          elevation: 2.0,
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      '${movie.title}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: height / 1.5,
                    child: Image.network(path),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, bottom: 8),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Vote Average: ${movie.voteAverage}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, bottom: 8),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Overview: ${movie.overview}',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: Icon(Icons.movie)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
            IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
