import 'package:flutter/material.dart';

class ManageAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Manage Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {
                // Handle add another address action
              },
              icon: Icon(Icons.add, color: Colors.orange),
              label: Text(
                'Add another address',
                style: TextStyle(color: Colors.orange),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text('Home'),
                subtitle: Text(
                    'Plot no.209, Kavuri Hills, Madhapur, Telangana 500033\nPh: +91234567890'),
                trailing: PopupMenuButton<String>(
                  onSelected: (String value) {
                    // Handle edit or delete action
                  },
                  itemBuilder: (BuildContext context) {
                    return {'Edit', 'Delete'}.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
              ),
            ),
            // Additional address cards can be added here
          ],
        ),
      ),
    );
  }
}
