import 'package:Tollway2/src/widgets/appBg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuyCouponScreen extends StatefulWidget {
  @override
  _BuyCouponScreenState createState() => _BuyCouponScreenState();
}

TextEditingController _textControllerField = TextEditingController();

Widget _coupon() {
  return Row(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 50.0),
        child: Text(
          'คูปอง',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.normal,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
      Container(
        
      ),
      Container(
        margin: EdgeInsets.only(left: 180.0),
        child: Text(
          'บาท',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.normal,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    ],
  );
}

class _BuyCouponScreenState extends State<BuyCouponScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                AppBackground(),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              icon: Icon(Icons.arrow_back),
                              iconSize: 25,
                              color: Colors.white,
                              onPressed: () => Navigator.of(context).pop(true)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'ซื้อคูปอง',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        _coupon(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
