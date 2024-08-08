import 'package:flutter/material.dart';

class AlertDialogBox extends StatelessWidget {
  const AlertDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AltertDialogBox(),
    );
  }
}

class AltertDialogBox extends StatefulWidget {
  const AltertDialogBox({super.key});

  @override
  State<AltertDialogBox> createState() => _AltertDialogBoxState();
}

class _AltertDialogBoxState extends State<AltertDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text("Alert Dialog Box"),
                content: const Text("You have raised a Alert Dialog Box"),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text("okay"),
                  ),
                ],
              ),
            );
          },
          child: const Text("Show alert Dialog box"),
        ),
      ),
    );
  }
}
