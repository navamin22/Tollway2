import 'package:Tollway2/src/screens/qr_code.dart';
import 'package:Tollway2/src/widgets/CustomImage.dart';
import 'package:Tollway2/src/widgets/appBg.dart';
import 'package:Tollway2/src/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PromotionsScreen extends StatefulWidget {
  @override
  _PromotionsScreenState createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {
  // void couponClick() => print("Clicked");
  void couponClick() {
    _showDialog();
  }

  Widget _buildCardBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Clicked'),
        padding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            CustomImage(
              width: 150.0,
              height: 80.0,
              margin: 0,
              image_path: 'assets/images/krungthai.png',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton.icon(
        elevation: 5.0,
        // onPressed: () => print('Clicked'),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => QrCodeScreen()));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        icon: Icon(
          Icons.qr_code,
          size: 45.0,
          color: Colors.black,
        ),
        label: Text(
          'QR Code',
          style: TextStyle(
            color: Colors.purple[400],
            letterSpacing: 1.5,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
        // child: Text(
        //   'QR Code',
        //   style: TextStyle(
        //     color: Colors.purple[400],
        //     letterSpacing: 1.5,
        //     fontSize: 20.0,
        //     fontWeight: FontWeight.bold,
        //     fontFamily: 'OpenSans'
        //   ),
        // ),
      ),
    );
  }

  Future<void> _showDialog() {
    return showDialog(
        context: context,
        // ignore: non_constant_identifier_names
        builder: (BuildContext) {
          final mq = MediaQuery.of(context);

          return CustomAlertDialog(
            content: Container(
              width: mq.size.width / 1.2,
              height: mq.size.height / 2.5,
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Text(
                    'เลือกช่องทางการชำระเงิน',
                    style: TextStyle(
                      color: Colors.purple[400],
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  _buildCardBtn(),
                  _buildQrBtn(),
                ],
              ),
            ),
          );
        });
  }

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
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        CustomImage(
                          width: 150.0,
                          height: 150.0,
                          margin: 0.0,
                          image_path: 'assets/logos/logo_changed.png',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Promotions",
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                          child: ConstrainedBox(
                            constraints:
                                const BoxConstraints(minWidth: double.infinity),
                            child: RaisedButton(
                              elevation: 15.0,
                              padding: EdgeInsets.all(15.0),
                              onPressed: couponClick,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                //side: BorderSide(color: Colors.purple, width: 2)
                              ),
                              color: Colors.purple[300],
                              child: Text(
                                "คูปอง ฿2000 ชำระ ฿1850",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: ConstrainedBox(
                            constraints:
                                const BoxConstraints(minWidth: double.infinity),
                            child: RaisedButton(
                              elevation: 15.0,
                              padding: EdgeInsets.all(15.0),
                              onPressed: couponClick,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                //side: BorderSide(color: Colors.purple, width: 2)
                              ),
                              color: Colors.purple[300],
                              child: Text(
                                "คูปอง ฿1500 ชำระ ฿1400",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: ConstrainedBox(
                            constraints:
                                const BoxConstraints(minWidth: double.infinity),
                            child: RaisedButton(
                              elevation: 15.0,
                              padding: EdgeInsets.all(15.0),
                              onPressed: couponClick,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                // side: BorderSide(color: Colors.purple, width: 2)
                              ),
                              color: Colors.purple[300],
                              child: Text(
                                "คูปอง ฿500 ชำระ ฿400",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
