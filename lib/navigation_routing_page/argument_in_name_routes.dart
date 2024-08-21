import 'package:flutter/material.dart';
import 'package:learning_flutter_vsc/navigation_routing_page/return_data_from_screen.dart';
import 'package:learning_flutter_vsc/navigation_routing_page/send_data_to_new_screen.dart';

import 'avoiding_junk.dart';
import 'image_picker_view.dart';

class ArgumentNameRoutes extends StatelessWidget {
  const ArgumentNameRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ExtractArgumentsScreen.routeName: (context) =>
            const ExtractArgumentsScreen(),
        AvoidingJunk.routeNameLoadData: (context) =>
            const AvoidingJunk(),
        ReturnDataFromScreen.routeNameReturnData: (context) =>
            const ReturnDataFromScreen(),
        TodosScreen.routeNameTodo: (context) =>
            TodosScreen(),
        ImagePickerView.routeNameImagePicker: (context) =>
            const ImagePickerView()
      },
      onGenerateRoute: (settings) {
        if (settings.name == PassArgumentsScreen.routeName) {
          final args = settings.arguments as ScreenArguments;
          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                title: args.title,
                message: args.message,
              );
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      title: 'Navigation with Arguments',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ExtractArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'A Screen',
                    'Data from HomeScreen to A Screen',
                  ),
                );
              },
              child: const Text('Navigate to A Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'B Screen',
                    'Data from HomeScreen to B Screen',
                  ),
                );
              },
              child: const Text('Navigate to B Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AvoidingJunk.routeNameLoadData,
                );
              },
              child: const Text('Navigate to Load data Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ReturnDataFromScreen.routeNameReturnData,
                );
              },
              child: const Text('Navigate to Return Data Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  TodosScreen.routeNameTodo,
                );
              },
              child: const Text('Navigate to list task Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ImagePickerView.routeNameImagePicker,
                );
              },
              child: const Text('Image Picker View'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({super.key});

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  const PassArgumentsScreen({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
