import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/widgets/frosted_glass_box.dart';

class SmartDeviceBoxWidget extends StatelessWidget {
  const SmartDeviceBoxWidget(
      {super.key, required this.deviceData, required this.toggleSwitch});

  final deviceData;
  final Function(bool)? toggleSwitch;

  @override
  Widget build(BuildContext context) {
    return FrostedGlassBox(
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
                    deviceData[0],
                    style: const TextStyle(
                      color: Color(0xFFb3b3b3),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                  ),
                )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: CupertinoSwitch(
                      value: deviceData[1],
                      onChanged: toggleSwitch,
                      activeColor: const Color(0xFF2566e8),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
