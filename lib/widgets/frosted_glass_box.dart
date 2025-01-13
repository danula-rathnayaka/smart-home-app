import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox(
      {super.key, required this.child, this.isSmartDeviceActive = false});

  final bool isSmartDeviceActive;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Blur
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(),
            ),

            // Gradient
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withOpacity(0.05)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: isSmartDeviceActive
                          ? [
                              const Color(0xFF231877).withOpacity(0.4),
                              const Color(0xFF231877).withOpacity(0.2)
                            ]
                          : [
                              Colors.white.withOpacity(0.005),
                              Colors.white.withOpacity(0.03)
                            ])),
            ),

            // Child
            Center(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
