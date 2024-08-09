import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(tabs: [
                Tab(icon: Icon(Icons.music_note)),
                Tab(icon: Icon(Icons.music_video)),
                Tab(icon: Icon(Icons.camera_alt)),
                Tab(icon: Icon(Icons.grade)),
                Tab(icon: Icon(Icons.email)),
              ]),
              title: const Text("Icon component"),
              backgroundColor: Colors.amber,
            ),
            body: const TabBarView(
              children: [
                Icon(Icons.music_note, size: 100),
                Icon(Icons.music_video, color: Colors.blue, size: 100),
                Icon(Icons.camera_alt, semanticLabel: 'Camera', size: 100),
                Icon(
                  Icons.grade,
                  color: Colors.red,
                  size: 300,
                  semanticLabel: 'Star',
                ),
                Icon(
                  Icons.email,
                  size: 100,
                ),
              ],
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
