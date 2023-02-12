import 'package:flutter/material.dart';
import 'package:zomato_ui/Constants/ColorConstants.dart';
import 'package:zomato_ui/Widgets/heartIcon.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
      child: Container(decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.3),blurRadius: 10,spreadRadius: 1,offset: Offset(0,4)),
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
                      child: Image.asset(
                        "images/lapinoz_pizza.jpg",
                      ),
                    ),
                    Container(
                      decoration:  BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),height: 190,
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
                                child: const Text(
                                  "Desi Pijja",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                            const HeartIcon(),
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
                child: Row(children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.percent_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "50% OFF",
                    style: TextStyle(
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
    );
  }
}
