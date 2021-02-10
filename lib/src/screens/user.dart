import 'dart:io';

import 'package:Tollway2/src/screens/login.dart';
import 'package:Tollway2/src/widgets/CustomImage.dart';
import 'package:Tollway2/src/widgets/appBg.dart';
import 'package:Tollway2/src/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
File imageFile;

  void _setImage(){
    setState(() {
      _showDialog();
    });
  }

  Widget _buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   'Email',
        //   style: kLabelStyle,
        // ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.account_box,
                color: Colors.white,
              ),
              hintText: 'Name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildText() {
    return Container(
      child: Text(
        'Member No. 00001',
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.0,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          fontFamily: 'OpenSans',
        ),
      ),
    );
  }

  Widget _buildSurname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   'Password',
        //   style: kLabelStyle,
        // ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            // obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.account_box_outlined,
                color: Colors.white,
              ),
              hintText: 'Surname',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBirthday() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   'Password',
        //   style: kLabelStyle,
        // ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            // obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.cake_outlined,
                color: Colors.white,
              ),
              hintText: 'Birthday',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIdCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   'Password',
        //   style: kLabelStyle,
        // ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            // obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.featured_video_outlined,
                color: Colors.white,
              ),
              hintText: 'Id Card',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   'Password',
        //   style: kLabelStyle,
        // ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            // obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.white,
              ),
              hintText: 'Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   'Password',
        //   style: kLabelStyle,
        // ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            // obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.local_phone_outlined,
                color: Colors.white,
              ),
              hintText: 'Phone Number',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCameraBtnRow() {
    return GestureDetector(
      onTap: (){
        this._setImage();
      },
      child: imageFile == null ? Container(
        width: 100.0,
        height: 100.0,
        child: Icon(
          Icons.camera_alt,
          color: Colors.white,
          size: 100.0,
        ),
      ): Container(
        width: 100.0,
        height: 100.0,
        child: Image.file(
          imageFile,
          width: 100.0,
          height: 100.0,
        ),
      )
    );
    // return Padding(
    //     padding: EdgeInsets.symmetric(vertical: 0.0),
    //     child: imageFile == null ? FlatButton(
    //       onPressed: (){
    //         this._setImage();
    //         print('Image file = null');
    //       },
    //       child: Icon(
    //         Icons.camera_alt,
    //         color: Colors.white,
    //         size: 80.0,
    //       ),
    //     ): FlatButton(
    //       onPressed: (){
    //         this._setImage();
    //         print('Image file not null');
    //       },
    //       child: Image.file(
    //         imageFile,
    //         width: 180.0,
    //         height: 180.0,
    //       ),
    //     )
    // );


    // return GestureDetector(
    //   onTap: (){
    //     print('Hello world');
    //   },
    //   child: Container(
    //     width: 70.0,
    //     height: 70.0,
    //     child: Icon(
    //       Icons.camera_alt,
    //       color: Colors.white,
    //       size: 70.0,
    //     ),
    //   ),
    // );
        //FlatButton(onPressed: (){print('Hello world');}, child: Text('Hello world'));
  }

  Widget _buildSaveNew() {
    return Container(
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: () => print('Save New'),
        icon: Icon(Icons.save_outlined),
        color: Colors.white,
        iconSize: 50.0,
      ),
    );
  }

  Widget _buildEdit() {
    return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () => print('Edit'),
        icon: Icon(Icons.edit_outlined),
        color: Colors.white,
        iconSize: 50.0,
      ),
    );
  }

  Widget _buildSaveAndEdit() {
    return Row(
      children: <Widget>[
        _buildEdit(),
        Spacer(flex: 2),
        _buildSaveNew(),
      ],
    );
  }

  Widget _buildLogout() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          _checkLogout();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          // side: BorderSide(color: Colors.grey, width: 3)
        ),
        color: Colors.white,
        child: Text(
          'LOGOUT',
          style: TextStyle(
            color: Colors.purple[800],
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
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
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildCameraBtnRow(),
                      SizedBox(height: 20.0),
                      _buildText(),
                      SizedBox(height: 15.0,),
                      _buildName(),
                      SizedBox(height: 10.0,),
                      _buildSurname(),
                      SizedBox(height: 10.0),
                      _buildBirthday(),
                      SizedBox(height: 10.0),
                      _buildIdCard(),
                      SizedBox(height: 10.0),
                      _buildEmail(),
                      SizedBox(height: 10.0),
                      _buildPhoneNumber(),
                      SizedBox(height: 10.0),
                      _buildSaveAndEdit(),
                      SizedBox(height: 10.0),
                      _buildLogout(),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog() {
    return showDialog(
        context: context,
        // ignore: non_constant_identifier_names
        builder: (BuildContext) {
          return AlertDialog(
            title: Text('You want take a photo from?'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  SizedBox(
                    height: 5.0,
                  ),
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      openCamera();
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Padding(padding: EdgeInsets.only(top: 0.0)),
                  GestureDetector(
                    child: Text('Gallary'),
                    onTap: () {
                      openGallery();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> openGallery() async {
    // ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
  }

  Future<void> openCamera() async {
    // ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
  }

  void _checkLogout(){
    // if(GoogleAuth().getCurrentUser() != null){
    //   if(GoogleAuth().signOutGoogle() == true){
    //     print('Google Logout Completed');
    //     Navigator.of(context)
    //         .push(
    //         MaterialPageRoute(builder: (context) => LoginScreen())
    //     );
    //   } else {
    //     print('Google Logout Failed');
    //   }
    // } else {
    //   print('Google Logout = null');
    // }
    // GoogleAuth().signOutGoogle();
    Navigator.of(context)
        .push(
        MaterialPageRoute(builder: (context) => LoginScreen())
    );
  }
}

class UserScreen2 extends StatelessWidget {
  Widget nameField(){
    return Container(
      alignment: Alignment.centerLeft,
      child: TextField(
        obscureText: true,
        style: TextStyle(
          color: Colors.black,
          //fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          hintText: 'Name',
          hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23),
              borderSide: BorderSide(
                width: 3,
              )
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 20.0,top: 14.0),
          // prefixIcon: Icon(
          //   Icons.lock,
          //   color: Colors.black,
          // ),
        ),
      ),
    );
  }

  Widget surnameField(){
    return Container(
      alignment: Alignment.centerLeft,
      child: TextField(
        obscureText: true,
        style: TextStyle(
          color: Colors.black,
          //fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          hintText: 'Surname',
          hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23),
              borderSide: BorderSide(
                width: 3,
              )
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 20.0,top: 14.0),
          // prefixIcon: Icon(
          //   Icons.lock,
          //   color: Colors.black,
          // ),
        ),
      ),
    );
  }

  Widget birthDayField(){
    return Container(
      alignment: Alignment.centerLeft,
      child: TextField(
        obscureText: true,
        style: TextStyle(
          color: Colors.black,
          //fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          hintText: 'BirthDay',
          hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23),
              borderSide: BorderSide(
                width: 3,
              )
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 20.0,top: 14.0),
          // prefixIcon: Icon(
          //   Icons.lock,
          //   color: Colors.black,
          // ),
        ),
      ),
    );
  }

  Widget citizenIdField(){
    return Container(
      alignment: Alignment.centerLeft,
      child: TextField(
        obscureText: true,
        style: TextStyle(
          color: Colors.black,
          //fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          hintText: 'Citizen Id',
          hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23),
              borderSide: BorderSide(
                width: 3,
              )
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 20.0,top: 14.0),
          // prefixIcon: Icon(
          //   Icons.lock,
          //   color: Colors.black,
          // ),
        ),
      ),
    );
  }

  Widget emailField(){
    return Container(
      alignment: Alignment.centerLeft,
      child: TextField(
        obscureText: true,
        style: TextStyle(
          color: Colors.black,
          //fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23),
              borderSide: BorderSide(
                width: 3,
              )
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 20.0,top: 14.0),
          // prefixIcon: Icon(
          //   Icons.lock,
          //   color: Colors.black,
          // ),
        ),
      ),
    );
  }

  Widget telField(){
    return Container(
      alignment: Alignment.centerLeft,
      child: TextField(
        obscureText: true,
        style: TextStyle(
          color: Colors.black,
          //fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          hintText: 'Tel',
          hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23),
              borderSide: BorderSide(
                width: 3,
              )
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 20.0,top: 14.0),
          // prefixIcon: Icon(
          //   Icons.lock,
          //   color: Colors.black,
          // ),
        ),
      ),
    );
  }

  Widget _logoutBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {

        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          // side: BorderSide(color: Colors.grey, width: 3)
        ),
        color: Colors.purple[400],
        child: Text(
          'LOGOUT',
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 20.0,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  print('Hello world');
                },
                child: CustomImage(
                  width: 100.0,
                  height: 100.0,
                  margin: 20,
                  image_path: 'assets/icons/user.png',
                ),
              ),
              Text(
                'Member No.24569',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20,),
              nameField(),
              SizedBox(height: 20,),
              surnameField(),
              SizedBox(height: 20,),
              birthDayField(),
              SizedBox(height: 20,),
              citizenIdField(),
              SizedBox(height: 20,),
              emailField(),
              SizedBox(height: 20,),
              telField(),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    CustomImage(
                      width: 32.0,
                      height: 32.0,
                      margin: 10,
                      image_path: 'assets/icons/edit.png',
                    ),
                    Spacer(flex: 2),
                    CustomImage(
                      width: 32.0,
                      height: 32.0,
                      margin: 10,
                      image_path: 'assets/icons/update.png',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              _logoutBtn()
            ],
          ),
        )
      ),
    );
  }
}