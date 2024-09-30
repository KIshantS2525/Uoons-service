import 'package:flutter/material.dart';
import 'package:uoons_services/ServiceCards.dart';

class ACServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AC Services"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceCard(
              title: "AC Installation",
              price: "₹500",
              time: "45 mins",
              description:
                  "Installation of indoor & outdoor units with free gas check. Procurement of spare parts (at extra cost)",
              imageUrl: 'assests/AC/installation ac.webp',
              isCustomizable: true,
              customizationOptions: ["Split", "Window"],
            ),
            ServiceCard(
              title: "AC Uninstallation",
              price: "₹300",
              time: "30 mins",
              description: "Uninstallation of both indoor & outdoor units",
              imageUrl: 'assests/AC/unistallation ac.webp',
              isCustomizable: true,
              customizationOptions: ["Split", "Window"],
            ),
            ServiceCard(
              title: "AC Repair",
              price: "₹400",
              time: "1 hr",
              description:
                  "Detailed issue diagnosis with same day resolution, Visit charges of Rs. 299 will be adjusted in the final bill",
              imageUrl: 'assests/AC/Ac repair.webp',
              isCustomizable: true,
              customizationOptions: ["Split", "Window"],
            ),
            ServiceCard(
              title: "AC Gas Leak Fix & Refill",
              price: "₹600",
              time: "1.5 hrs",
              description:
                  "Installation of indoor & outdoor units with free gas check Procurement of spare parts (at extra cost)",
              imageUrl: 'assests/AC/Gas leak.webp',
              isCustomizable: true,
              customizationOptions: ["Split", "Window"],
            ),
            ServiceCard(
              title: "Power Saver AC Service",
              price: "₹450",
              time: "1 hr",
              description:
                  "â€¢ Advanced Foam-jet technology Deep jet cleaning of outdoor unit",
              imageUrl: 'assests/AC/power save.webp',
              isCustomizable: true,
              customizationOptions: ["Split", "Window"],
            ),
            ServiceCard(
              title: "Anti-rust Deep Clean AC Service",
              price: "₹550",
              time: "1 hr 15 mins",
              description:
                  "â€¢ Prevents frequent gas leakages through a unique anti-rust spray Applicable on both split and window Acs",
              imageUrl: 'assests/AC/anti rust deep clean.webp',
              isCustomizable: true,
              customizationOptions: ["Split", "Window"],
            ),
          ],
        ),
      ),
    );
  }
}
