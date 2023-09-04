import 'package:flutter/material.dart';
import '../driver/up_driver_pf.dart';
import '../driver/up_driver_ps.dart';

class PersonalInfoScreenDriver extends StatefulWidget {
  const PersonalInfoScreenDriver({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreenDriver> createState() =>
      _PersonalInfoScreenDriverState();
}

class _PersonalInfoScreenDriverState extends State<PersonalInfoScreenDriver> {
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
                  builder: (_) => UpdateDriverProfileScreen(),
                ),
              );
            } else if (text == 'Update Password') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UpdateDriverPasswordScreen(),
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
