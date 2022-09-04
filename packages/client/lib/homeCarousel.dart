//Imports
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/*
NOTE
################################################################################
This widget is used to display a carousel so that the user can see other 
useful pages offered by the app. This is to aid discoverability.
################################################################################
*/

//Code
class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int activeIndex = 0;

  final assetImages = [
    'assets/images/samples/african-elephant.jpg',
    'assets/images/samples/giraffe.jpg',
    'assets/images/samples/panda.jpg',
    'assets/images/samples/prairiedog.jpg',
    'assets/images/samples/sloth.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
            itemCount: assetImages.length,
            itemBuilder: (context, index, realIndex) {
              final image = assetImages[index];
              return buildImage(image, index);
            },
          ),
          SizedBox(height: 20),
          buildIndicator(),
        ],
      ),
    );
  }

  Widget buildImage(String image, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.black,
      child: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: assetImages.length,
    );
  }
}
