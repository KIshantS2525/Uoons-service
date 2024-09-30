import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import 'confirmation_page.dart';  // Import the Lottie package

class ReschedulingBottomSheet extends StatefulWidget {
  @override
  _ReschedulingBottomSheetState createState() =>
      _ReschedulingBottomSheetState();
}

class _ReschedulingBottomSheetState extends State<ReschedulingBottomSheet> {
  int selectedDateIndex = 0;
  int selectedTimeIndex = -1;

  final int daysAhead = 7;
  final List<DateTime> dates = [];
  List<String> times = [];

  @override
  void initState() {
    super.initState();
    _generateDates();
    _generateTimeSlots();
  }

  void _generateDates() {
    DateTime today = DateTime.now();
    for (int i = 0; i < daysAhead; i++) {
      dates.add(today.add(Duration(days: i)));
    }
  }

  void _generateTimeSlots() {
    times.clear();
    DateTime now = DateTime.now();
    DateTime selectedDate = dates[selectedDateIndex];

    // Set starting time for slots
    int startHour = (selectedDate.day == now.day &&
        selectedDate.month == now.month &&
        selectedDate.year == now.year)
        ? now.hour + 1
        : 9; // 9 AM for other days

    // Add hourly time slots from startHour to the end of the working day (5 PM)
    for (int i = startHour; i <= 17; i++) {
      times.add(DateFormat.jm().format(DateTime(selectedDate.year,
          selectedDate.month, selectedDate.day, i)));
    }

    // Reset selectedTimeIndex since times are re-generated
    selectedTimeIndex = -1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back),
                ),
                Text(
                  'Reschedule Booking',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 48), // To balance the space
              ],
            ),
            SizedBox(height: 20),
            _buildServiceInfoCard('2 hrs', 'Includes dummy info'),
            SizedBox(height: 10),
            _buildServiceInfoCard('Cleanup', '30 mins'),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select new date and time',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Your service will take approx. 45 mins',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 15),
            _buildDateSelector(),
            SizedBox(height: 15),
            _buildTimeSelector(),
            SizedBox(height: 20),
            _buildConfirmButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceInfoCard(String title, String description) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(description),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(dates.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDateIndex = index;
                _generateTimeSlots();
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: selectedDateIndex == index
                    ? Colors.orangeAccent
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                DateFormat('E d').format(dates[index]),
                style: TextStyle(
                  color:
                  selectedDateIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTimeSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(times.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTimeIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: selectedTimeIndex == index
                    ? Colors.orangeAccent
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                times[index],
                style: TextStyle(
                  color: selectedTimeIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: selectedTimeIndex != -1
            ? () {
          // Navigate to the ConfirmationPage
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ConfirmationPage(),
            ),
          );
        }
            : null,
        child: Text('Confirm new slot'),
        style: ElevatedButton.styleFrom(
          backgroundColor:
          selectedTimeIndex != -1 ? Colors.orangeAccent : Colors.grey,
          disabledBackgroundColor: Colors.grey[300],
        ),
      ),
    );
  }
}


