import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MyRiveAnimation extends StatelessWidget {
  const MyRiveAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RiveAnimation.asset(
          'assets/vehicles.riv',
          fit: BoxFit.cover,
        ),
        // RiveAnimation.network(
        //   'https://cdn.rive.app/animations/vehicles.riv',
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}
