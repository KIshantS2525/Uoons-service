import 'package:flutter/material.dart';
import '../Login_page.dart';
import 'edit_profile.dart';
import 'manage_address.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  ProfilePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Added padding to ensure the profile picture isn't touching the left side
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Ensure alignment is consistent
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'), // replace with actual image URL or asset
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username.isNotEmpty ? username : 'Test',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('+91 1234567890'),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.orange),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfilePage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Manage Address'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageAddressPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Refer & Earn'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle refer & earn action
              },
            ),
            ListTile(
              leading: Icon(Icons.star_rate),
              title: Text('Rate us'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle rate us action
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Uoons Services'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle about Uoons Services action
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
