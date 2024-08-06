import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());
  // runApp(const MyAppNew());
  runApp(const ContainerView());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 255, 201),
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          backgroundColor: Colors.green,
          title: const Text(
            "GeeksforGeeks",
            textAlign: TextAlign.start,
          ),
        ), // AppBar
        body: const Center(
          child: Text(
            "Stateless Widget",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ), // Container
      ), // Scaffold
    );
  }
}

// StatefulWidget
class MyAppNew extends StatefulWidget {
  const MyAppNew({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppNew> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 230, 255, 201),
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          backgroundColor: Colors.green,
          title: const Text(
            "GeeksforGeeks",
            textAlign: TextAlign.start,
          ),
        ), // AppBar
        body: const Center(
          child: Text(
            "StateFul Widget",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ), // Container
      ), // Scaffold
    ); // MaterialApp
  }
}

class ContainerView extends StatelessWidget {
  const ContainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Container View"),
        ),
        body: Container(
          height: 200,
          width: double.infinity,
          color: Colors.amber,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(30),
          transform: Matrix4.rotationZ(0.1),
          child: const Text(
            "Hello Container View",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
