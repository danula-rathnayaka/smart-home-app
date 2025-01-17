import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/widgets/smart_device_box_widget.dart';

class ShowAreaDevicesScreen extends StatefulWidget {
  const ShowAreaDevicesScreen({super.key, required this.areaId});

  final dynamic areaId;

  @override
  State<ShowAreaDevicesScreen> createState() => _ShowAreaDevicesScreenState();
}

class _ShowAreaDevicesScreenState extends State<ShowAreaDevicesScreen> {
  static const horizontalPadding = 35.0;

  late DatabaseReference _databaseAreaData;

  @override
  void initState() {
    super.initState();

    _databaseAreaData =
        FirebaseDatabase.instance.ref().child("area").child(widget.areaId);
  }

  toggleSwitch(key, value) {
    _databaseAreaData.child('devices').update({key: value});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _databaseAreaData.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map data = snapshot.data?.snapshot.value as Map;

            List<List<dynamic>> roomDevices = [];

            data["devices"].forEach(
              (key, value) {
                roomDevices.add([key, value]);
              },
            );

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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white.withOpacity(0.7),
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(
                                context); // Navigate back when pressed
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: horizontalPadding, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data["roomName"],
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.grey[200],
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "${data['devices'].keys.length} devices",
                              style: TextStyle(
                                  fontSize: 25, color: Colors.grey[200]),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Expanded(
                          child: GridView.builder(
                              itemCount: roomDevices.length,
                              padding: const EdgeInsets.all(5),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 1 / 0.35),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SmartDeviceBoxWidget(
                                      deviceData: roomDevices[index],
                                      toggleSwitch: (value) => setState(() {toggleSwitch(roomDevices[index][0], value);})),
                                );
                              }))
                    ],
                  ),
                ),
              ),
            );
          }
          return Text("Invalid data entered");
        });
  }
}
