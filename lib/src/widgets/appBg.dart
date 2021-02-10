import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFBA68C8),
            Color(0xFFAB47BC),
            Color(0xFF9C27B0),
            Color(0xFF8E24AA),
          ],
          stops: [0.1, 0.4, 0.7, 0.9],
        ),
      ),
    );
  }
}