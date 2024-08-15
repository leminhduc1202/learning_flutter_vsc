import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {super.key,
      required this.photo,
      required this.onTap,
      required this.width});

  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo hero'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: PhotoHero(
          photo: 'assets/images/gal_gadot_1.jpg',
          width: 300.0,
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Gal Gadot'),
                  backgroundColor: Colors.green,
                ),
                body: Container(
                  // background of 2nd route
                  color: Colors.purple,
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.topLeft,
                  child: PhotoHero(
                    photo: 'assets/images/gal_gadot_1.jpg',
                    width: 100.0,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}
