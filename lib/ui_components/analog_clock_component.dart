import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

class AnalogClockComponent extends StatefulWidget {
  const AnalogClockComponent({super.key});

  @override
  State<AnalogClockComponent> createState() => _AnalogClockComponentState();
}

class _AnalogClockComponentState extends State<AnalogClockComponent> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[900],
            title: const Text('Analog Clock'),
          ), // app bar
          backgroundColor: Colors.green,
          body: Center(
            child: AnalogClock(
              decoration: BoxDecoration(
                  border: Border.all(width: 3.0, color: Colors.black),
                  color: Colors.black,
                  shape: BoxShape.circle),
              width: 200.0,
              isLive: true,
              hourHandColor: Colors.white,
              minuteHandColor: Colors.white,
              showSecondHand: true,
              numberColor: Colors.white,
              showNumbers: true,
              textScaleFactor: 1.5,
              showTicks: true,
              showDigitalClock: true,
              digitalClockColor: Colors.white,
              datetime: DateTime.now(),
            ),
            // analog clock
          ), // center
        ),
        debugShowCheckedModeBanner: false, // scaffold
      ); // material app
}
