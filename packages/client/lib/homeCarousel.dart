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
              height: 350,
              viewportFraction: 0.3,
              initialPage: 0,
              autoPlay: true,
              //enlargeCenterPage: true,
              //enlargeStrategy: CenterPageEnlargeStrategy.height,
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
    return Card(
      child: Container(
        width: 250,
        height: 300,
        //margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
        //color: Colors.black12,
        child: Column(
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            generateContent(index)[0],
            generateContent(index)[1],
            generateContent(index)[2],
          ],
        ),
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

  List<Widget> generateContent(int index) {
    List<Widget> content = <Widget>[];

    switch (index) {
      case 0:
        content.add(Container(
          padding: EdgeInsets.fromLTRB(8.5, 0.5, 8.5, 0.5),
          child: Text(
            "If you would prefer to see solutions, try checking out our mathematical tools page!",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              wordSpacing: 2.5,
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.center,
          ),
        ));
        content.add(SizedBox(height: 10));
        content.add(TextButton(
          onPressed: () => Navigator.pushNamed(context, './calculations.dart'),
          child: Text("Yes, let's go!"),
        ));
        break;
      case 1:
        content.add(Container(
          padding: EdgeInsets.fromLTRB(8.5, 0.5, 8.5, 0.5),
          child: Text(
            "Login to access cool stuff!",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              wordSpacing: 2.5,
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.center,
          ),
        ));
        content.add(SizedBox(height: 10));
        content.add(TextButton(
          onPressed: () => Navigator.pushNamed(context, './calculations.dart'),
          child: Text("Login!"),
        ));
        break;
      case 2:
        content.add(Container(
          padding: EdgeInsets.fromLTRB(8.5, 0.5, 8.5, 0.5),
          child: Text(
            "Check out our past papers!",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              wordSpacing: 2.5,
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.center,
          ),
        ));
        content.add(SizedBox(height: 10));
        content.add(TextButton(
          onPressed: () => Navigator.pushNamed(context, './calculations.dart'),
          child: Text("Yes, let's go!"),
        ));
        break;
      case 3:
        content.add(Container(
          padding: EdgeInsets.fromLTRB(8.5, 0.5, 8.5, 0.5),
          child: Text(
            "Once I figure out what this page is for, I'll let you know!",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              wordSpacing: 2.5,
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.center,
          ),
        ));
        content.add(SizedBox(height: 10));
        content.add(TextButton(
          onPressed: () => Navigator.pushNamed(context, './calculations.dart'),
          child: Text("Yes, let's go!"),
        ));
        break;
      case 4:
        content.add(Container(
          padding: EdgeInsets.fromLTRB(8.5, 0.5, 8.5, 0.5),
          child: Text(
            "Once I figure out what this page is for, I'll let you know!",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              wordSpacing: 2.5,
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.center,
          ),
        ));
        content.add(SizedBox(height: 10));
        content.add(TextButton(
          onPressed: () => Navigator.pushNamed(context, './calculations.dart'),
          child: Text("Yes, let's go!"),
        ));
        break;
      default:
        content.add(Text("Nothing to see here."));
        content.add(SizedBox(height: 5));
        content.add(SizedBox(height: 5));
        break;
    }

    return content;
  }
}
