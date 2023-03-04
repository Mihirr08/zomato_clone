import 'package:flutter/material.dart';

class BaseHero extends StatelessWidget {
  const BaseHero({Key? key, required this.tag, required this.child})
      : super(key: key);

  final String tag;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: tag,
        child: Material(
          child: child,
        ));
  }
}
