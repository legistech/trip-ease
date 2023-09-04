import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Presentation/home page/rider_home_screen.dart';
import '../../Presentation/widgets/widgets.dart';

class RegisterNewUser extends StatefulWidget {
  const RegisterNewUser({Key? key}) : super(key: key);

  @override
  State<RegisterNewUser> createState() => _RegisterNewUserState();
}

class _RegisterNewUserState extends State<RegisterNewUser> {
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
          'Register as Rider',
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
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const SizedBox(height: 50),
                  _buildInputField('Full Name', fullNameController),
                  const SizedBox(height: 10),
                  _buildInputField('Email', emailController,
                      errorText: emailError),
                  const SizedBox(height: 10),
                  _buildInputField('Password', passwordController,
                      errorText: passwordError),
                  const SizedBox(height: 10),
                  _buildInputField(
                      'Confirm Password', confirmPasswordController,
                      errorText: confirmPasswordError),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center,
                    child: AnimatedSendButton(
                      label: 'Register',
                      onPressed: () async {
                        await registerRider(context);
                      },
                    ),
                  ),
                  const SizedBox(height: 120),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigate back to the LoginScreen
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 14,
                              color: Color(0xFFCACACA),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate back to the LoginScreen
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 14,
                              color: Color(0xFF67DCE5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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

  Future<void> registerRider(BuildContext context) async {
    try {
      String email = emailController.text;
      String password = passwordController.text;
      String confirmPassword = confirmPasswordController.text;

      if (password.length < 8) {
        Fluttertoast.showToast(
          msg: "Password should be at least 8 characters long",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
        );
        return; // Don't proceed with registration
      }

      if (password != confirmPassword) {
        Fluttertoast.showToast(
          msg: "Passwords do not match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
        );
        return; // Don't proceed with registration
      }

      // Validate email using Firebase's EmailAuthProvider
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email') {
          Fluttertoast.showToast(
            msg: "Please enter a valid email address",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
          );
          return; // Don't proceed with registration
        } else if (e.code == 'email-already-in-use') {
          Fluttertoast.showToast(
            msg: "Email is already in use. Please use a different email.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
          );
          return; // Don't proceed with registration
        }
        // Handle other authentication errors
        debugPrint('Error 404 banda gayab hai');
        return;
      }

      // Proceed with successful registration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const RiderHomeScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration failed: $e")),
      );
    }
  }
}
