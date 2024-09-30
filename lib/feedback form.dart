import 'package:flutter/material.dart';

class FeedbackFormSheet extends StatefulWidget {
  final String date;
  final String serviceName;

  FeedbackFormSheet({
    required this.date,
    required this.serviceName,
  });

  @override
  _FeedbackFormSheetState createState() => _FeedbackFormSheetState();
}

class _FeedbackFormSheetState extends State<FeedbackFormSheet> {
  final _formKey = GlobalKey<FormState>();
  int _rating = 0; // For storing the selected rating
  String _comments = ''; // For storing the comments

  bool get isFormValid => _rating > 0; // Button will be enabled only if rating is provided

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey, // Form key for validation
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Share Feedback',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),

            // Booking Details
            Divider(),
            Text('Date: ${widget.date}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Service: ${widget.serviceName}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),

            // Rating Field
            Text('Rate the service:', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return IconButton(
                  iconSize: 45, // Increased star size
                  icon: Icon(
                    _rating > index ? Icons.star : Icons.star_border,
                    color: Colors.orange,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 20),

            // Comments Field (Optional)
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Your Comments',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _comments = value;
              },
            ),
            SizedBox(height: 20),

            // Submit Button
            SizedBox(
              width: MediaQuery.of(context).size.width - 20, // Button width minus 20px
              child: ElevatedButton(
                onPressed: isFormValid
                    ? () {
                  if (_formKey.currentState!.validate()) {
                    // Handle feedback form submission logic
                    print('Rating: $_rating');
                    print('Comments: $_comments');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Feedback Submitted!')),
                    );
                    Navigator.of(context).pop(); // Close the modal after submission
                  }
                }
                    : null, // Button is disabled if the form is invalid
                child: Text('Submit Feedback'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFormValid ? Colors.orange : Colors.grey, // Change color based on form validation
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
