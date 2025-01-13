import 'package:flutter/material.dart';

class DeviceDataScreen extends StatelessWidget {
  const DeviceDataScreen({super.key});

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
          center: Alignment.topCenter,
          radius: 1.0,
        )),
      ),
    );
  }
}
