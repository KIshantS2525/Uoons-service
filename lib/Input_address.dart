import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class AddressInputDialog extends StatefulWidget {
  @override
  _AddressInputDialogState createState() => _AddressInputDialogState();
}

class _AddressInputDialogState extends State<AddressInputDialog> {
  TextEditingController _addressController = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();
  LatLng _currentPosition = LatLng(37.77483, -122.41942);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    _currentPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Address'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _addressController,
              decoration: InputDecoration(hintText: "Enter your address"),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Country'),
              items: ['India', 'USA', 'UK'].map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (newValue) {},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Mobile Number'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Flat, House No., Building, Company, Apartment'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Area, Street, Sector, Village'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Landmark'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Pincode'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Town/City'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'State'),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              width: double.infinity,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _currentPosition,
                  zoom: 14.0,
                ),
                onCameraMove: _onCameraMove,
              ),
            ),
            SizedBox(height: 10),
            CheckboxListTile(
              title: Text("Make this my default address"),
              value: false,
              onChanged: (newValue) {},
              controlAffinity: ListTileControlAffinity.leading,  // Align checkbox to the left
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Submit'),
          onPressed: () {
            // Save the address or use _currentPosition for geolocation
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
