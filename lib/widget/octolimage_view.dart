import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class OctoImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OctoImage',
      theme: ThemeData(),
      home: OctoImagePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Octoimage extension to StatelessWidget
class OctoImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OctoImage'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          _customImage(),
          const SizedBox(height: 16),
          _simpleBlur(),
          const SizedBox(height: 16),
          _circleAvatar(),
        ],
      ),
    );
  }

  // circularProgressIndicator
  Widget _customImage() {
    return SizedBox(
      height: 200,
      child: OctoImage(
        image: const NetworkImage(
            'https://www.irishtimes.com/polopoly_fs/1.4109315.1575891315!/image/image.jpg_gen/derivatives/box_620_330/image.jpg'),
        progressIndicatorBuilder: (context, progress) {
          double value;
          value = (progress != null && progress.expectedTotalBytes != null)
              ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes!
              : 10.0;
          return CircularProgressIndicator(value: value);
        },
        errorBuilder: (context, error, stacktrace) => const Icon(Icons.error),
      ),
    );
  }

  //blusrHash
  Widget _simpleBlur() {
    return AspectRatio(
      aspectRatio: 269 / 173,
      child: OctoImage(
        image: const NetworkImage(
            'https://english.cdn.zeenews.com/sites/default/files/2019/12/10/834702-gal-gadot-news.jpg'),
        errorBuilder: OctoError.icon(color: Colors.red),
        fit: BoxFit.cover,
      ),
    );
  }

  //circleAvatar
  Widget _circleAvatar() {
    return SizedBox(
      height: 200,
      child: OctoImage.fromSet(
        fit: BoxFit.cover,
        image: const NetworkImage(
          'https://i.pinimg.com/564x/f6/1a/5f/f61a5f7e90f0ba4f3eda751f6ebc6f46.jpg',
        ),
        octoSet: OctoSet.circleAvatar(
          backgroundColor: Colors.red,
          text: const Text("Gal"),
        ),
      ),
    );
  }
}
