import 'package:flutter/material.dart';

class AlertDialogBox extends StatelessWidget {
  const AlertDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AlertDialogBoxView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AlertDialogBoxView extends StatefulWidget {
  const AlertDialogBoxView({super.key});

  @override
  State<AlertDialogBoxView> createState() => _AlertDialogBoxState();
}

class _AlertDialogBoxState extends State<AlertDialogBoxView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
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
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => SimpleDialog(
                  title: const Text('Select you option'),
                  children: <Widget>[
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Go to work'),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Keep sleeping'),
                    ),
                  ],
                ),
              );
            },
            child: const Text("Show Simple Dialog box"),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Expanded(
                    child: AlertDialog(
                      title: const Text('Welcome'),
                      content: const Text('Learning Flutter'),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(
                                color: Colors.deepOrange), // Màu chữ
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('CANCEL'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(
                                color: Colors.deepOrange), // Màu chữ
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('ACCEPT'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Text("Show Custom Dialog box"),
          ),
        ],
      )),
    );
  }
}
