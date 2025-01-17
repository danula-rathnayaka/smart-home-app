import 'package:flutter/material.dart';
import 'package:smart_home/screens/show_area_devices_screen.dart';
import 'package:smart_home/widgets/frosted_glass_box.dart';

class SmartAreaBoxWidget extends StatelessWidget {
  const SmartAreaBoxWidget(
      {super.key,  required this.areaId, required this.areaName, required this.noDevices});

  final dynamic areaId;
  final String areaName;
  final int noDevices;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: FrostedGlassBox(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        areaName,
                        style: const TextStyle(
                          color: Color(0xFFb3b3b3),
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                      ),
                    )),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$noDevices",
                        style: const TextStyle(
                            color: Color(0xFFb3b3b3),
                            fontWeight: FontWeight.bold,
                            fontSize: 32),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "device${noDevices == 1 ? '' : 's'}",
                            style: const TextStyle(
                                color: Color(0xFFb3b3b3),
                                fontWeight: FontWeight.normal,
                                fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white.withOpacity(0.3),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowAreaDevicesScreen(areaId: areaId,)));
        },
      ),
    );
  }
}
