import 'package:flutter/material.dart';
import 'reset.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CodeVerificationScreen extends StatelessWidget {
  const CodeVerificationScreen(
      {Key? key, required this.email, required String verificationCode})
      : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D2D50),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF67DCE5)),
          iconSize: 28,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Code Verification',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 24,
            color: Color(0xFFCACACA),
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 200),
            _buildInputField('Verification Code', context),
            const SizedBox(height: 250),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async {
                  final verificationCode =
                      '123456'; // Get the entered verification code
                  try {
                    // Verify the code using Firebase Auth
                    await FirebaseAuth.instance
                        .verifyPasswordResetCode(verificationCode);

                    // If successful, navigate to ResetPasswordScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ResetPasswordScreen()),
                    );
                  } catch (e) {
                    // If verification fails, show an error
                    print('Code verification error: $e');
                    // TODO: Show an error message to the user
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF1D2D50),
                  onPrimary: const Color(0xFF67DCE5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Color(0xFF67DCE5)),
                  ),
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 18,
                    color: Color(0xFF67DCE5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String labelText, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              labelText,
              style: const TextStyle(
                fontFamily: 'Raleway',
                fontSize: 14,
                color: Color(0xFFCACACA),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 360,
              child: TextField(
                cursorColor: Color(0xFFCACACA),
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCACACA)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCACACA)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
