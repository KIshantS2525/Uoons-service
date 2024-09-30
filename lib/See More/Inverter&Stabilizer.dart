import 'package:flutter/material.dart';
import 'package:uoons_services/ServiceCards.dart';

class InverterStabilizerServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inverter and Stabilizer Services"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceCard(
              title: "Inverter Fuse Replacement",
              price: "₹99",
              time: "30 mins",
              description:
                  "Covers replacement only. Inverter fuse/spare parts sourced separately.",
              imageUrl:
                  'assets/InverterStabilizer/inverter_fuse_replacement.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Inverter Servicing",
              price: "₹139",
              time: "1 hr",
              description:
                  "Covers servicing only. Spare parts sourced separately.",
              imageUrl: 'assets/InverterStabilizer/inverter_servicing.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Inverter Installation",
              price: "₹369",
              time: "1.5 hrs",
              description:
                  "Covers installation only. Spare parts sourced separately.",
              imageUrl: 'assets/InverterStabilizer/inverter_installation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Stabilizer Installation",
              price: "₹119",
              time: "45 mins",
              description:
                  "Covers installation only. Spare parts sourced separately.",
              imageUrl:
                  'assets/InverterStabilizer/stabilizer_installation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Inverter Repair",
              price: "₹210",
              time: "1 hr",
              description:
                  "Covers visit and diagnosis only. Spare parts sourced",
              imageUrl: 'assets/InverterStabilizer/inverter_repair.webp',
              isCustomizable: false,
            ),
          ],
        ),
      ),
    );
  }
}
