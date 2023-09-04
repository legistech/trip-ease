import 'package:flutter/material.dart';
import 'package:tripease/Presentation/widgets/widgets.dart';
import '../../Application/forgot password/forget.dart';

import '../../Application/new user/driver_register.dart';
import '../../Application/new user/rider_ register.dart';

import '../home page/driver_home_screen.dart';
import '../home page/rider_home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isDriverSelected = true;
  bool showPassword = false;

  final FocusScopeNode _focusScopeNode = FocusScopeNode();

  @override
  void dispose() {
    _focusScopeNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusScopeNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF1D2D50),
        body: FocusScope(
          node: _focusScopeNode,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 24,
                      color: Color(0xFFCACACA),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDriverSelected = true;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: isDriverSelected ? 200 : 120,
                        height: 38,
                        decoration: BoxDecoration(
                          color: isDriverSelected
                              ? const Color(0xFF67DCE5)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Driver',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 18,
                              color: isDriverSelected
                                  ? Colors.black
                                  : const Color(0xFF67DCE5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDriverSelected = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        width: !isDriverSelected ? 200 : 120,
                        height: 38,
                        decoration: BoxDecoration(
                          color: !isDriverSelected
                              ? const Color(0xFF67DCE5)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Rider',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 18,
                              color: !isDriverSelected
                                  ? Colors.black
                                  : const Color(0xFF67DCE5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    const Padding(
                      padding: EdgeInsets.only(left: 28),
                      child: Text(
                        'Email Address',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 14,
                          color: Color(0xFFCACACA),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28),
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
                    const SizedBox(height: 40),
                    const Padding(
                      padding: EdgeInsets.only(left: 28),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 14,
                          color: Color(0xFFCACACA),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextField(
                            cursorColor: const Color(0xFFCACACA),
                            obscureText: !showPassword,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFCACACA)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFCACACA)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Icon(
                                Icons.visibility,
                                color: Color(0xFFCACACA),
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 69,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Forget Password screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ForgetPasswordScreen(),
                          ),
                        );
                      },
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 28),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 12,
                              color: Color(0xFFCACACA),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (!isDriverSelected)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.center,
                        child: AnimatedSendButton(
                          label: 'Login',
                          onPressed: () {
                            // Navigate to the RiderHomeScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RiderHomeScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigate to the RegisterNewUser screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => RegisterNewUser(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Don\'t have an account? ',
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 14,
                                  color: Color(0xFFCACACA),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigate to the RegisterNewUser screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => RegisterNewUser(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Register',
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
                if (isDriverSelected)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.center,
                        child: AnimatedSendButton(
                          label: 'Login',
                          onPressed: () {
                            // Navigate to the DriverHomeScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const DriverHomeScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigate to the RegisterDriver screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RegisterDriver(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Don\'t have an account? ',
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 14,
                                  color: Color(0xFFCACACA),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigate to the RegisterDriver screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RegisterDriver(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Register',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
