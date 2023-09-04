import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../login screen/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> _onboardingData = [
    {
      'heading': 'TripEase',
      'text':
          'will change the future of ride sharing on top of advertising with local businesses who would like to promote taking rides out to the bar or restaurant or club and have less liabilities of someone leaving drinking and driving.',
    },
    {
      'heading': 'Benefit',
      'text':
          'not just to riders but drivers as well ashgdaksgdvshgfdaksdhagfdasdkhfadkjsagdkjsahdcksahfd,andkchsadkcsahfndcsamgncdhmasgcdksacdksacd,ascdsadcsahkdncsagcdsafdcsahjdncsa,hd sahndvsmandvsafdcsa',
    },
    {
      'heading': 'Book with Ease',
      'text': 'Effortlessly book cabs, bikes, and more.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D2D50),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _onboardingData.length,
              effect: const ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.white,
                dotColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {});
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  heading: _onboardingData[index]['heading']!,
                  text: _onboardingData[index]['text']!,
                  isLastScreen: index == _onboardingData.length - 1,
                  imagePath:
                      _getImagePath(index), // Call a function to get image path
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Function to get image path based on index
  String _getImagePath(int index) {
    switch (index) {
      case 0:
        return 'assets/taxi5.jpeg';
      case 1:
        return 'assets/taxi4.png';
      case 2:
        return 'assets/taxi3.jpeg';
      default:
        return '';
    }
  }
}

class OnboardingPage extends StatelessWidget {
  final String heading;
  final String text;
  final bool isLastScreen;
  final String imagePath;

  const OnboardingPage({
    super.key,
    required this.heading,
    required this.text,
    required this.isLastScreen,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            heading,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF67DCE5),
              ),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            text,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFFCACACA),
              ),
            ),
            textAlign: TextAlign.left, // Align text to the left
          ),
          const SizedBox(height: 20),
          if (!isLastScreen)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
                child: Text(
                  'Skip',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color(0xFFCACACA),
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ),
          if (isLastScreen)
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward),
                color: const Color(0xFFCACACA),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
              ),
            ),
          Container(
            width: 200,
            height: 200,
            color: const Color(0xFF1D2D50), // Set the background color
            child: Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                color: Colors.white, // Apply white color filter to the image
                colorBlendMode: BlendMode.dstATop, // Apply color filter mode
              ),
            ),
          ),
        ],
      ),
    );
  }
}
