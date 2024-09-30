import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uoons_services/Bookingpage.dart';
import 'package:uoons_services/Profile/Profilepage.dart';
import 'package:uoons_services/See%20More/AppliancesServices.dart';
import 'package:uoons_services/See%20More/DoorbellService.dart';
import 'package:uoons_services/See%20More/FanServicepage.dart';
import 'package:uoons_services/See%20More/Inverter&Stabilizer.dart';
import 'package:uoons_services/See%20More/LightServicepage.dart';
import 'package:uoons_services/See%20More/MCBandFuses.dart';
import 'package:uoons_services/See%20More/MicrowaveServicePage.dart';
import 'package:uoons_services/See%20More/SomethingElsePage.dart';
import 'package:uoons_services/See%20More/WashingMachinePage.dart';
import 'package:uoons_services/See%20More/Waterpurifierpage.dart';
import 'package:uoons_services/See%20More/WiringService.dart';
import 'dart:async';
import 'package:uoons_services/See More/Ac_services.dart';
import 'package:uoons_services/Input_address.dart';
import 'See More/Refrigerator_services.dart';
import 'See More/Switches_Socket_Service_page.dart';



class MyHomePage extends StatefulWidget {
  final String username;

  MyHomePage({required this.username});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomePage(),
      BookingsPage(),
      ProfilePage(username: widget.username),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentAddress = "Fetching location...";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    PermissionStatus permission = await Permission.location.request();
    if (permission.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
        "${place.street}, ${place.locality}, ${place.administrativeArea}";
      });
    } else {
      setState(() {
        _currentAddress = "Location permission denied";
      });
    }
  }

  void _showAddressDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddressInputDialog();
      },
    );
  }


  void _showServiceDetailsDialog(String serviceName) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        // Get the screen width
        final screenWidth = MediaQuery.of(context).size.width;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Close icon (cross) at the top right corner
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.grey[600],
                      size: 24,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Title of the service
                Text(
                  serviceName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),

                // Content/details about the service
                Text(
                  'Details about $serviceName',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),

                // View Cart Button
                Center(
                  child: SizedBox(
                    width: screenWidth - 20, // Button width is screen width minus 20
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle view cart button press
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16), // Button height
                      ),
                      child: Text(
                        'View Cart',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),  // Added space here
            GestureDetector(
              onTap: _showAddressDialog,
              child: Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _currentAddress,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for services and packages',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'AC Repair and services',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ACServicesPage()),
                    );
                  },
                  child: Text("See More"),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ServiceCard(serviceName: 'AC Installation', price: '799/-',isCustomizable: true,customizationOptions: ["Split", "Window"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'AC Uninstallation', price: '399/-',isCustomizable: true, customizationOptions: ["Split", "Window"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'AC Repair', price: '299/-',isCustomizable: true, customizationOptions: ["Split", "Window"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'AC Gas leak fix & refill', price: '2500/-',isCustomizable: true, customizationOptions: ["Split", "Window"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Power saver AC service', price: '549/-',isCustomizable: true, customizationOptions: ["Split", "Window"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Anti-rust deep clean AC service', price: '949/-',isCustomizable: true, customizationOptions: ["Split", "Window"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                ],
              ),
            ),
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Refrigerator',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RefrigeratorServicesPage()),
                    );
                  },
                  child: Text("See More"),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ServiceCard(serviceName: 'Refrigerator checkup', price: '160/-',isCustomizable: true, customizationOptions: ["Single Door", "Double door","Side-by-side Door"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Door not closing', price: '160/-',isCustomizable: true, customizationOptions: ["Single Door", "Double door","Side-by-side Door"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'No cooling', price: '160/-',isCustomizable: true, customizationOptions: ["Single Door", "Double door","Side-by-side Door"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'No Power', price: '160/-',isCustomizable: true, customizationOptions: ["Single Door", "Double door","Side-by-side Door"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Noise Issue', price: '160/-',isCustomizable: true, customizationOptions: ["Single Door", "Double door","Side-by-side Door"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Water Leakage', price: '160/-',isCustomizable: true, customizationOptions: ["Single Door", "Double door","Side-by-side Door"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                ],
              ),
            ),
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Water Purifier',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WaterPurifierServicesPage()),
                    );
                  },
                  child: Text("See More"),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ServiceCard(serviceName: 'Purifier Installation', price: '299/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Purifier Uninstallation', price: '249/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'RO not working', price: '249/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'RO Water Leakage', price: '249/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Low Water Flow', price: '249/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Foul Taste/Odour', price: '249/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Service Clean Up', price: '299/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                ],
              ),
            ),
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FanServicesPage()),
                    );
                  },
                  child: Text("See More"),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ServiceCard(serviceName: 'Ceiling Fan Installation', price: '89/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Fan Uninstallation', price: '69/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Decorative Ceiling fan Installation', price: '319/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Exhaust Fan Installation', price: '99/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Wall Fan Installation', price: '89/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Fan Replacement', price: '149/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Fan Repair', price: '109/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Ceiling Fan Regulator Replacement', price: '49/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                ],
              ),
            ),
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Light',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LightServicesPage()),
                    );
                  },
                  child: Text("See More"),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ServiceCard(serviceName: 'Ceiling light installation', price: '129/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Tubelight installation/repair', price: '69/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Wall light installation', price: '99/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Bulb/CFL/LED installation (upto 5)', price: '69/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Bulb/tubelight holder installation', price: '69/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Replace CFL to LED', price: '129/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Decorative lights installation', price: '89/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Decorative lights uninstallation', price: '99/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Decorative lantern installation', price: '99/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Chandelier installation', price: '549/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                ],
              ),
            ),
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Microwave',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MicrowaveServicesPage()),
                    );
                  },
                  child: Text("See More"),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ServiceCard(serviceName: 'Microwave repair', price: '160/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Button Not Working', price: '160/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Electical Issue/Not working', price: '160/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Noise Issue', price: '160/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Not Heating', price: '160/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                ],
              ),
            ),
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Washing Machine',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WashingMachineServicesPage()),
                    );
                  },
                  child: Text("See More"),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ServiceCard(serviceName: 'Washing machine Installation', price: '160/-',isCustomizable: true,customizationOptions: ["Top Load (Fully automatic) Checkup", "Front Load (Fully Automatic) Checkup", "Semi- automatic"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Washing machine Uninstallation', price: '160/-',isCustomizable: true,customizationOptions: ["Top Load (Fully automatic) Checkup", "Front Load (Fully Automatic) Checkup", "Semi- automatic"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'No Power', price: '160/-',isCustomizable: true,customizationOptions: ["Top Load (Fully automatic) Checkup", "Front Load (Fully Automatic) Checkup", "Semi- automatic"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Noise Issue', price: '160/-',isCustomizable: true,customizationOptions: ["Top Load (Fully automatic) Checkup", "Front Load (Fully Automatic) Checkup", "Semi- automatic"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Not Washing/spinning', price: '160/-',isCustomizable: true,customizationOptions: ["Top Load (Fully automatic) Checkup", "Front Load (Fully Automatic) Checkup", "Semi- automatic"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Water Leakage form Drain', price: '160/-',isCustomizable: true,customizationOptions: ["Top Load (Fully automatic) Checkup", "Front Load (Fully Automatic) Checkup", "Semi- automatic"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Error on Machine Display', price: '160/-',isCustomizable: true,customizationOptions: ["Top Load (Fully automatic) Checkup", "Front Load (Fully Automatic) Checkup", "Semi- automatic"],onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Spin Tub Not Working (Semi - Automatic)', price: '160/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                ],
              ),
            ),
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'MCB & Fuse',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MCBServicesPage()),
                    );
                  },
                  child: Text("See More"),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ServiceCard(serviceName: 'MCB fuse replacement', price: '79/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Sub meter installation', price: '219/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Double pole MCB installation', price: '149/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: '3 Phase changeover switch installation', price: '249/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Single pole MCB installation', price: '99/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                ],
              ),
            ),
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Door Bell',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DoorbellServicesPage()),
                    );
                  },
                  child: Text("See More"),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ServiceCard(serviceName: 'Door bell replacement', price: '79/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Door bell installation', price: '59/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                ],
              ),
            ),
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wiring',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WiringServicesPage()),
                    );
                  },
                  child: Text("See More"),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ServiceCard(serviceName: 'New wiring without casing (per 5m)', price: '89/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'New wiring with casing (per 5m)', price: '209/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'New internal wiring (per 5m)', price: '159/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                ],
              ),
            ),
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Appliances',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AppliancesServicesPage()),
                    );
                  },
                  child: Text("See More"),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ServiceCard(serviceName: 'Geyser installation', price: '399/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'TV installation', price: '379/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'TV uninstallation', price: '139/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'WiFi CCTV installation', price: '229/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Room heater repair', price: '219/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Home video bell', price: '549/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Mixer grinder check up/ repair', price: '210/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Mini home theater installation', price: '239/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'EV charger installation (2 wheeler)', price: '750/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Laptop Updation & Repair', price: '450/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                ],
              ),
            ),
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Inverter & Stabilizer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InverterStabilizerServicesPage()),
                    );
                  },
                  child: Text("See More"),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ServiceCard(serviceName: 'Inverter fuse replacement', price: '99/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Inverter servicing', price: '139/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Inverter installation', price: '369/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Stabilizer installation', price: '119/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Inverter repair', price: '210',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                ],
              ),
            ),
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Switches & Sockets',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SwitchesSocketsServicesPage()),
                    );
                  },
                  child: Text("See More"),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ServiceCard(serviceName: 'Switchbox installation (15+ amp)', price: '239/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Switch/socket replacement', price: '49/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'AC switchbox installation', price: '249/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Switchboard installation', price: '169/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Switchboard/switchbox repair', price: '79/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Modular retrofit smart switches', price: '119/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Smart appliance controller', price: '179/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Converter retrofit Wi-Fi smart', price: '179/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                ],
              ),
            ),
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Looking for Something Else',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SomethingElseServicesPage()),
                    );
                  },
                  child: Text("See More"),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ServiceCard(serviceName: 'Minor repair/installation', price: '99/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                  ServiceCard(serviceName: 'Book an electrician', price: '49/-',onPressed: () {_showServiceDetailsDialog('AC Installation');},),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class ServiceCard extends StatefulWidget {
  final String serviceName;
  final String price;
  final bool isCustomizable;
  final List<String> customizationOptions;
  final VoidCallback onPressed;

  ServiceCard({
    required this.serviceName,
    required this.price,
    this.isCustomizable = false,
    this.customizationOptions = const [],
    required this.onPressed,
  });

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  int _quantity = 0;

  void _increment() {
    setState(() {
      _quantity++;
    });
    if (widget.isCustomizable && _quantity == 1) {
      _showCustomizationDialog();
    }
  }

  void _decrement() {
    setState(() {
      if (_quantity > 0) {
        _quantity--;
      }
    });
  }

  void _showCustomizationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Customization'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.customizationOptions.map((option) {
              return ListTile(
                title: Text(option),
                onTap: () {
                  // Handle customization selection
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                setState(() {
                  _quantity = 0;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: InkWell(
        onTap: widget.onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.serviceName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(widget.price),
                  if (widget.isCustomizable)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Customization available',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: _decrement,
                  ),
                  Text('$_quantity'),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _increment,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
