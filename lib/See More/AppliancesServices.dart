import 'package:flutter/material.dart';
import 'package:uoons_services/ServiceCards.dart';

class AppliancesServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appliances"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceCard(
              title: "Geyser Installation",
              price: "₹399",
              time: "1 hr",
              description:
                  "Covers installation only. Spare parts sourced separately.",
              imageUrl: 'assets/Services/geyser_installation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "TV Installation",
              price: "₹379",
              time: "45 mins",
              description: "Covers installation of 1 TV unit only. Spare parts",
              imageUrl: 'assets/Services/tv_installation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "TV Uninstallation",
              price: "₹139",
              time: "30 mins",
              description: "Covers uninstallation only. Spare parts sourced",
              imageUrl: 'assets/Services/tv_uninstallation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "WiFi CCTV Installation",
              price: "₹229",
              time: "1 hr",
              description:
                  "Covers installation only. Spare parts sourced separately.",
              imageUrl: 'assets/Services/wifi_cctv_installation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Room Heater Repair",
              price: "₹219",
              time: "1 hr",
              description:
                  "Covers repair only. Spare parts sourced separately.",
              imageUrl: 'assets/Services/room_heater_repair.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Home Video Bell Installation",
              price: "₹549",
              time: "1.5 hrs",
              description:
                  "Covers installation only. Spare parts sourced separately.",
              imageUrl: 'assets/Services/home_video_bell_installation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Mixer Grinder Check Up/Repair",
              price: "₹210",
              time: "30 mins",
              description: "Covers visit & diagnosis only. Spare parts sourced",
              imageUrl: 'assets/Services/mixer_grinder_repair.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Mini Home Theater Installation",
              price: "₹239",
              time: "1 hr",
              description:
                  "Covers installation only. Spare parts sourced separately.",
              imageUrl: 'assets/Services/mini_home_theater_installation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "EV Charger Installation (2 Wheeler)",
              price: "₹750",
              time: "2 hrs",
              description:
                  "Covers installation only. Spare parts sourced separately.",
              imageUrl: 'assets/Services/ev_charger_installation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Laptop Updation & Repair",
              price: "₹450",
              time: "1 hr",
              description: "Update and repair services for laptops.",
              imageUrl: 'assets/Services/laptop_updation_repair.webp',
              isCustomizable: false,
            ),
          ],
        ),
      ),
    );
  }
}
