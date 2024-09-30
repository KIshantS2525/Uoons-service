import 'package:flutter/material.dart';

class BookingCancelledPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);  // Navigate back to the booking page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),  // Pushes the content to the center

            // Red X icon for cancellation and text in the center
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'Booking Cancelled!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Dear John Kevin, you have successfully cancelled your booking of AC Service on date 12 Dec. We hope to serve you better :)',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            Spacer(),  // Pushes the card to the bottom

            // The 3D card with service details at the bottom
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/ac_service.png', // Example image, add your image path
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      'AC Service',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('1 hr \n Includes dummy info'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),  // Add a little space at the bottom
          ],
        ),
      ),
    );
  }
}
