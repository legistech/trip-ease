import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../../Application/driver/personal_info_d.dart';
import '../../Application/driver/recent_rides_d.dart';
import '../../Application/driver/settings_d.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({Key? key}) : super(key: key);

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
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
              return RecentRidesDriver(); // Use the RecentRidesDriver screen here
            } else if (index == 2) {
              return PersonalInfoScreenDriver(); // Use the Driver's personal info screen here
            } else if (index == 3) {
              return SettingsScreenDriver(); // Use the Driver's settings screen here
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool isOnline = false;
  bool showRideRequests = false;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  final List<RecentRideRequest> rideRequests = [
    RecentRideRequest(
      riderName: 'Jane Doe',
      pickupLocation: '789 Elm St',
      dropoffLocation: '567 Oak St',
      riderImage: 'assets/rider.jpg',
    ),
    RecentRideRequest(
      riderName: 'Jane Doe',
      pickupLocation: '789 Elm St',
      dropoffLocation: '567 Oak St',
      riderImage: 'assets/rider.jpg',
    ),
    RecentRideRequest(
      riderName: 'Jane Doe',
      pickupLocation: '789 Elm St',
      dropoffLocation: '567 Oak St',
      riderImage: 'assets/rider.jpg',
    ),
    RecentRideRequest(
      riderName: 'Jane Doe',
      pickupLocation: '789 Elm St',
      dropoffLocation: '567 Oak St',
      riderImage: 'assets/rider.jpg',
    ),
    RecentRideRequest(
      riderName: 'Jane Doe',
      pickupLocation: '789 Elm St',
      dropoffLocation: '567 Oak St',
      riderImage: 'assets/rider.jpg',
    ),
    RecentRideRequest(
      riderName: 'Jane Doe',
      pickupLocation: '789 Elm St',
      dropoffLocation: '567 Oak St',
      riderImage: 'assets/rider.jpg',
    ),
    RecentRideRequest(
      riderName: 'Jane Doe',
      pickupLocation: '789 Elm St',
      dropoffLocation: '567 Oak St',
      riderImage: 'assets/rider.jpg',
    ),
    RecentRideRequest(
      riderName: 'Jane Doe',
      pickupLocation: '789 Elm St',
      dropoffLocation: '567 Oak St',
      riderImage: 'assets/rider.jpg',
    ),
    RecentRideRequest(
      riderName: 'Jane Doe',
      pickupLocation: '789 Elm St',
      dropoffLocation: '567 Oak St',
      riderImage: 'assets/rider.jpg',
    ),
    // Add more ride requests here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF1D2D50),
        padding: const EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isOnline = false;
                      showRideRequests = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: isOnline ? 120 : 200,
                    height: 38,
                    decoration: BoxDecoration(
                      color: isOnline
                          ? Colors.transparent
                          : const Color(0xFF67DCE5),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        'OFFLINE',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          color:
                              isOnline ? const Color(0xFF67DCE5) : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isOnline = true;
                      showRideRequests = !showRideRequests;
                      if (showRideRequests) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: !isOnline ? 120 : 200,
                    height: 38,
                    decoration: BoxDecoration(
                      color: !isOnline
                          ? Colors.transparent
                          : const Color(0xFF67DCE5),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        'ONLINE',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          color: !isOnline
                              ? const Color(0xFF67DCE5)
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (showRideRequests)
              Expanded(
                child: _buildRideRequestsList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRideRequestsList() {
    return AnimatedContainer(
      duration: const Duration(seconds: 5),
      height: showRideRequests ? null : 0,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        )),
        child: Stack(children: [
          SingleChildScrollView(
            reverse: true, // Reverse the order to make animation bottom to top
            child: Column(
              children: [
                for (var rideRequest in rideRequests)
                  _buildRideRequestCard(rideRequest),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildRideRequestCard(RecentRideRequest rideRequest) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
        side: const BorderSide(color: Color(0xFFCACACA)),
      ),
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 120, // Adjusted height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(6, 6),
            )
          ],
          border: Border.all(color: const Color(0xFFCACACA)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(rideRequest.riderImage),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From: ${rideRequest.pickupLocation}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFCACACA),
                    ),
                  ),
                  Text(
                    'To: ${rideRequest.dropoffLocation}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFCACACA),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Accept the ride request
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF67DCE5),
              ),
              child: const Text('Accept'),
            ),
            ElevatedButton(
              onPressed: () {
                // Decline the ride request
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Decline'),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentRideRequest {
  final String riderName;
  final String pickupLocation;
  final String dropoffLocation;
  final String riderImage;

  RecentRideRequest({
    required this.riderName,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.riderImage,
  });
}
