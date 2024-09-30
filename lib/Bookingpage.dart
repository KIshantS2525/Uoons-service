import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Cancelation_page.dart';
import 'Rescheduling_sheet.dart';
import 'feedback form.dart'; // New feedback form import

class BookingsController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}

class BookingsPage extends StatelessWidget {
  final BookingsController controller = Get.put(BookingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Obx(() => Padding(
            padding: const EdgeInsets.all(16.0),
            child: CupertinoSegmentedControl<int>(
              children: {
                0: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text('Upcoming'),
                ),
                1: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text('Previous'),
                ),
              },
              onValueChanged: (value) {
                controller.changeTabIndex(value);
              },
              groupValue: controller.selectedIndex.value,
              borderColor: Colors.deepOrangeAccent,
              selectedColor: Colors.orangeAccent,
              unselectedColor: Colors.white,
              pressedColor: Colors.orangeAccent.withOpacity(0.2),
            ),
          )),
          Expanded(
            child: Obx(() {
              return controller.selectedIndex.value == 0
                  ? UpcomingBookingsList()
                  : PreviousBookingsList();
            }),
          ),
        ],
      ),
    );
  }
}

class UpcomingBookingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Replace with your dynamic data count
      itemBuilder: (context, index) {
        return BookingCard(
          date: '22nd Nov, Tuesday',
          services: ['AC Service', 'AC Fitting'],
          serviceName: 'AC cleanup',
          onViewDetails: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => BookingDetailsSheet(
                date: '22nd Nov, Tuesday',
                services: ['AC Service', 'AC Fitting'],
                serviceName: 'AC cleanup',
              ),
              isScrollControlled: true,
            );
          },
          onReschedule: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => ReschedulingBottomSheet(),
              isScrollControlled: true,
            );
          },
          onCancelBooking: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CancelBookingPage(
                  serviceName: 'AC cleanup',
                  date: '22nd Nov, Tuesday',
                  services: ['AC Service', 'AC Fitting'],
                ),
              ),
            );
          },
          isUpcoming: true,
        );
      },
    );
  }
}

class PreviousBookingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Replace with your dynamic data count
      itemBuilder: (context, index) {
        return BookingCard(
          date: '22nd Nov, Tuesday',
          services: ['AC Service', 'AC Fitting'],
          serviceName: 'AC cleanup',
          onViewDetails: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => BookingDetailsSheet(
                date: '22nd Nov, Tuesday',
                services: ['AC Service', 'AC Fitting'],
                serviceName: 'AC cleanup',
              ),
              isScrollControlled: true,
            );
          },
          onReschedule: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => ReschedulingBottomSheet(),
              isScrollControlled: true,
            );
          },
          onShareFeedback: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => FeedbackFormSheet(
                date: '22nd Nov, Tuesday',
                serviceName: 'AC cleanup',
              ),
              isScrollControlled: true,
            );
          },
          isUpcoming: false,
        );
      },
    );
  }
}

class BookingCard extends StatelessWidget {
  final String date;
  final List<String> services;
  final String serviceName;
  final VoidCallback onViewDetails;
  final VoidCallback onReschedule;
  final VoidCallback? onShareFeedback; // Added for previous bookings
  final VoidCallback? onCancelBooking; // Added for upcoming bookings
  final bool isUpcoming;

  BookingCard({
    required this.date,
    required this.services,
    required this.serviceName,
    required this.onViewDetails,
    required this.onReschedule,
    this.onShareFeedback,
    this.onCancelBooking,
    this.isUpcoming = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onViewDetails,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ...services.map((service) => Text(
                          service,
                          style: TextStyle(color: Colors.grey[600]),
                        )),
                      ],
                    ),
                    Text(
                      serviceName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: onReschedule,
                      child: Text(
                        'Reschedule',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                      ),
                    ),
                    if (isUpcoming)
                      ElevatedButton(
                        onPressed: onCancelBooking != null
                            ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CancelBookingPage(
                                serviceName: serviceName,
                                date: date,
                                services: services,
                              ),
                            ),
                          );
                        }
                            : null,
                        child: Text(
                          'Cancel Booking',
                          style: TextStyle(color: Colors.red.shade400),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white70,
                            side: BorderSide(color: Colors.red)),
                      )
                    else
                      ElevatedButton(
                        onPressed: onShareFeedback, // Changed to dynamic feedback
                        child: Text(
                          'Share Feedback',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white70,
                          side: BorderSide(color: Colors.orange),
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

class BookingDetailsSheet extends StatelessWidget {
  final String date;
  final List<String> services;
  final String serviceName;

  BookingDetailsSheet({
    required this.date,
    required this.services,
    required this.serviceName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Booking Details', style: TextStyle(fontSize: 20)),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
          Divider(),
          Text('Date: $date'),
          SizedBox(height: 10),
          Text('Service Name: $serviceName'),
          SizedBox(height: 10),
          Text('Services:'),
          ...services.map((service) => Text('- $service')),
        ],
      ),
    );
  }
}

