import 'package:flutter/material.dart';
import 'codeverification.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
          'Forgot Password',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 24,
            color: Color(0xFFCACACA),
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 200),
              _buildInputField('Email Address', context),
              const SizedBox(height: 250),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF67DCE5)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      final email =
                          "sample@email.com"; // Replace with actual email
                      final verificationCode = _generateVerificationCode();
                      await _sendVerificationCode(email, verificationCode);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CodeVerificationScreen(
                                email: email,
                                verificationCode: verificationCode)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D2D50),
                      foregroundColor: const Color(0xFF67DCE5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Color(0xFF67DCE5)),
                      ),
                    ),
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 18,
                        color: Color(0xFF67DCE5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sendVerificationCode(String email, String code) async {
    // You can use your own method to send the code to the user's email
    print('Verification code sent to $email: $code');
  }

  String _generateVerificationCode() {
    // Generate a random 4-digit code
    return (1000 + (DateTime.now().millisecondsSinceEpoch % 9000)).toString();
  }

  Widget _buildInputField(String labelText, BuildContext context) {
    TextEditingController emailController = TextEditingController();

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
                controller: emailController,
                cursorColor: Color(0xFFCACACA),
                style: TextStyle(color: Colors.white),
                onSubmitted: (_) async {
                  final email = emailController.text;
                  final verificationCode = _generateVerificationCode();
                  await _sendVerificationCode(email, verificationCode);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CodeVerificationScreen(
                            email: email, verificationCode: verificationCode)),
                  );
                },
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
