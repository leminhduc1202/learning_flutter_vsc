import 'package:flutter/material.dart';

class UiOrientationComponent extends StatelessWidget {
  const UiOrientationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "UI Orientation View",
      home: OrientationView(),
    );
  }
}

class OrientationView extends StatelessWidget {
  const OrientationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Orientation"),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 4 : 5,
          children: List.generate(52, (index) {
            return Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Index $index",
                  style: const TextStyle(
                    fontFamily: "GreyQo",
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
