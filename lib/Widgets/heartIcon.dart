import 'package:flutter/material.dart';

class HeartIcon extends StatefulWidget {
  const HeartIcon({Key? key}) : super(key: key);

  @override
  _HeartIconState createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      setState(() {
        selected = !selected;
      });
    },
      child: Icon(
        Icons.heart_broken_outlined,
        color: selected ? Colors.red : Colors.white,
      ),
    );
  }
}
