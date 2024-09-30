import 'package:flutter/material.dart';
import 'package:uoons_services/ServiceCards.dart';

class MicrowaveServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Microwave Services"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceCard(
              title: "Microwave Repair",
              price: "₹160",
              time: "-",
              description:
                  "Price covers diagnosis visit; spare parts are charged",
              imageUrl: 'assets/microwave/microwave_repair.jpg',
            ),
            ServiceCard(
              title: "Button Not Working",
              price: "₹160",
              time: "-",
              description:
                  "Price covers diagnosis visit; spare parts are charged",
              imageUrl: 'assets/microwave/button_not_working.jpg',
            ),
            ServiceCard(
              title: "Electrical Issue/Not Working",
              price: "₹160",
              time: "-",
              description:
                  "Price covers diagnosis visit; spare parts are charged",
              imageUrl: 'assets/microwave/electrical_issue.jpg',
            ),
            ServiceCard(
              title: "Noise Issue",
              price: "₹160",
              time: "-",
              description:
                  "Price covers diagnosis visit; spare parts are charged",
              imageUrl: 'assets/microwave/noise_issue.jpg',
            ),
            ServiceCard(
              title: "Not Heating",
              price: "₹160",
              time: "-",
              description:
                  "Price covers diagnosis visit; spare parts are charged",
              imageUrl: 'assets/microwave/not_heating.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
