import 'package:flutter/material.dart';

import '../../Presentation/widgets/widgets.dart';

class UpdateRiderProfileScreen extends StatefulWidget {
  const UpdateRiderProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateRiderProfileScreen> createState() =>
      _UpdateRiderProfileScreenState();
}

class _UpdateRiderProfileScreenState extends State<UpdateRiderProfileScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? passwordError;
  String? confirmPasswordError;
  String? emailError;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Unfocus the keyboard when tapping outside text fields
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF1D2D50),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Color(0xFF67DCE5),
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        ' Update Profile',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 24,
                          color: Color(0xFFCACACA),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 160),
                _buildInputField('Full Name', fullNameController),
                const SizedBox(height: 10),
                _buildInputField('Email', emailController,
                    errorText: emailError),
                const SizedBox(height: 10),
                _buildInputField('Password', passwordController,
                    errorText: passwordError),
                const SizedBox(height: 10),
                _buildInputField('Confirm Password', confirmPasswordController,
                    errorText: confirmPasswordError),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: AnimatedSendButton(
                    label: 'Update',
                    onPressed: () async {
                      // Add your logic here for updating rider profile
                    },
                  ),
                ),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String labelText, TextEditingController controller,
      {String? errorText}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
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
              width: double.infinity,
              child: TextFormField(
                controller: controller,
                cursorColor: const Color(0xFFCACACA),
                style: const TextStyle(color: Colors.white),
                obscureText: labelText.contains('Password'),
                decoration: InputDecoration(
                  errorText: errorText,
                  filled: true,
                  fillColor: Colors.transparent,
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFCACACA),
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFCACACA),
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    // Add your validation logic here
                    if (labelText == 'Password') {
                      passwordError = value.length < 8
                          ? 'Please enter a password greater than 8 characters'
                          : null;
                      if (confirmPasswordController.text.isNotEmpty) {
                        confirmPasswordError =
                            value != confirmPasswordController.text
                                ? 'Passwords do not match'
                                : null;
                      }
                    } else if (labelText == 'Confirm Password') {
                      confirmPasswordError = value != passwordController.text
                          ? 'Passwords do not match'
                          : null;
                    } else if (labelText == 'Email') {
                      final emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      );
                      emailError = !emailRegex.hasMatch(value)
                          ? 'Please enter a valid email address'
                          : null;
                    }
                  });
                },
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
