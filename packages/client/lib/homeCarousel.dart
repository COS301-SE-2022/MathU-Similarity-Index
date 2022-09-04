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
    'images/samples/african-elephant.jpg',
    'images/samples/giraffe.jpg',
    'images/samples/panda.jpg',
    'images/samples/prairiedog.jpg',
    'images/samples/sloth.jpg'
  ];

  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            carouselController: controller,
            options: CarouselOptions(
              height: 400,
              initialPage: 0,
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
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 15),
      color: Colors.black12,
      child: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Text(
              "If you would prefer to see solutions to your questions, try checking out our mathematical tools page!"),
          TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, './calculations.dart'),
            child: Text("Yes, let's go!"),
          )
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: assetImages.length,
      onDotClicked: animateToSlide,
      effect: JumpingDotEffect(
        dotWidth: 20,
        dotHeight: 20,
        activeDotColor: Color.fromRGBO(236, 64, 122, 1),
        dotColor: Color.fromRGBO(117, 117, 117, 1),
      ),
    );
  }

  void animateToSlide(int index) {
    controller.animateToPage(index);
  }
}
