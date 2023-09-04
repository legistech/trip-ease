import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:tripease/Application/rider/payment.dart';
import 'package:tripease/Application/rider/profileview_r.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D2D50),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSectionTitle('Account'),
            _buildListTile('View Profile', EvaIcons.person, context),
            _buildListTile('Payment Methods', EvaIcons.creditCard, context),
            _buildSectionTitle('Notifications'),
            _buildListTile('Push Notifications', EvaIcons.bell, context),
            _buildListTile('Email Notifications', EvaIcons.email, context),
            _buildSectionTitle('Privacy'),
            _buildListTile('Saved Locations', EvaIcons.pin, context),
            _buildListTile('Privacy Settings', EvaIcons.lock, context),
            _buildSectionTitle('Help'),
            _buildListTile('FAQ', EvaIcons.questionMark, context),
            _buildListTile('Contact Us', EvaIcons.messageCircle, context),
            _buildListTile('Terms of Service', EvaIcons.fileText, context),
            _buildListTile('Logout', EvaIcons.logOut, context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFFCACACA),
        ),
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon, BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF67DCE5),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFCACACA),
        ),
      ),
      onTap: () {
        if (title == 'View Profile') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ViewProfileScreen(),
            ),
          );
        } else if (title == 'Payment Methods') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PaymentMethodsScreen(),
            ),
          );
        } else {}
      },
    );
  }
}
