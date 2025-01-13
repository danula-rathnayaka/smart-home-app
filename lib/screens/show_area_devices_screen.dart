import 'package:flutter/material.dart';
import 'package:smart_home/widgets/smart_device_box_widget.dart';

class ShowAreaDevicesScreen extends StatefulWidget {
  const ShowAreaDevicesScreen({super.key, required this.areaId});

  final int areaId;

  @override
  State<ShowAreaDevicesScreen> createState() => _ShowAreaDevicesScreenState();
}

class _ShowAreaDevicesScreenState extends State<ShowAreaDevicesScreen> {
  static const horizontalPadding = 35.0;

  List mySmartDevices = [
    [
      "Living Room",
      4,
      [
        ["Smart TV", true], // true means "on"
        ["Smart Light", false], // false means "off"
        ["Smart Speaker", true],
        ["Smart Thermostat", false],
      ]
    ],
    [
      "Bed Room",
      2,
      [
        ["Smart Light", true],
        ["Smart Alarm", false],
      ]
    ],
    [
      "Kitchen",
      3,
      [
        ["Smart Fridge", true],
        ["Smart Oven", false],
        ["Smart Light", true],
      ]
    ],
    [
      "Bath Room",
      1,
      [
        ["Smart Mirror", false],
      ]
    ],
    [
      "Office",
      5,
      [
        ["Smart Desk", true],
        ["Smart Light", false],
        ["Smart Speaker", true],
        ["Smart Printer", false],
        ["Smart Thermostat", true],
      ]
    ],
    [
      "Garage",
      2,
      [
        ["Smart Door Opener", true],
        ["Smart Light", false],
      ]
    ],
    [
      "Dining Room",
      4,
      [
        ["Smart Light", true],
        ["Smart Speaker", false],
        ["Smart Table", true],
        ["Smart Thermostat", false],
      ]
    ],
    [
      "Roof Top",
      1,
      [
        ["Smart Weather Station", true],
      ]
    ],
  ];

  toggleSwitch(value, id) {
    mySmartDevices[id] = value;
  }

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
            center: Alignment.topRight,
            radius: 1.0,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white.withOpacity(0.7),
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Navigate back when pressed
                  },
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //Text Widget
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${mySmartDevices[widget.areaId][0]}",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.grey[200],
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${mySmartDevices[widget.areaId][1]} device${mySmartDevices[widget.areaId][1] == 1 ? '' : 's'}",
                      style: TextStyle(fontSize: 25, color: Colors.grey[200]),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              Expanded(
                  child: GridView.builder(
                      itemCount: mySmartDevices[widget.areaId][2].length,
                      padding: const EdgeInsets.all(5),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, childAspectRatio: 1 / 0.35),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SmartDeviceBoxWidget(
                              deviceData: mySmartDevices[widget.areaId][2]
                                  [index],
                              toggleSwitch: (value) => setState(() {
                                    mySmartDevices[widget.areaId][2][index][1] =
                                        value;
                                  })),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
