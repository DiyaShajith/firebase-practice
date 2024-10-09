import 'package:flutter/material.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "OTP Verification",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "we will send you a One Time Password on this Mobile Number",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  label: Text("Enter the Mobile Number"),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {}, child: Text("Generate OTP"))),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(label: Text("Enter the OTP")),
            )
          ],
        ),
      ),
    );
  }
}
