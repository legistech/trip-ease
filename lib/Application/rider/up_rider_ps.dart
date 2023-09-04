import 'package:flutter/material.dart';

import '../../Presentation/widgets/widgets.dart';

class UpdateRiderPasswordScreen extends StatefulWidget {
  const UpdateRiderPasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdateRiderPasswordScreen> createState() =>
      _UpdateRiderPasswordScreenState();
}

class _UpdateRiderPasswordScreenState extends State<UpdateRiderPasswordScreen> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  bool currentPasswordVisible = false;
  bool newPasswordVisible = false;
  bool confirmNewPasswordVisible = false;

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
                        ' Update Password',
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
                _buildInputField('Current Password', currentPasswordController,
                    isPasswordField: true),
                const SizedBox(height: 10),
                _buildInputField('New Password', newPasswordController,
                    isPasswordField: true),
                const SizedBox(height: 10),
                _buildInputField(
                    'Confirm New Password', confirmNewPasswordController,
                    isPasswordField: true),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: AnimatedSendButton(
                    label: 'Update',
                    onPressed: () async {
                      // Add your logic here for updating rider password
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
      {bool isPasswordField = false}) {
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
                obscureText: isPasswordField
                    ? !(labelText == 'Current Password'
                        ? currentPasswordVisible
                        : labelText == 'New Password'
                            ? newPasswordVisible
                            : confirmNewPasswordVisible)
                    : false,
                decoration: InputDecoration(
                  suffixIcon: isPasswordField
                      ? IconButton(
                          icon: Icon(
                            currentPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(0xFFCACACA),
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              if (labelText == 'Current Password') {
                                currentPasswordVisible =
                                    !currentPasswordVisible;
                              } else if (labelText == 'New Password') {
                                newPasswordVisible = !newPasswordVisible;
                              } else if (labelText == 'Confirm New Password') {
                                confirmNewPasswordVisible =
                                    !confirmNewPasswordVisible;
                              }
                            });
                          },
                        )
                      : null,
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
