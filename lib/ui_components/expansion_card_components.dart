import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class ExpansionView extends StatelessWidget {
  const ExpansionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Expansion Component",
      home: DefaultTabController(
          length: 4, child: ExpansionHomeView(title: "Expansion View")),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ExpansionHomeView extends StatefulWidget {
  const ExpansionHomeView({super.key, required this.title});

  final String title;

  @override
  State<ExpansionHomeView> createState() => _ExpansionHomeViewState();
}

class _ExpansionHomeViewState extends State<ExpansionHomeView> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: const TabBar(tabs: [
          Tab(icon: Icon(Icons.music_video)),
          Tab(icon: Icon(Icons.camera_alt)),
          Tab(icon: Icon(Icons.grade)),
          Tab(icon: Icon(Icons.email)),
        ]),
      ),
      body: TabBarView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ExpansionTileCard(
            key: cardA,
            leading: const CircleAvatar(child: Text('A')),
            title: const Text('Tap to Expand!'),
            subtitle: const Text('It has the GFG Logo.'),
            children: <Widget>[
              const Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Image.asset('images/gal_gadot.jpg')),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ExpansionTileCard(
            key: cardB,
            leading: const CircleAvatar(child: Text('B')),
            title: const Text('Tap to Expand!'),
            subtitle: const Text('It has the GFG Logo.'),
            children: <Widget>[
              const Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Image.asset('images/gal_gadot_1.jpg')),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ExpansionTileCard(
            key: cardC,
            leading: const CircleAvatar(child: Text('C')),
            title: const Text('Tap to Expand!'),
            subtitle: const Text('It has the GFG Logo.'),
            children: <Widget>[
              const Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Image.asset('images/gal_gadot_2.webp')),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ExpansionTileCard(
            key: cardD,
            leading: const CircleAvatar(child: Text('D')),
            title: const Text('Tap to Expand!'),
            subtitle: const Text('It has the GFG Logo.'),
            children: <Widget>[
              const Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Image.asset('images/gal_gadot_3.webp')),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
