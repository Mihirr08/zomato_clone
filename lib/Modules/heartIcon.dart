import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zomato_ui/Constants/app_constants.dart';

class HeartIcon extends StatefulWidget {
  const HeartIcon({Key? key, this.onValueChanged}) : super(key: key);

  final Function(bool)? onValueChanged;

  @override
  _HeartIconState createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon>
    with SingleTickerProviderStateMixin {
  bool selected = false;
  late AnimationController _lottieController;

  @override
  void initState() {
    super.initState();
    _lottieController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 0));
    if (!selected) {
      _lottieController.reverse();
    } else {
      _lottieController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
            print("Selected is $selected");
            if (selected) {
              _lottieController.reverse();
            } else {
              _lottieController.forward();
            }
          });

          if (widget.onValueChanged != null) {
            widget.onValueChanged!(selected);
          }
        },
        child:
            // selected
            //     ?
            Container(
          child: Lottie.asset(AppConstants.heartLottieFile,
              controller: _lottieController, animate: true, onLoaded: (comp) {
            _lottieController
              ..duration = comp.duration
              ..forward();
          },
              repeat: false,
              height: 50,
              alignment: Alignment.topRight,
              reverse: selected),
        )
        // : const Icon(
        //     Icons.heart_broken_outlined,
        //     color: Colors.white,
        //   ),
        );
  }
}
