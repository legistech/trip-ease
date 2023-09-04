import 'package:flutter/material.dart';
import 'up_rider_pf.dart'; // Import the corresponding rider profile screen
import 'up_rider_ps.dart'; // Import the corresponding rider password screen

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D2D50),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 260),
            _buildSendButton('Update Profile'),
            const SizedBox(height: 30),
            _buildSendButton('Update Password'),
          ],
        ),
      ),
    );
  }

  Widget _buildSendButton(String text) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 350,
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFCACACA)),
          borderRadius: BorderRadius.circular(50),
        ),
        child: ElevatedButton(
          onPressed: () {
            if (text == 'Update Profile') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UpdateRiderProfileScreen(),
                ),
              );
            } else if (text == 'Update Password') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UpdateRiderPasswordScreen(),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1D2D50),
            foregroundColor: const Color(0xFFCACACA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: const BorderSide(color: Color(0xFFCACACA)),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Raleway',
              fontSize: 18,
              color: Color(0xFFCACACA),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
