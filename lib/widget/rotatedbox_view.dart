import 'package:flutter/material.dart';

class RotatedBoxView extends StatelessWidget {
// This widget is
//the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipOval',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePAGE(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Class 2
// Extending StatelessWidget class
class MyHomePAGE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Flutter'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
          child: RotatedBox(
        quarterTurns: 3,
        child: Text('Hello RotatedBox!'),
      )),
      backgroundColor: Colors.lightBlue[50],
    );
  }
}
