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
    'assets/images/laptop.png',
    'assets/images/letGo.png',
    'assets/images/flag.png',
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
              viewportFraction: (MediaQuery.of(context).size.width > 750)
                  ? 0.3
                  : (MediaQuery.of(context).size.width < 750 &&
                          MediaQuery.of(context).size.width > 450)
                      ? 0.5
                      : 0.8,
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
          const SizedBox(height: 20),
          buildIndicator(),
        ],
      ),
    );
  }

  Widget buildImage(String image, int index) {
    return Card(
      child: Container(
        width: 300,
        height: 350,
        margin: EdgeInsets.all(10),
        //color: Colors.black12,
        child: Column(
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
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
      effect: const JumpingDotEffect(
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
          padding: const EdgeInsets.fromLTRB(8.5, 0.5, 8.5, 0.5),
          child: Text(
            "If you would prefer to see solutions, try checking out our mathematical tools page!",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
              wordSpacing: 2.5,
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.center,
          ),
        ));
        content.add(SizedBox(height: 10));
        content.add(ElevatedButton(
          style: ButtonStyle(
            elevation:
                MaterialStateProperty.resolveWith<double>(((states) => 0)),
            backgroundColor: MaterialStateProperty.resolveWith(getColor),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/MathematicalTools.dart');
          },
          child: Text(
            "Yes, let's go!",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ));
        break;
      case 1:
        content.add(Container(
          padding: const EdgeInsets.fromLTRB(8.5, 0.5, 8.5, 0.5),
          child: Text(
            "Login to access cool stuff!",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
              wordSpacing: 2.5,
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.center,
          ),
        ));
        content.add(SizedBox(height: 10));
        content.add(ElevatedButton(
          style: ButtonStyle(
            elevation:
                MaterialStateProperty.resolveWith<double>(((states) => 0)),
            backgroundColor: MaterialStateProperty.resolveWith(getColor),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/logIn.dart');
          },
          child: Text(
            "Log In!",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ));
        break;
      case 2:
        content.add(Container(
          padding: const EdgeInsets.fromLTRB(8.5, 0.5, 8.5, 0.5),
          child: Text(
            "Check out our past papers!",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
              wordSpacing: 2.5,
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.center,
          ),
        ));
        content.add(SizedBox(height: 10));
        content.add(ElevatedButton(
          style: ButtonStyle(
            elevation:
                MaterialStateProperty.resolveWith<double>(((states) => 0)),
            backgroundColor: MaterialStateProperty.resolveWith(getColor),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/PastPapersTools.dart');
          },
          child: Text(
            "Yes, let's go!",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ));
        break;
      default:
        content.add(const Text("Nothing to see here."));
        content.add(const SizedBox(height: 5));
        content.add(const SizedBox(height: 5));
        break;
    }

    return content;
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color.fromRGBO(236, 64, 122, 1);
    }
    return Color(0xFF003255);
  }
}
