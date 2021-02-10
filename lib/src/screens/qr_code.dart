import 'package:Tollway2/src/widgets/CustomImage.dart';
import 'package:flutter/material.dart';

class QrCodeScreen extends StatefulWidget {
  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  //
  Widget _buildSaveQrCodeBtn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
        ),
        child: RaisedButton(
          elevation: 15.0,
          padding: EdgeInsets.all(15.0),
          onPressed: () => print('QR Code'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            //side: BorderSide(color: Colors.purple, width: 2)
          ),
          color: Colors.purple[300],
          child: Text(
            "บันทึกภาพ QR Code",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextQrCode() {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text(
              'นำ QR Code ไปชำระเงินผ่าน',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
          Text(
            'Mobile Banking ได้ทุกธนาคาร',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'OpenSans',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: Text('QR Code สำหรับชำระเงิน'),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              SizedBox(height: 50.0),
              Container(
                child: CustomImage(
                  width: double.infinity,
                  height: 200,
                  margin: 5.0,
                  image_path: 'assets/images/qrcode.png',
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'Member No.24569',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.purple[400],
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                '1,850 บาท',
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.purple[600],
                    fontFamily: 'OpenSans'),
              ),
              SizedBox(height: 150),
              _buildSaveQrCodeBtn(),
              _buildTextQrCode(),
              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 25.0),
              //   width: double.infinity,
              //   child: RaisedButton(
              //     elevation: 15.0,
              //     onPressed: () => print('Yes'),
              //     padding: EdgeInsets.all(20),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15),
              //     ),
              //     color: Colors.purple[400],
              //     child: Text(
              //       'บันทึกภาพ QR Code',
              //       style: TextStyle(
              //         color: Colors.white,
              //         letterSpacing: 1,
              //         fontSize: 20.0,
              //         fontWeight: FontWeight.bold,
              //         fontFamily: 'OpenSans',
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
