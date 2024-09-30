import 'package:flutter/material.dart';
import 'package:uoons_services/ServiceCards.dart';

class DoorbellServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doorbell Services"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceCard(
              title: "Doorbell Replacement",
              price: "₹79",
              time: "30 mins",
              description:
                  "Covers replacement only. Spare parts sourced separately.",
              imageUrl: 'assets/Doorbell/doorbell_replacement.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Doorbell Installation",
              price: "₹59",
              time: "45 mins",
              description:
                  "Covers installation only. Spare parts sourced separately..",
              imageUrl: 'assets/Doorbell/doorbell_installation.webp',
              isCustomizable: false,
            ),
          ],
        ),
      ),
    );
  }
}
