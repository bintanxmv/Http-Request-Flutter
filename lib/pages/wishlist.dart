import 'package:flutter/material.dart';
import 'package:http_request_xir3/models/movie.dart';
import 'package:http_request_xir3/pages/movie_list.dart';
import 'package:http_request_xir3/pages/profile.dart';

import '../service/http_service.dart';

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  late Future<List<Movie>?> _wishlistMovies;

  @override
  void initState() {
    super.initState();
    _wishlistMovies = HttpService().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist Movie'),
         backgroundColor: Colors.blue,
        foregroundColor: Colors.white,

      ),
      body: FutureBuilder<List<Movie>?>(
        future: _wishlistMovies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching wishlist movies'),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].overview),
                  leading: Image.network(snapshot.data![index].posterPath,
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('No wishlist movies found'),
            );
          }
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
