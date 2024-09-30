import 'package:flutter/material.dart';
import 'package:uoons_services/ServiceCards.dart';

class FanServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fan Services"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceCard(
              title: "Ceiling Fan Installation",
              price: "₹89",
              time: "-",
              description:
                  "Covers installation only. Spare parts sourced separately.",
              imageUrl: 'assets/fan/ceiling_fan_installation.jpg',
            ),
            ServiceCard(
              title: "Fan Uninstallation",
              price: "₹69",
              time: "-",
              description: "Covers Uninstallation only. ",
              imageUrl: 'assets/fan/fan_uninstallation.jpg',
            ),
            ServiceCard(
              title: "Decorative Ceiling Fan Installation",
              price: "₹319",
              time: "-",
              description:
                  "Covers installation only. Spare parts sourced separately.",
              imageUrl: 'assets/fan/decorative_ceiling_fan_installation.jpg',
            ),
            ServiceCard(
              title: "Exhaust Fan Installation",
              price: "₹99",
              time: "-",
              description:
                  "Covers installation only. Spare parts sourced separately.",
              imageUrl: 'assets/fan/exhaust_fan_installation.jpg',
            ),
            ServiceCard(
              title: "Wall Fan Installation",
              price: "₹89",
              time: "-",
              description:
                  "Covers installation only. Spare parts sourced separately.",
              imageUrl: 'assets/fan/wall_fan_installation.jpg',
            ),
            ServiceCard(
              title: "Fan Replacement",
              price: "₹149",
              time: "-",
              description: "Replacement only",
              imageUrl: 'assets/fan/fan_replacement.jpg',
            ),
            ServiceCard(
              title: "Fan Repair",
              price: "₹109",
              time: "-",
              description: "Fan Repair only",
              imageUrl: 'assets/fan/fan_repair.jpg',
            ),
            ServiceCard(
              title: "Ceiling Fan Regulator Replacement",
              price: "₹49",
              time: "-",
              description: "Replacement only",
              imageUrl: 'assets/fan/ceiling_fan_regulator_replacement.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
