import 'package:flutter/material.dart';

class SlidingImageCard extends StatefulWidget {
  @override
  _SlidingImageCardState createState() => _SlidingImageCardState();
}

class _SlidingImageCardState extends State<SlidingImageCard> {
  final PageController _controller =
  PageController(initialPage: 0, viewportFraction: 0.9);
  int _currentPage = 0;
  final List<String> images = [
    'assets/images/happy1.jpg',
    'assets/images/happy2.jpg',
    'assets/images/happy3.jpg',
    'assets/images/happy4.jpg',
    'assets/images/happy5.jpg',
    'assets/images/happy6.png',

  ];

  @override
  void initState() {
    super.initState();
    _autoSlide();
  }

  void _autoSlide() {
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _currentPage = (_currentPage + 1) % images.length;
          _controller.animateToPage(
            _currentPage,
            duration: Duration(milliseconds:1000),
            curve: Curves.easeInOut,
          );
        });
        _autoSlide();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _controller,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
