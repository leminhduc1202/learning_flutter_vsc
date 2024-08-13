import 'package:flutter/material.dart';
import 'package:learning_flutter_vsc/ui_components/alert_dialog_box_component.dart';
import 'package:learning_flutter_vsc/ui_components/analog_clock_component.dart';
import 'package:learning_flutter_vsc/ui_components/expansion_card_components.dart';
import 'package:learning_flutter_vsc/ui_components/icon_component.dart';
import 'package:learning_flutter_vsc/ui_components/video_player_component.dart';

void main() {
  // runApp(const MyApp());
  // runApp(const MyAppNew());
  // runApp(const ContainerView());
  // runApp(const ScaffoldWidgetView());
  // runApp(const BottomNavigationbarWidget());
  // runApp(ClipRRectView());
  // runApp(DrawerView());
  // runApp(RotatedBoxView());
  // runApp(RichTextView());
  // runApp(OctoImageView());
  // runApp(const CarouselSliderView());
  // runApp(const StaggeredGridViewUI());
  // runApp(const ProgressIndicatorsComponent());
  // runApp(const AlertDialogBox());
  // runApp(const TabBarDemo());
  // runApp(const AnalogClockComponent());
  runApp(const VideoPlayerApp());
  runApp(const ExpansionView());
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
            "Learning Flutter",
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
            "Learning Flutter",
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
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}

class ScaffoldWidgetView extends StatelessWidget {
  const ScaffoldWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Learning Flutter",
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(primarySwatch: Colors.grey),
      color: Colors.amberAccent,
      supportedLocales: {
        const Locale('en', ''),
      },
      debugShowCheckedModeBanner: false,
      home: ScaffoldView(),
    );
  }
}

class ScaffoldView extends StatelessWidget {
  const ScaffoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scafflod View"),
      ),
      body: const Center(
        child: Text(
          "Hi Scaffold Widget",
          style: TextStyle(color: Colors.black, fontSize: 40.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 10.0,
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              child: Text("List View"),
              decoration: BoxDecoration(color: Colors.green),
            ),
            ListTile(
              title: Text("Items 1"),
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text("Items 2"),
              leading: Icon(Icons.mail),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Profile"),
        ],
        currentIndex: 0,
        fixedColor: Colors.green,
        onTap: (int indexOfitem) {},
      ),
    );
  }
}

class BottomNavigationbarWidget extends StatelessWidget {
  static const String _title = 'Learning Flutter Code Sample';
  const BottomNavigationbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: NavigationView(),
    );
  }
}

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 50, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'HOME PAGE',
      style: optionStyle,
    ),
    Text(
      'COURSE PAGE',
      style: optionStyle,
    ),
    Text(
      'CONTACT GFG',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<BottomNavigationBarItem> _widgetBottomItems =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark),
      label: "Courses",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.contact_mail),
      label: "Mail",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Flutter'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _widgetBottomItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class ClipRRectView extends StatelessWidget {
  // This widget is
  //the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipOval',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePAGE(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePAGE extends StatefulWidget {
  @override
  _MyHomePAGEState createState() => _MyHomePAGEState();
}

class _MyHomePAGEState extends State<MyHomePAGE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Flutter'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network('https://picsum.photos/250?image=9'),
            ),
            ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: Image.network('https://picsum.photos/250?image=9'),
              ),
            ),
            Image.network(
                'https://raw.githubusercontent.com/flutter/assets-for-api-docs/master/packages/diagrams/assets/blend_mode_destination.jpeg',
                color: Color.fromRGBO(255, 255, 255, 0.5),
                colorBlendMode: BlendMode.modulate)
          ],
        ),
      ),
      backgroundColor: Colors.green[50],
    );
  }
}

class MyClip extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 100, 100);
  }

  bool shouldReclip(oldClipper) {
    return false;
  }
}
