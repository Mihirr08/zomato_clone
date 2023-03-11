import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zomato_ui/baseWidgets/base_hero.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {Key? key,
      required this.heroTag,
      required this.imageName,
      required this.currentIndex})
      : super(key: key);
  final String heroTag;
  final List<String>? imageName;
  final int currentIndex;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late CarouselController _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _carouselController.animateToPage(widget.currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: BaseHero(
              tag: widget.heroTag,
              child: CarouselSlider(
                carouselController: _carouselController,
                options:
                    CarouselOptions(height: 200, onPageChanged: (index, _) {}),
                items: widget.imageName?.map((image) {
                  return Image.network(
                    image,
                    height: 190,
                    fit: BoxFit.fill,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
