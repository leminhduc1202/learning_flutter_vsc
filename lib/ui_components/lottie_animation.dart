import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends StatefulWidget {
  const LottiePage({super.key});

  @override
  LottiePageState createState() => LottiePageState();
}

class LottiePageState extends State<LottiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottie animation"),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Font google 1",
              style: GoogleFonts.oswald(
                  textStyle: const TextStyle(fontSize: 24.0)),
            ),
            Text(
              "Font google 2",
              style: GoogleFonts.zcoolKuaiLe(
                  textStyle: const TextStyle(fontSize: 42.0)),
            ),
            Text(
              "Font google 3",
              style: GoogleFonts.daiBannaSil(
                  textStyle: const TextStyle(fontSize: 36.0)),
            ),
            Lottie.network(
                'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
                repeat: true,
                reverse: true,
                animate: true,
                width: 100.0,
                height: 100.0),
            Lottie.network(
                'https://assets1.lottiefiles.com/private_files/lf30_yQtj4O.json',
                repeat: true,
                reverse: true,
                animate: true,
                width: 100.0,
                height: 100.0),
            Lottie.network(
                'https://lottie.host/834e400c-7ade-4464-a7c8-d0033e70773c/KNA8BJvt4k.json',
                repeat: true,
                reverse: true,
                animate: true,
                width: 100.0,
                height: 100.0),
          ],
        ),
      ),
    );
  }
}
