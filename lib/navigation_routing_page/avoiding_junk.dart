import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AvoidingJunk extends StatelessWidget {
  const AvoidingJunk({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Isolate Demo';

    return const MaterialApp(
      title: appTitle,
      home: HomePage(title: appTitle),
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
