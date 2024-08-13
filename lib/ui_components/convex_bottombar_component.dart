import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class ConvexBottomBarComponent extends StatefulWidget {
  const ConvexBottomBarComponent({super.key});

  @override
  State<ConvexBottomBarComponent> createState() =>
      _ConvexBottomBarComponentState();
}

class _ConvexBottomBarComponentState extends State<ConvexBottomBarComponent> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convex BottomBar'),
        backgroundColor: Colors.green,
      ),
      body: const Center(),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        backgroundColor: Colors.green,
        items: const [
          TabItem(icon: Icons.play_arrow),
          TabItem(icon: Icons.museum),
          TabItem(icon: Icons.book),
        ],
        initialActiveIndex: 1 /*optional*/,
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}
