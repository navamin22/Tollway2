import 'package:Tollway2/src/screens/home.dart';
import 'package:Tollway2/src/screens/register.dart';
import 'package:Tollway2/src/screens/testforgot.dart';
import 'package:Tollway2/src/widgets/CustomImage.dart';
import 'package:Tollway2/src/widgets/appBg.dart';
import 'package:Tollway2/src/widgets/constants.dart';
import 'package:Tollway2/src/widgets/custom_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ignore: unused_field
  // User _firebaseUser;
  bool _rememberMe = false;
  final userController = TextEditingController();
  final passController = TextEditingController();
  // ignore: unused_field
  String _username = "";
  // ignore: unused_field
  String _password = "";
  bool rememberMe = false;
  bool _isHidden = true;
  bool isSignIn = false;
  // ignore: unused_field
  // bool _isFacebookLogin = false;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FacebookLogin _facebookLogin = FacebookLogin();
  // ignore: unused_field
  // User _userFacebook;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 12),
          child: Text(
            'Username',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        //SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 70.0,
          child: TextField(
            keyboardType: TextInputType.text,
            controller: userController,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'Username',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: Icon(
                Icons.people_outline,
                color: Colors.black,
              ),
              filled: true,
              fillColor: Colors.white,
              // contentPadding: EdgeInsets.only(top: 14.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF(String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 12),
          child: Text(
            'Password',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 70.0,
          child: TextField(
            obscureText: _isHidden,
            controller: passController,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'Enter your Password',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 3,
                  )),
              filled: true,
              fillColor: Colors.white,
              // contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: Colors.black,
              ),
              suffixIcon: hintText == "Password"
                  ? IconButton(
                      onPressed: _toggleVisibility,
                      icon: _isHidden
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility_outlined),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {
          _showDialog();
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _showDialog() {
    return showDialog(
        context: context,
        // ignore: non_constant_identifier_names
        builder: (BuildContext) {
          final mq = MediaQuery.of(context);
          TextEditingController _emailControllerField = TextEditingController();

          return CustomAlertDialog(
            content: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 3.0,
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Text(
                    'ลืมรหัสผ่าน',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'เพียงกรอกอีเมลที่ได้ลงทะเบียนไว้',
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    'เราจะทำการส่งรหัสผ่านไปยังอีเมลของคุณ',
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextField(
                    controller: _emailControllerField,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: 'something@example.com',
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.purple[300],
                      child: MaterialButton(
                        minWidth: mq.size.width / 2,
                        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                        child: Text(
                          'Send Reset Email',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => _loginCheck(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          // side: BorderSide(color: Colors.grey, width: 3)
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.purple[800],
            letterSpacing: 1.5,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => UserInform()));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          // side: BorderSide(color: Colors.grey, width: 3)
        ),
        color: Colors.white,
        child: Text(
          'REGISTER',
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

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        SizedBox(height: 40.0),
        Text(
          'Social Login',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _googleSignInBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
        // child: FlatButton(
        //   onPressed: () {
        //
        //   },
        // ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => {
              // facebookLogin()
            },
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _googleSignInBtn(
            () => {
              // googleSignIn()
            },
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
        ],
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
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomImage(
                        width: 150.0,
                        height: 150.0,
                        margin: 0,
                        image_path: 'assets/logos/logo_changed.png',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildUsernameTF(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildPasswordTF('Password'),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildRememberMeCheckbox(),
                      _buildForgotPasswordBtn(),
                      _buildLoginBtn(),
                      _buildRegisterBtn(),
                      _buildSignInWithText(),
                      _buildSocialBtnRow(),
                      // _buildSignupBtn(),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _loginCheck() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));

    // _username = userController.text;
    // _password = passController.text;
    // if(_username.isEmpty){
    //   toast_short('Please Fill Username');
    // } else if(_password.isEmpty){
    //   toast_short('Please Fill Password');
    // } else {
    //   if(_username == 'admin' && _password == '1234'){
    //     toast_short('Welcome Admin');
    //     Navigator.of(context)
    //         .push(
    //         MaterialPageRoute(builder: (context) => HomeScreen())
    //     );
    //   } else {
    //     toast_short('Username or Password Incorrect');
    //   }
    // }
  }

  // void googleSignIn() {
  //   Route route = MaterialPageRoute(builder: (context) => HomeScreen());
  //   GoogleAuth().signInWithGoogle().then((user) => {
  //     // this._firebaseUser = user,
  //     Navigator.pushReplacement(context, route)
  //   });
  // }

  // void facebookLogin() {
  //   Route route = MaterialPageRoute(builder: (context) => HomeScreen());
  //   handleLogin().then((user) => {
  //     this._firebaseUser = user,
  //     Navigator.pushReplacement(context, route)
  //   });
  // }

  // Future handleLogin() async {
  //   final FacebookLoginResult result = await _facebookLogin.logIn(['email']);
  //   switch (result.status) {
  //     case FacebookLoginStatus.cancelledByUser:
  //       break;
  //     case FacebookLoginStatus.error:
  //       break;
  //     case FacebookLoginStatus.loggedIn:
  //       try {
  //         await loginWithFacebook(result);
  //       } catch (e) {
  //         print(e);
  //       }
  //       break;
  //   }
  // }

  // Future<User> loginWithFacebook(FacebookLoginResult result) async {
  //   final FacebookAccessToken accessToken = result.accessToken;

  //   final AuthCredential credential = FacebookAuthProvider.credential(
  //       accessToken.token
  //   );

  //   final UserCredential authResult = await _auth.signInWithCredential(credential);
  //   final User user = authResult.user;

  //   assert(!user.isAnonymous);
  //   assert(await user.getIdToken() != null);

  //   final User currentUser = _auth.currentUser;
  //   assert(currentUser.uid == user.uid);
  //   print('Facebook user is $user}');

  //   return user;
  // }

  // Future signInUsingFacebook(BuildContext context) async {
  //   final FacebookLogin facebookLogin = FacebookLogin();
  //   final FacebookLoginResult result = await facebookLogin.logIn(['email']);

  // String token = result.accessToken.token;
  // print("Access token = $token");
  // await _auth.signInWithCredential(
  //   FacebookAuthProvider.credential(accessToken: token));
  //
  // FacebookAccessToken facebookAccessToken = result.accessToken;
  // AuthCredential authCredential = FacebookAuthProvider.credential(
  //     accessToken: facebookAccessToken.token,
  //     idToken
  // );

  // switch (facebookLoginResult.status) {
  //   case FacebookLoginStatus.loggedIn:
  //     FirebaseAuth.instance
  //         .signInWithCredential(
  //       FacebookAuthProvider.getCredential(
  //           accessToken: facebookLoginResult.accessToken.token),
  //     ).then((user) async {
  //
  //       // Navigator.pushReplacement(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (context) => UserProfile(),
  //       //   ),
  //       // );
  //
  //     });
  //
  //     break;
  //
  //   case FacebookLoginStatus.cancelledByUser:
  //     break;
  //
  //   case FacebookLoginStatus.error:
  //     break;
  // }
}

