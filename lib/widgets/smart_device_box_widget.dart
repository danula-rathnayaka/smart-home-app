import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/screens/device_data_screen.dart';
import 'package:smart_home/widgets/frosted_glass_box.dart';

class SmartDeviceBoxWidget extends StatefulWidget {
  const SmartDeviceBoxWidget({super.key, this.deviceData, this.toggleSwitch});

  final deviceData;
  final Function(bool)? toggleSwitch;

  @override
  State<SmartDeviceBoxWidget> createState() => _SmartDeviceBoxWidgetState();
}

class _SmartDeviceBoxWidgetState extends State<SmartDeviceBoxWidget> {

  @override
  Widget build(BuildContext context) {
    return FrostedGlassBox(
      isSmartDeviceActive: widget.deviceData[1],
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      widget.deviceData[0],
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: CupertinoSwitch(
                        value: widget.deviceData[1],
                        onChanged: widget.toggleSwitch,
                        activeColor: const Color(0xFF2566e8),
                      ))
                ],
              ),
            ),
            InkWell(
              onTap: () => setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DeviceDataScreen(),));
              }),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("More", style: TextStyle(color: Colors.white.withOpacity(0.3)),),
                    Icon(Icons.arrow_right,
                      color: Colors.white.withOpacity(0.3),
                      size: 25,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
