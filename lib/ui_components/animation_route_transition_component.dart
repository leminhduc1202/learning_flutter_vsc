import 'package:flutter/material.dart';

class HomeAnimationRoutePage extends StatelessWidget {
  const HomeAnimationRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimationRouteTransitionHomePage(),
    );
  }
}

class AnimationRouteTransitionHomePage extends StatelessWidget {
  const AnimationRouteTransitionHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimationRouteTransitionComponent"),
        backgroundColor: Colors.black38,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(_createRoute());
            },
            child: const Text("Next Page")),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}
