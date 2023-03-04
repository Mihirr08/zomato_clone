import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpField extends StatefulWidget {
  const OtpField({Key? key}) : super(key: key);

  @override
  _OtpFieldState createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const OTPTextField(
              fieldStyle: FieldStyle.box,
              length: 4,
              width: 350,
              fieldWidth: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: ElevatedButton(onPressed: () {}, child: const Text("Login")),
            ),
          ],
        ),
      ),
    );
  }
}
