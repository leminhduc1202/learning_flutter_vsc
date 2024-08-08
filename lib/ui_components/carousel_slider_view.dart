import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderView extends StatelessWidget {
  const CarouselSliderView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Carousel Slider View",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      darkTheme: ThemeData.dark(),
      home: const CarouselSliderHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CarouselSliderHomePage extends StatelessWidget {
  const CarouselSliderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("Carousel Slider"),
        // ),
        body: Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          CarouselSlider(
              items: [
                //1st Image of Slider
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://www.irishtimes.com/polopoly_fs/1.4109315.1575891315!/image/image.jpg_gen/derivatives/box_620_330/image.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //2nd Image of Slider
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://english.cdn.zeenews.com/sites/default/files/2019/12/10/834702-gal-gadot-news.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //3rd Image of Slider
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://i.pinimg.com/564x/f6/1a/5f/f61a5f7e90f0ba4f3eda751f6ebc6f46.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //4th Image of Slider
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://image.lexica.art/full_webp/0ff198e8-1fc9-4a51-9c3a-f96ce2c4d799"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //5th Image of Slider
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://variety.com/wp-content/uploads/2023/08/Screen-Shot-2023-08-10-at-3.43.28-PM.png?w=1000&h=667&crop=1&resize=1000%2C667"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                  height: MediaQuery.sizeOf(context).height / 2,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 1,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8))
        ],
      ),
    ));
  }
}
