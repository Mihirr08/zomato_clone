import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zomato_ui/Constants/ColorConstants.dart';
import 'package:zomato_ui/Constants/app_constants.dart';
import 'package:zomato_ui/baseWidgets/base_hero.dart';

import '../Constants/route_constants.dart';
import 'heartIcon.dart';

class BaseCard extends StatefulWidget {
  const BaseCard(
      {Key? key,
      this.imageName,
      this.title,
      required this.index,
      this.discount})
      : super(key: key);

  final List<String>? imageName;
  final String? title;
  final String? discount;
  final int index;

  @override
  State<BaseCard> createState() => _BaseCardState();
}

class _BaseCardState extends State<BaseCard> {
  late CarouselController _carouselController;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: widget.key,
      onTap: () {
        Navigator.pushNamed(context, RouteConstants.detailScreen, arguments: {
          "heroTag": "${AppConstants.baseCardHeroTag}${widget.index}",
          "imageName": widget.imageName,
          "currentIndex": currentIndex,
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 4)),
          ]),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        child: BaseHero(
                            tag:
                                "${AppConstants.baseCardHeroTag}${widget.index}",
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: CarouselSlider(
                                carouselController: _carouselController,
                                options: CarouselOptions(
                                    height: 200,
                                    onPageChanged: (index, _) {
                                      currentIndex = index;
                                    }),
                                items: widget.imageName?.map((image) {
                                  return Image.network(
                                    image,
                                    height: 190,
                                    fit: BoxFit.fill,
                                  );
                                }).toList(),
                              ),
                            )),
                      ),
                      IgnorePointer(
                        ignoring: true,
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.transparent
                              ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)),
                          height: 190,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.3),
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Text(
                                    widget.title ?? "",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                              HeartIcon(onValueChanged: (value) {
                                debugPrint("Value is $value");
                              }),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 10, right: 10, top: 30),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(Icons.print),
                                ),
                                Text(
                                  "Free delivery with Gold",
                                  style: TextStyle(
                                      color: ColorConstants.goldenColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.timelapse_outlined),
                                    ),
                                    Text(
                                      "15-20 min * 1km",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "\$150 for one",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 75),
                child: Container(
                  height: 40,
                  decoration: const BoxDecoration(
                    color: ColorConstants.tileColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.percent_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${widget.discount ?? "00"}% OFF",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
