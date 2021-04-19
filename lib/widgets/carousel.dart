import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<String> images = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/5.jpg',
  ];

  final CarouselController _controller = CarouselController();

  List<Widget> generateImages() {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: generateImages(),
      options: CarouselOptions(
        scrollPhysics: NeverScrollableScrollPhysics(),
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      carouselController: _controller,
    );
  }
}
