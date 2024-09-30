import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green,
                    size: 160, // Adjust size for a bigger icon
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Booking Rescheduled!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Dear John Kevin, you have successfully re-scheduled your booking of AC Service for the new date 22 Mar at 10:00 AM. Our service provider will contact you soon.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                widthFactor: 0.9, // 90% width, leaving 10% space
                child: ElevatedButton(
                  onPressed: () {
                    // Handle View Booking action
                  },
                  child: Text('View Booking'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Bottom padding for spacing
          ],
        ),
      ),
    );
  }
}
