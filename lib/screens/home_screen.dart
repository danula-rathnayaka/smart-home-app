import 'package:firebase_database/firebase_database.dart';
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

  late DatabaseReference _database;

  @override
  void initState() {
    super.initState();

    _database = FirebaseDatabase.instance.ref().child("area");
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

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "My Devices",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Colors.grey[300]),
                  ),
                ),
              ),

              StreamBuilder(
                stream: _database.onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  if (!snapshot.hasData) {
                    return Text('No data available');
                  }

                  Map<dynamic, dynamic> data =
                      snapshot.data!.snapshot.value as Map;

                  List<List<dynamic>> roomData = [];

                  data.forEach((key, value) {
                    if (value is Map &&
                        value.containsKey('roomName') &&
                        value.containsKey('devices')) {
                      roomData.add(
                          [key, value['roomName'], value['devices'].keys.length]);
                    }
                  });

                  return Expanded(
                      child: GridView.builder(
                    itemCount: roomData.length,
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.1),
                    itemBuilder: (context, index) {
                      return SmartAreaBoxWidget(
                        areaId: roomData[index][0],
                        areaName: roomData[index][1],
                        noDevices: roomData[index][2],
                      );
                    },
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
