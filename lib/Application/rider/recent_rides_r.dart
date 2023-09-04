import 'package:flutter/material.dart';

class RecentRidesRider extends StatelessWidget {
  const RecentRidesRider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D2D50),
      body: _buildRecentRidesList(),
    );
  }

  Widget _buildRecentRidesList() {
    final List<RecentRide> recentRides = [
      RecentRide(
        driverName: 'John Doe',
        driverRating: 4.5,
        paymentAmount: 15.0,
        pickupLocation: '123 Main St',
        dropoffLocation: '456 Elm St',
        driverImage: 'assets/driver.jpg',
      ),
      RecentRide(
        driverName: 'John Doe',
        driverRating: 4.5,
        paymentAmount: 15.0,
        pickupLocation: '123 Main St',
        dropoffLocation: '456 Elm St',
        driverImage: 'assets/driver.jpg',
      ),
      RecentRide(
        driverName: 'John Doe',
        driverRating: 4.5,
        paymentAmount: 15.0,
        pickupLocation: '123 Main St',
        dropoffLocation: '456 Elm St',
        driverImage: 'assets/driver.jpg',
      ),
      RecentRide(
        driverName: 'John Doe',
        driverRating: 4.5,
        paymentAmount: 15.0,
        pickupLocation: '123 Main St',
        dropoffLocation: '456 Elm St',
        driverImage: 'assets/driver.jpg',
      ),
      RecentRide(
        driverName: 'John Doe',
        driverRating: 4.5,
        paymentAmount: 15.0,
        pickupLocation: '123 Main St',
        dropoffLocation: '456 Elm St',
        driverImage: 'assets/driver.jpg',
      ),
      RecentRide(
        driverName: 'John Doe',
        driverRating: 4.5,
        paymentAmount: 15.0,
        pickupLocation: '123 Main St',
        dropoffLocation: '456 Elm St',
        driverImage: 'assets/driver.jpg',
      ),
      RecentRide(
        driverName: 'John Doe',
        driverRating: 4.5,
        paymentAmount: 15.0,
        pickupLocation: '123 Main St',
        dropoffLocation: '456 Elm St',
        driverImage: 'assets/driver.jpg',
      ),
    ];

    return ListView.builder(
      itemCount: recentRides.length,
      itemBuilder: (context, index) {
        return _buildRecentRideCard(recentRides[index]);
      },
    );
  }

  Widget _buildRecentRideCard(RecentRide ride) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
        side: const BorderSide(color: Color(0xFFCACACA)),
      ),
      color: Colors.transparent,
      elevation: 0, // No elevation for the card
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 10, offset: Offset(6, 6))
          ],
          border: Border.all(color: const Color(0xFFCACACA)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(ride.driverImage),
                ),
                title: Text(
                  ride.driverName,
                  style: const TextStyle(color: Color(0xFFCACACA)),
                ),
                subtitle: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow),
                    Text(
                      ride.driverRating.toString(),
                      style: const TextStyle(color: Color(0xFFCACACA)),
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${ride.paymentAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFCACACA),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: Color(0xFF67DCE5),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          ride.pickupLocation,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFCACACA),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: Color(0xFF67DCE5),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          ride.dropoffLocation,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFCACACA),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentRide {
  final String driverName;
  final double driverRating;
  final double paymentAmount;
  final String pickupLocation;
  final String dropoffLocation;
  final String driverImage;

  RecentRide({
    required this.driverName,
    required this.driverRating,
    required this.paymentAmount,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.driverImage,
  });
}
