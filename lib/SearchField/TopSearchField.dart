import 'package:flutter/material.dart';

class TopSearchField extends StatelessWidget {
  const TopSearchField(
      {Key? key, required this.leadingIcon, required this.fromHome})
      : super(key: key);

  final Widget leadingIcon;
  final bool fromHome;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: leadingIcon,
        ),

        // const Expanded(
        //   child: TextField(
        //     decoration: InputDecoration(
        //         border: InputBorder.none, hintText: "Restaurant name of dish..."),
        //   ),
        // ),
        fromHome
            ? const Material(
                child: Text("Restaurant name or a dish..."),
              )
            : const Expanded(
              child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Restaurant name or a dish..."),
                ),
            ),
        const Spacer(),
        SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                color: Colors.grey,
                width: 1,
              ),
            )),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.mic_none_outlined,
            color: Colors.red,
          ),
        ),
      ]),
    );
  }
}
