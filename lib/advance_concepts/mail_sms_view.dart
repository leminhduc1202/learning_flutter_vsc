import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


_sendingMails() async {
  var url = Uri.parse("mailto:leemin.dn@gmail.com");
  final Uri uriMail = Uri(
    scheme: "mailto",
    path: "leemin.dn@gmail.com"
  );
  if (await canLaunchUrl(uriMail)) {
    await launchUrl(uriMail);
  } else {
    throw 'Could not launch $uriMail';
  }
}

_sendingSMS() async {
  var url = Uri.parse("sms:0869238644");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MailAndSmsView extends StatelessWidget {
  const MailAndSmsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mail and SMS'),
          backgroundColor: Colors.green,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 200.0,
                ),
                Container(
                  height: 20.0,
                ),
                const Text(
                  'For any Queries, Mail us',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.green,
                  ),
                ),
                Container(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: _sendingMails,
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(const EdgeInsets.all(5.0)),
                    textStyle: WidgetStateProperty.all(
                      const TextStyle(color: Colors.black),
                    ),
                  ),
                  child: const Text('Here'),
                ), // ElevatedButton

                Container(
                  height: 20.0,
                ),
                const Text(
                  'Or Send SMS',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.green,
                  ),
                ),
                Container(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: _sendingSMS,
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(const EdgeInsets.all(5.0)),
                    textStyle: WidgetStateProperty.all(
                      const TextStyle(color: Colors.black),
                    ),
                  ),
                  child: const Text('Here'),
                ), // ElevatedButton
              ],
            ),
          ),
        ),
      ),
    );
  }
}
