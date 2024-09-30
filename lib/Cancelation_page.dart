import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'booking_cancel.dart';


class CancelBookingPage extends StatefulWidget {
  final String serviceName;
  final String date;
  final List<String> services;

  CancelBookingPage({
    required this.serviceName,
    required this.date,
    required this.services,
  });

  @override
  _CancelBookingPageState createState() => _CancelBookingPageState();
}

class _CancelBookingPageState extends State<CancelBookingPage> {
  String? selectedReason;
  bool isCancelEnabled = false;
  final TextEditingController _commentController = TextEditingController();
  bool isCommentEntered = false;

  void _handleReasonChange(String? value) {
    setState(() {
      selectedReason = value;
      isCancelEnabled = selectedReason != null;
    });
  }

  @override
  void initState() {
    super.initState();
    _commentController.addListener(() {
      setState(() {
        isCommentEntered = _commentController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.black.withOpacity(0.5), // Slightly dark background overlay
            ),
          ),

          LayoutBuilder(
            builder: (context, constraints) {
              return DraggableScrollableSheet(
                initialChildSize: 0.7,
                minChildSize: 0.5,
                maxChildSize: 0.9,
                builder: (context, scrollController) {
                  return Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 50),
                                  Center(
                                    child: Container(
                                      width: 50,
                                      height: 5,
                                      margin: EdgeInsets.only(bottom: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.close, color: Colors.grey[600]),
                                    onPressed: () {
                                      Navigator.pop(context); // Close dialog logic
                                    },
                                  ),
                                ],
                              ),
                              Center(
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    width: screenWidth - 60,
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.serviceName,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Date: ${widget.date}',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Services: ${widget.services.join(', ')}',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                'Reason for Cancellation',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Column(
                                children: [
                                  RadioListTile<String>(
                                    title: const Text('Taking too much time to confirm the order.'),
                                    value: 'Taking too much time',
                                    groupValue: selectedReason,
                                    onChanged: _handleReasonChange,
                                  ),
                                  RadioListTile<String>(
                                    title: const Text('Pricing is too high.'),
                                    value: 'Pricing too high',
                                    groupValue: selectedReason,
                                    onChanged: _handleReasonChange,
                                  ),
                                  RadioListTile<String>(
                                    title: const Text('Wrong address selected.'),
                                    value: 'Wrong address',
                                    groupValue: selectedReason,
                                    onChanged: _handleReasonChange,
                                  ),
                                  RadioListTile<String>(
                                    title: const Text('Wrong order placed.'),
                                    value: 'Wrong order',
                                    groupValue: selectedReason,
                                    onChanged: _handleReasonChange,
                                  ),
                                  RadioListTile<String>(
                                    title: const Text('Placed order by mistake.'),
                                    value: 'Order by mistake',
                                    groupValue: selectedReason,
                                    onChanged: _handleReasonChange,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              TextField(
                                controller: _commentController,
                                decoration: InputDecoration(
                                  labelText: isCommentEntered
                                      ? null
                                      : 'Description of reasons for cancellation',
                                  labelStyle: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                  filled: true,
                                  fillColor: isCommentEntered
                                      ? Colors.white
                                      : Colors.grey[300],
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: 3,
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: isCancelEnabled
                                    ? () {
                                  // Navigate to booking cancel page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BookingCancelledPage(),
                                    ),
                                  );
                                }
                                    : null,
                                child: Text('Cancel Now'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                  isCancelEnabled ? Colors.orange : Colors.grey,
                                  minimumSize: Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
