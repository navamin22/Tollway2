import 'package:Tollway2/src/widgets/CustomImage.dart';
import 'package:flutter/material.dart';

class LuckyDrawScreen extends StatefulWidget {
  @override
  _LuckyDrawScreenState createState() => _LuckyDrawScreenState();
}

class _LuckyDrawScreenState extends State<LuckyDrawScreen> {
  bool _accept = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[300],
          title: Text('Lucky Draw'),
        ),
        body: Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    child: CustomImage(
                      width: double.infinity,
                      margin: 5.0,
                      image_path: 'assets/images/magazine.jpg',
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, spreadRadius: 1)
                        ]),
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text(
                              'เงื่อนไขกิจกรรม',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                              child: Text(
                            'รายละเอียด',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),
                          Container(
                            alignment: Alignment.bottomLeft,
                            width: double.infinity,
                            margin: EdgeInsets.only(
                              bottom: 15.0,
                              top: 15.0,
                            ),
                            child: _buildAcceptCheckbox(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: _buildAcceptBtn(),
                      ),
                      Expanded(child: _buildDeclineBtn())
                    ],
                  )
                ],
              ),
            )));
  }

  Widget _buildAcceptCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black),
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
          Text(
            'ยอมรับเงื่อนไขกิจกรรม',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAcceptBtn() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      margin: EdgeInsets.only(left: 20.0, top: 20.0),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {},
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          // side: BorderSide(color: Colors.grey, width: 3)
        ),
        color: Colors.purple[800],
        child: Text(
          'ยืนยัน',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildDeclineBtn() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      margin: EdgeInsets.only(right: 20.0, top: 20.0),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {},
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          // side: BorderSide(color: Colors.grey, width: 3)
        ),
        color: Colors.redAccent,
        child: Text(
          'ยกเลิก',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
