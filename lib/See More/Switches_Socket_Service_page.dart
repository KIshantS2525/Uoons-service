import 'package:flutter/material.dart';
import 'package:uoons_services/ServiceCards.dart';

class SwitchesSocketsServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switches and Sockets Services"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceCard(
              title: "Switchbox Installation (15+ Amp)",
              price: "₹239",
              time: "45 mins",
              description:
                  "Covers installation only. Switchbox/spare parts sourced separately.",
              imageUrl: 'assets/SwitchesSockets/switchbox_installation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Switch/Socket Replacement",
              price: "₹49",
              time: "20 mins",
              description:
                  "Covers replacement only. Switchbox/spare parts sourced separately.",
              imageUrl: 'assets/SwitchesSockets/switch_socket_replacement.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "AC Switchbox Installation",
              price: "₹249",
              time: "1 hr",
              description:
                  "Covers installation only. Switchbox/spare parts sourced separately.",
              imageUrl: 'assets/SwitchesSockets/ac_switchbox_installation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Switchboard Installation",
              price: "₹169",
              time: "30 mins",
              description:
                  "Covers installation only. Switchbox/spare parts sourced separately.",
              imageUrl: 'assets/SwitchesSockets/switchboard_installation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Switchboard/Switchbox Repair",
              price: "₹79",
              time: "30 mins",
              description:
                  "Covers installation only. Switchbox/spare parts sourced separately.",
              imageUrl: 'assets/SwitchesSockets/switchboard_repair.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Modular Retrofit Smart Switches",
              price: "₹119",
              time: "45 mins",
              description:
                  "Covers installation only. Switchbox/spare parts sourced separately.",
              imageUrl: 'assets/SwitchesSockets/smart_switches.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Smart Appliance Controller",
              price: "₹179",
              time: "1 hr",
              description:
                  "Cover replacement only. Switchbox/spare parts sourced separately.",
              imageUrl:
                  'assets/SwitchesSockets/smart_appliance_controller.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Converter Retrofit Wi-Fi Smart",
              price: "₹179",
              time: "1 hr",
              description:
                  "Covers installation only. Smart switche/spare parts sourced separately.",
              imageUrl: 'assets/SwitchesSockets/wifi_smart_converter.webp',
              isCustomizable: false,
            ),
          ],
        ),
      ),
    );
  }
}
