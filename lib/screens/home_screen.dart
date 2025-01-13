import 'package:flutter/material.dart';
import 'package:smart_home/widgets/smart_area_box_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Padding constants
  static const horizontalPadding = 35.0;

  // List of Smart Devices
  List mySmartDevices = [
    ["Living Room", 4],
    ["Bed Room", 2],
    ["Kitchen", 3],
    ["Bath Room", 1],
    ["Office", 5],
    ["Garage", 2],
    ["Dining Room", 4],
    ["Roof Top", 1]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color(0xFF231877),
              Color(0xFF000000),
            ],
            stops: [0.0, 1.0],
            center: Alignment.topLeft,
            radius: 1.0,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom App Bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.bolt_sharp,
                      size: 50,
                      color: Colors.grey[200],
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //Text Widget
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.grey[200],
                            fontWeight: FontWeight.w300)),
                    Text(
                      "Danula",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              // Smart Devices Grid
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "My Devices (${mySmartDevices.length})",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Colors.grey[300]),
                  ),
                ),
              ),

              Expanded(
                  child: GridView.builder(
                itemCount: mySmartDevices.length,
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.1),
                itemBuilder: (context, index) {
                  return SmartAreaBoxWidget(
                    areaId: index,
                    areaName: mySmartDevices[index][0],
                    noDevices: mySmartDevices[index][1],
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
