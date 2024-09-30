import 'package:flutter/material.dart';
import 'package:uoons_services/ServiceCards.dart';

class WashingMachineServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Washing Machine Services"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceCard(
              title: "Washing machine Installation",
              price: "₹160",
              time: "-",
              description:
                  "Covers installation only. Spare parts sourced separately.",
              imageUrl: 'assets/microwave/not_heating.jpg',
              isCustomizable: true,
              customizationOptions: [
                "Top Load (Fully automatic) Checkup",
                "Front Load (Fully Automatic) Checkup",
                "Semi-automatic"
              ],
            ),
            ServiceCard(
              title: "Washing machine Uninstallation",
              price: "₹160",
              time: "-",
              description:
                  "Covers installation only. Smart switche/spare parts sourced separately.",
              imageUrl: 'assets/microwave/not_heating.jpg',
              isCustomizable: true,
              customizationOptions: [
                "Top Load (Fully automatic) Checkup",
                "Front Load (Fully Automatic) Checkup",
                "Semi-automatic"
              ],
            ),
            ServiceCard(
              title: "No Power",
              price: "₹160",
              time: "-",
              description: "Smart switche/spare parts sourced separately.",
              imageUrl: 'assets/microwave/not_heating.jpg',
              isCustomizable: true,
              customizationOptions: [
                "Top Load (Fully automatic) Checkup",
                "Front Load (Fully Automatic) Checkup",
                "Semi-automatic"
              ],
            ),
            ServiceCard(
              title: "Noise Issue",
              price: "₹160",
              time: "-",
              description:
                  "Covers installation only. Smart spare parts sourced separately.",
              imageUrl: 'assets/microwave/not_heating.jpg',
              isCustomizable: true,
              customizationOptions: [
                "Top Load (Fully automatic) Checkup",
                "Front Load (Fully Automatic) Checkup",
                "Semi-automatic"
              ],
            ),
            ServiceCard(
              title: "Not Washing/spinning",
              price: "₹160",
              time: "-",
              description: "Description for Not Washing/spinning",
              imageUrl: 'assets/microwave/not_heating.jpg',
              isCustomizable: true,
              customizationOptions: [
                "Top Load (Fully automatic) Checkup",
                "Front Load (Fully Automatic) Checkup",
                "Semi-automatic"
              ],
            ),
            ServiceCard(
              title: "Water Leakage from Drain",
              price: "₹160",
              time: "-",
              description:
                  "Covers installation only. Smart switche/spare parts sourced separately.",
              imageUrl: 'assets/microwave/not_heating.jpg',
              isCustomizable: true,
              customizationOptions: [
                "Top Load (Fully automatic) Checkup",
                "Front Load (Fully Automatic) Checkup",
                "Semi-automatic"
              ],
            ),
            ServiceCard(
              title: "Error on Machine Display",
              price: "₹160",
              time: "-",
              description:
                  "Covers installation only. Smart switche/spare parts sourced separately.",
              imageUrl: 'assets/microwave/not_heating.jpg',
              isCustomizable: true,
              customizationOptions: [
                "Top Load (Fully automatic) Checkup",
                "Front Load (Fully Automatic) Checkup",
                "Semi-automatic"
              ],
            ),
            ServiceCard(
              title: "Spin Tub Not Working (Semi - Automatic)",
              price: "₹160",
              time: "-",
              description:
                  " â€¢ Price includes visit & diagnosis charge only â€¢ Spare part charges are extra as per rate card",
              imageUrl: 'assets/microwave/not_heating.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
