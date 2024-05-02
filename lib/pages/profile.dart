import 'package:flutter/material.dart';
import 'package:http_request_xir3/pages/movie_list.dart';
import 'package:http_request_xir3/pages/wishlist.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _UserInfo(),
            SizedBox(height: 20),
            ..._Buttons(),
          ],
        ),
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

class _UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/furina.jpg'),
          ),
          SizedBox(
            height: 10,
          ),
          _UserInfoItem('Nama: Furina De Fontaine'),
          _UserInfoItem('Email: furinadefontaine@gmail.com'),
          _UserInfoItem('No Telp: 1234567890'),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _UserInfoItem extends StatelessWidget {
  final String text;

  _UserInfoItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

List<Widget> _Buttons() {
  return [
    _Button('Payment'),
    SizedBox(height: 10),
    _Button('History'),
    SizedBox(height: 10),
    _Button('Settings'),
    SizedBox(height: 10),
    _Button('About App'),
  ];
}

class _Button extends StatelessWidget {
  final String text;

  _Button(this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to corresponding page
      },
      child: Text(text),
    );
  }
}
