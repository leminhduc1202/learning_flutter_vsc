import 'package:flutter/material.dart';

class ProgressIndicatorsComponent extends StatelessWidget {
  const ProgressIndicatorsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoadingProgress(),
    );
  }
}

class LoadingProgress extends StatelessWidget {
  const LoadingProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 150.0,
            ),
            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
