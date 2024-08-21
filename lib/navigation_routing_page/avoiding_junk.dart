import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AvoidingJunk extends StatelessWidget {
  static const routeNameLoadData = "/loadData";
  const AvoidingJunk({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      initialRoute: '/',
      routes: {
        "/": (context) => const UpdateAlbum(),
        "/list": (context) => const HomePage(title: appTitle),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<PhotoData>>(
        future: getPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? PhotosList(photos: snapshot.requireData)
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<PhotoData> photos;

  const PhotosList({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return itemPhoto(
          photos[index].photoThumbnailUrl,
          photos[index].photoTitle,
        );
      },
    );
  }
}

Widget itemPhoto(String photoUrl, String photoTitle) {
  return Center(
    child: Column(
      children: [
        Image.network(photoUrl),
        Text(
          photoTitle,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

String url = "https://jsonplaceholder.typicode.com/photos";

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Album> updateAlbum(String title) async {
  final http.Response response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );
  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update album.');
  }
}

class UpdateAlbum extends StatefulWidget {
  const UpdateAlbum({super.key});

  @override
  UpdateAlbumState createState() {
    return UpdateAlbumState();
  }
}

class UpdateAlbumState extends State<UpdateAlbum> {
  final TextEditingController _controller = TextEditingController();
  late Future<Album> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Update Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Load Data'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: const Text('List Album'),
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<Album>(
                future: _futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(snapshot.data!.title),
                          TextField(
                            controller: _controller,
                            decoration:
                                const InputDecoration(hintText: 'Enter Title'),
                          ),
                          ElevatedButton(
                            child: const Text('Update Data'),
                            onPressed: () {
                              setState(() {
                                _futureAlbum = updateAlbum(_controller.text);
                              });
                            },
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

Future<List<Album>> getAlbums(http.Client client) async {
  final response = await client
      .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/"));
  return compute(albumsParser, response.body);
}

List<Album> albumsParser(String responseBody) {
  final parser = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parser.map<Album>((json) => Album.fromJson(json)).toList();
}

Future<List<PhotoData>> getPhotos(http.Client client) async {
  final response = await client.get(Uri.parse(url));
  return compute(photosParser, response.body);
}

List<PhotoData> photosParser(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<PhotoData>((json) => PhotoData.fromJson(json)).toList();
}

class PhotoData {
  final int photoAlbumId;
  final int photoId;
  final String photoTitle;
  final String photoUrl;
  final String photoThumbnailUrl;

  PhotoData(
      {required this.photoAlbumId,
      required this.photoId,
      required this.photoTitle,
      required this.photoUrl,
      required this.photoThumbnailUrl});

  factory PhotoData.fromJson(Map<String, dynamic> json) {
    return PhotoData(
      photoAlbumId: json['albumId'] as int,
      photoId: json['id'] as int,
      photoTitle: json['title'] as String,
      photoUrl: json['url'] as String,
      photoThumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
