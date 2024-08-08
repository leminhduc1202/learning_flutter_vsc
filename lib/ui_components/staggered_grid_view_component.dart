// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridViewUI extends StatelessWidget {
  const StaggeredGridViewUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Staggered Grid View',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // darkTheme: ThemeData.dark(),
      home: const StaggeredGridHomePage(),
    );
  }
}

class StaggeredGridHomePage extends StatelessWidget {
  const StaggeredGridHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Staggered Grid View"),
      ),
      body: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
        children: _listTile,
      ),
    );
  }
}

class BackGroundTile extends StatelessWidget {
  final Color backgroundColor;
  final IconData icondata;

  const BackGroundTile(
      {super.key, required this.backgroundColor, required this.icondata});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Icon(icondata, color: Colors.white),
    );
  }
}

List<Widget> _listTile = <Widget>[
  const BackGroundTile(backgroundColor: Colors.red, icondata: Icons.home),
  const BackGroundTile(backgroundColor: Colors.orange, icondata: Icons.ac_unit),
  const BackGroundTile(backgroundColor: Colors.pink, icondata: Icons.landscape),
  const BackGroundTile(backgroundColor: Colors.green, icondata: Icons.portrait),
  const BackGroundTile(
      backgroundColor: Colors.deepPurpleAccent, icondata: Icons.music_note),
  const BackGroundTile(
      backgroundColor: Colors.blue, icondata: Icons.access_alarms),
  const BackGroundTile(
      backgroundColor: Colors.indigo, icondata: Icons.satellite_outlined),
  const BackGroundTile(
      backgroundColor: Colors.cyan, icondata: Icons.search_sharp),
  const BackGroundTile(
      backgroundColor: Colors.yellowAccent, icondata: Icons.adjust_rounded),
  const BackGroundTile(
      backgroundColor: Colors.deepOrange, icondata: Icons.attach_money),
];

List<Widget> _demoList = <Widget>[
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: Text("0"),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: Text("2"),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: Text("3"),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: Text("4"),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: Text("5"),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: Text("6"),
  ),
  const StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: Text("7"),
  ),
];
