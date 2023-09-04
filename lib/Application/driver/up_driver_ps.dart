import 'package:flutter/material.dart';
import '../../Presentation/widgets/widgets.dart';

class UpdateDriverPasswordScreen extends StatefulWidget {
  const UpdateDriverPasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdateDriverPasswordScreen> createState() =>
      _UpdateDriverPasswordScreenState();
}

class _UpdateDriverPasswordScreenState
    extends State<UpdateDriverPasswordScreen> {
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
          'Update Password',
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
          child: Padding(
            padding: const EdgeInsets.all(10), // Updated padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 130),
                _buildInputField('Current Password', currentPasswordController,
                    isPasswordField: true),
                const SizedBox(height: 10),
                _buildInputField('New Password', newPasswordController,
                    isPasswordField: true),
                const SizedBox(height: 10),
                _buildInputField(
                    'Confirm New Password', confirmNewPasswordController,
                    isPasswordField: true),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: AnimatedSendButton(
                    label: 'Update',
                    onPressed: () async {
                      // Add your logic here for updating driver password
                    },
                  ),
                ),
                const SizedBox(height: 20),
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
      padding: const EdgeInsets.only(
          left: 20, right: 20, bottom: 12), // Updated padding
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
