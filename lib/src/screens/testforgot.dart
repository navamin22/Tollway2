import 'package:flutter/material.dart';

class TestForgotScreen extends StatefulWidget {
  @override
  _TestForgotScreenState createState() => _TestForgotScreenState();
}

class _TestForgotScreenState extends State<TestForgotScreen> {
  GlobalKey<FormState> _key = GlobalKey();
  // ignore: unused_field
  bool _validate = false;
  String name, email, mobile;

  @override
  Widget build(BuildContext context) {
    var form = Form(
      key: _key,
      autovalidateMode: AutovalidateMode.always,
      child: FormUI(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('TestFotgot'),
        backgroundColor: Colors.purple[300],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: form,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget FormUI() {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(hintText: 'Full Name'),
          maxLength: 32,
          validator: validateName,
          onSaved: (String val) {
            name = val;
          },
        ),
        TextFormField(
          decoration: InputDecoration(hintText: 'Mobile Name'),
          keyboardType: TextInputType.phone,
          maxLength: 10,
          validator: validateMobile,
          onSaved: (String val) {
            mobile = val;
          },
        ),
        TextFormField(
          decoration: InputDecoration(hintText: 'Email ID'),
          keyboardType: TextInputType.emailAddress,
          maxLength: 32,
          validator: validateEmail,
          onSaved: (String val) {
            email = val;
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        RaisedButton(
          onPressed: _sendToServer,
          child: Text('Send'),
        )
      ],
    );
  }

  String validateName(String value) {
    String patttern = r'(^[a-zA-Z]*$)';
    RegExp regExp = RegExp(patttern);
    if (value.length == 0) {
      return 'Name is Required';
    } else if (!regExp.hasMatch(value)) {
      return 'Name must be a-z and A-Z';
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(patttern);
    if (value.length == 0) {
      return 'mobile is Required';
    } else if (value.length != 10) {
      return 'Mobile number must 10 digits';
    } else if (!regExp.hasMatch(value)) {
      return 'MOBILE MUST BE DIGITS';
    }
    return null;
  }

  String validateEmail(String value) {
    String patttern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(patttern);
    if (value.length == 0) {
      return 'Email is Required';
    } else if (!regExp.hasMatch(value)) {
      return 'Invalid Email';
    }
    return null;
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      print('Name $name');
      print('Mobile $mobile');
      print('Email $email');
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}
