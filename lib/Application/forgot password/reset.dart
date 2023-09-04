import 'package:flutter/material.dart';
import '../../Presentation/widgets/widgets.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

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
          'Reset Password',
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
            _buildInputField('New Password'),
            const SizedBox(height: 10),
            _buildInputField('Confirm New Password'),
            const SizedBox(height: 250),
            Align(
              alignment: Alignment.center,
              child: AnimatedSendButton(
                label: 'Reset',
                onPressed: () {
                  // Add your reset password logic here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String labelText) {
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
            const SizedBox(
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
