import 'package:Tollway2/src/widgets/CustomImage.dart';
import 'package:flutter/material.dart';


class DialogPayMethod extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) => Container(
    height: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
    ),
    child: Column(
      children: <Widget>[
        CustomImage(width: 150, height: 150, image_path: 'assets/images/logo.png',),
        Text('Payment Method'),
        Text('Hello World'),
        Text('Hello World'),
        Text('Hello World'),
      ],
    ),
  );
}