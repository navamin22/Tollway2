import 'package:Tollway2/src/widgets/CustomImage.dart';
import 'package:Tollway2/src/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class AddPaymentCards extends StatefulWidget {
  @override
  _AddPaymentCardsState createState() => _AddPaymentCardsState();
}

class _AddPaymentCardsState extends State<AddPaymentCards> {
  bool _accept = false;

  Widget _buildAcceptCheckbox() {
    return Container(
      height: 20.0,
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.grey),
            child: Checkbox(
              value: _accept,
              checkColor: Colors.white,
              activeColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  _accept = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreditNumber() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      height: 70.0,
      child: TextField(
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          labelText: 'หมายเลขบัตรเครดิต/เดบิต',
          filled: true,
          fillColor: Colors.white,
          // contentPadding: EdgeInsets.only(top: 14.0),
        ),
      ),
    );
  }

  Widget _buidDeadlineAndCvv() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextField(
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                labelText: 'วันหมดอายุ',
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  //padding: EdgeInsets.only(top: 5.0),
                  onPressed: ( ) {
                    _dayDialog();
                  },
                  icon: Image.asset(
                    "assets/icons/help_outline.png",
                    width: 24.0,
                    height: 24.0,
                    color: Colors.purple[700],
                  ),
                ),
              ),
            ),
          )),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextField(
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                labelText: 'CCV/CVV',
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  //padding: EdgeInsets.only(top: 5.0),
                  onPressed: () {
                    _ccvDialog();
                  },
                  icon: Image.asset(
                    "assets/icons/help_outline.png",
                    width: 24.0,
                    height: 24.0,
                    color: Colors.purple[700],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildNameCreditCard() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      height: 70.0,
      child: TextField(
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          labelText: 'ชื่อบนบัตร(ภาษาอังกฤษ)',
          filled: true,
          fillColor: Colors.white,
          // contentPadding: EdgeInsets.only(top: 14.0),
        ),
      ),
    );
  }

  Widget _buildAcceptRequest() {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          _buildAcceptCheckbox(),
          Container(
            child: Flexible(
              child: Text(
                'ข้าพเจ้าได้อ่านเเละตกลงยอมรับเงื่อนไขการให้บริการเเละนโยบายคุ้มครองข้อมูลส่วนบุคคลของเเอปพลิเคชั่น',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmBtn() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: RaisedButton(
          padding: EdgeInsets.all(15.0),
          onPressed: () {},
          child: Text(
            "ยืนยันการเพิ่มบัตรเครดิต/เดบิต",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: Colors.purple[400],
          textColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSubmitBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        // onPressed: () => print('Clicked'),
        onPressed: () {
          Navigator.of(context).pop(context);
        },
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.purple[400],
        child: Text(
          'ตกลง',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: Text('เพิ่มบัตรเครดิต/เดบิต'),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 20.0,
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomImage(
                    width: 40.0,
                    height: 40.0,
                    margin: 5.0,
                    image_path: 'assets/images/visa_logo.png',
                  ),
                  CustomImage(
                    width: 40.0,
                    height: 40.0,
                    margin: 5.0,
                    image_path: 'assets/images/mastercard_logo.png',
                  ),
                  CustomImage(
                    width: 40.0,
                    height: 40.0,
                    margin: 5.0,
                    image_path: 'assets/images/jcb_logo.png',
                  ),
                ],
              ),
              _buildCreditNumber(),
              _buidDeadlineAndCvv(),
              SizedBox(height: 10.0),
              _buildNameCreditCard(),
              _buildAcceptRequest(),
              _buildConfirmBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _ccvDialog() {
    return showDialog(
        context: context,
        // ignore: non_constant_identifier_names
        builder: (BuildContext) {
          final mq = MediaQuery.of(context);

          return CustomAlertDialog(
            content: Container(
              width: mq.size.width / 1.2,
              height: mq.size.height / 2.7,
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  CustomImage(
                    width: 100.0,
                    height: 100.0,
                    margin: 0,
                    image_path: 'assets/images/cvv1.png',
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'เลข CCV/CVV',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.purple[600],
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'รหัสตัวเลขหลังบัตร 3 หลัก',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black45,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'ทางด้านขวาของแถบลายเซ็น',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black45,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(height: 5),
                  _buildSubmitBtn(),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _dayDialog() {
    return showDialog(
        context: context,
        // ignore: non_constant_identifier_names
        builder: (BuildContext) {
          final mq = MediaQuery.of(context);

          return CustomAlertDialog(
            content: Container(
              width: mq.size.width / 1.2,
              height: mq.size.height / 2.7,
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  CustomImage(
                    width: 100.0,
                    height: 100.0,
                    margin: 0,
                    image_path: 'assets/images/daycards1.png',
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'วันหมดอายุ',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.purple[600],
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'เลขวันหมดอายุของบัตรสามารถดู',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black45,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'ได้ที่ใต้เลขบัตรตามตัวออย่างด้านบน',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black45,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(height: 5),
                  _buildSubmitBtn(),
                ],
              ),
            ),
          );
        });
  }

  // void ccvDialog() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Dialog(
  //           child: Stack(
  //               alignment: Alignment.topCenter,
  //               // ignore: deprecated_member_use
  //               overflow: Overflow.visible,
  //               children: <Widget>[
  //                 Container(
  //                   height: 250,
  //                   child: Padding(
  //                     padding: EdgeInsets.all(8.0),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: <Widget>[],
  //                     ),
  //                   ),
  //                 ),
  //                 Positioned(
  //                     top: -50,
  //                     child: CircleAvatar(
  //                       child: ClipRRect(
  //                         //child: CustomImage(width: 50, height: 50, margin: 0, image_path: 'assets/icons/barcode.png',),
  //                         child: Icon(
  //                           Icons.qr_code_scanner,
  //                           color: Colors.white,
  //                           size: 50,
  //                         ),
  //                       ),
  //                       radius: 45,
  //                       backgroundColor: Colors.purple[800],
  //                     ))
  //               ]),
  //         );
  //       });
  // }
}
