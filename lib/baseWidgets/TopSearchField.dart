import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:zomato_ui/Constants/route_constants.dart';

class TopSearchField extends StatefulWidget {
  const TopSearchField(
      {Key? key,
      required this.leadingIcon,
      required this.isText,
      this.text,
      this.showSetting})
      : super(key: key);

  final Widget leadingIcon;
  final bool isText;
  final bool? showSetting;
  final String? text;

  @override
  State<TopSearchField> createState() => _TopSearchFieldState();
}

class _TopSearchFieldState extends State<TopSearchField> {
  final SpeechToText _speechToText = SpeechToText();
  bool sttEnabled = false;
  String searchText = "";
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  _initSpeech() async {
    sttEnabled = await _speechToText.initialize();
    print("is enabled $sttEnabled");
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    print("search text is $searchText");
    searchController.text = searchText;
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      searchText = result.recognizedWords;
    });
  }

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
          child: widget.leadingIcon,
        ),

        // const Expanded(
        //   child: TextField(
        //     decoration: InputDecoration(
        //         border: InputBorder.none, hintText: "Restaurant name of dish..."),
        //   ),
        // ),
        widget.isText
            ? Material(
                child: Text(widget.text ?? "Restaurant name or a dish..."),
              )
            :   Expanded(flex: 5,
              child: Material(color: Colors.transparent,
                child: TextField(controller: searchController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Restaurant name or a dish..."),
                ),
              ),
            ),
        const Spacer(flex: 1),
        SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                color: Colors.grey,
                width: 1,
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: _speechToText.isListening ? _stopListening : _startListening,
            child: Icon(
              Icons.mic_none_outlined,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        if (widget.showSetting == true)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(RouteConstants.changeThemeScreen);
                },
                child: Icon(
                  Icons.settings,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
      ]),
    );
  }
}
