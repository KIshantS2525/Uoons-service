import 'package:flutter/material.dart';
import 'package:uoons_services/ServiceCards.dart';

class WiringServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wiring Services"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceCard(
              title: "New Wiring without Casing (per 5m)",
              price: "₹89",
              time: "1 hr",
              description:
                  "Installation of new wiring without casing for a length of 5 meters.",
              imageUrl: 'assets/Wiring/wiring_without_casing.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "New Wiring with Casing (per 5m)",
              price: "₹209",
              time: "1.5 hrs",
              description:
                  "Installation of new wiring with casing for a length of 5 meters.",
              imageUrl: 'assets/Wiring/wiring_with_casing.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "New Internal Wiring (per 5m)",
              price: "₹159",
              time: "2 hrs",
              description:
                  "Installation of new internal wiring for a length of 5 meters.",
              imageUrl: 'assets/Wiring/internal_wiring.webp',
              isCustomizable: false,
            ),
          ],
        ),
      ),
    );
  }
}
