import 'package:flutter/material.dart';
import 'package:http_request_xir3/models/movie.dart';
import 'package:http_request_xir3/pages/movie_detail.dart';
import 'package:http_request_xir3/pages/profile.dart';
import 'package:http_request_xir3/pages/wishlist.dart';
import 'package:http_request_xir3/service/http_service.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount = 0;
  List? movies;
  HttpService? service = HttpService();

  @override
  void initState() {
    super.initState();
    service = HttpService();
    initialize();
  }

  Future<void> initialize() async {
    movies = [];
    movies = await service!.getPopularMovies() as List<Movie>;
    setState(() {
      moviesCount = movies!.length;
      movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sotel Movies"),
        backgroundColor: Colors.blue,
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
                  image: NetworkImage(movies![position].posterPath ??
                      "https://m.media-amazon.com/images/M/MV5BNjQwZDIyNjAtZGQxMC00OTUwLWFiOWYtNzg2NDc5Mjc1MDQ5XkEyXkFqcGdeQXVyMTAxNzQ1NzI@._V1_.jpg")),
              title: Text(movies![position].title),
              subtitle:
                  Text('Rating: ${movies![position].voteAverage.toString()}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MovieDetail(movies![position]),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {
               Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieList(),
                      ));
            }, icon: Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: Icon(Icons.movie)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishlistPage()));
            }, icon: Icon(Icons.bookmark)),
            IconButton(onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
              
            }, icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
    
  }
}
