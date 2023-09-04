import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../../Application/rider/personal_info_r.dart';
import '../../Application/rider/recent_rides_r.dart';
import '../../Application/rider/settings_r.dart';

class RiderHomeScreen extends StatefulWidget {
  const RiderHomeScreen({Key? key}) : super(key: key);

  @override
  State<RiderHomeScreen> createState() => _RiderHomeScreenState();
}

class _RiderHomeScreenState extends State<RiderHomeScreen> {
  final _textFieldFocusNode = FocusNode();
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  Color getIconColor(int index) {
    return _selectedIndex == index
        ? const Color(0xFF67DCE5)
        : const Color(0xFF18A5BD);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _textFieldFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF1D2D50),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Color(0xFF67DCE5), // Color of the back button icon
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          itemCount: 4, // Number of tabs/screens
          itemBuilder: (context, index) {
            if (index == 0) {
              return HomeScreen();
            } else if (index == 1) {
              return RecentRidesRider(); // Use the RecentRidesRider screen here
            } else if (index == 2) {
              return PersonalInfoScreen();
            } else if (index == 3) {
              return SettingsScreen();
            } else {
              return Container(); // Return an empty container for unknown index
            }
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xFF1D2D50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                    _pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                icon: Icon(
                  EvaIcons.homeOutline,
                  color: getIconColor(0),
                  size: 28,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                    _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                icon: Icon(
                  EvaIcons.activityOutline,
                  color: getIconColor(1),
                  size: 28,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                    _pageController.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                icon: Icon(
                  EvaIcons.personOutline,
                  color: getIconColor(2),
                  size: 28,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                    _pageController.animateToPage(
                      3,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                icon: Icon(
                  EvaIcons.settingsOutline,
                  color: getIconColor(3),
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D2D50),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, kToolbarHeight + 16, 16, 0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFCACACA),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Row(
                children: [
                  Icon(
                    EvaIcons.searchOutline,
                    color: Color(0xFF67DCE5),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Where to?',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
