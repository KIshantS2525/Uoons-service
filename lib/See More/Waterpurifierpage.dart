import 'package:uoons_services/ServiceCards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaterPurifierServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Water Purifier Services"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceCard(
              title: 'Purifier Installation',
              price: '₹299',
              time: '30 mins',
              description:
                  'Covers installation only. Sub meter/spare parts sourced',
              imageUrl: 'assets/WaterPurifier/installation.webp',
            ),
            ServiceCard(
              title: 'Purifier Uninstallation',
              price: '₹249',
              time: '30 mins',
              description:
                  'Covers installation only. Sub meter/spare parts sourced ninstallation of Water Purifier',
              imageUrl: 'assets/WaterPurifier/uninstallation.webp',
            ),
            ServiceCard(
              title: 'RO not working',
              price: '₹249',
              time: '1 hr',
              description:
                  'Price covers diagnosis visit; spare parts are charged',
              imageUrl: 'assets/WaterPurifier/ro_not_working.webp',
            ),
            ServiceCard(
              title: 'RO Water Leakage',
              price: '₹249',
              time: '1 hr',
              description:
                  'Price covers diagnosis visit; spare parts are charged',
              imageUrl: 'assets/WaterPurifier/water_leakage.webp',
            ),
            ServiceCard(
              title: 'Low Water Flow',
              price: '₹249',
              time: '1 hr',
              description:
                  'Price covers diagnosis visit; spare parts are charged',
              imageUrl: 'assets/WaterPurifier/low_water_flow.webp',
            ),
            ServiceCard(
              title: 'Foul Taste/Odour',
              price: '₹249',
              time: '1 hr',
              description:
                  'Price covers diagnosis visit; spare parts are charged',
              imageUrl: 'assets/WaterPurifier/foul_taste_odour.webp',
            ),
            ServiceCard(
              title: 'Service Clean Up',
              price: '₹299',
              time: '1 hr',
              description:
                  'Price covers diagnosis visit; spare parts are charged',
              imageUrl: 'assets/WaterPurifier/service_cleanup.webp',
            ),
          ],
        ),
      ),
    );
  }
}
