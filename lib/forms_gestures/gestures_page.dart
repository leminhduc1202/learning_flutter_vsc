import 'dart:ffi';

import 'package:flutter/material.dart';

class GesturesPage extends StatelessWidget {
  const GesturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestures in Flutter'),
        backgroundColor: Colors.green,
      ),
      body: const Center(child: MyButton()),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      onTap: () {
        actionGestures(context, "onTap");
      },
      onDoubleTap: (){
        actionGestures(context, "onDoubleTap");
      },
      onLongPress: (){
        actionGestures(context, "onLongPress");
      },
      // The tap button
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text('Tap Button'),
      ),
    );
  }
}


void actionGestures(BuildContext context, String action) {
  SnackBar snackBar = SnackBar(content: Text(" You just $action on the View"));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
