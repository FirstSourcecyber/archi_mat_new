import 'dart:convert';
import 'package:Archimat/Services/loginService.dart';
import 'package:Archimat/controller/loginRegister.dart';
import 'package:email_validator/email_validator.dart';
import 'package:Archimat/pages/tab.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:Archimat/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final bool login;
  const LoginPage({Key key, this.login}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = new TextEditingController();
  TextEditingController pswd = new TextEditingController();
  final LoginRegisterController contro = Get.find();
  bool emailvarified = false;
  String token;
  bool loader = false;
  @override
  initState() {
    super.initState();
    FirebaseMessaging.instance.getToken().then((tokeen) {
      print(tokeen);
      this.token = tokeen;
      print(token);
    });
  }

  showAlert(text, backcolor) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backcolor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme().lightgrey,
        appBar: AppBar(
          backgroundColor: AppTheme().white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppTheme().black,
              )),
          title: Text(
            'Login',
            style: GoogleFonts.alegreya(
              // fontFamily: 'Nexa',
              color: AppTheme().black,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Center(
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Image(
                          image: AssetImage('assets/images/archimatlogo.png'),
                          fit: BoxFit.cover,
                          // height: 160,
                          width: 180,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 300,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          decoration: BoxDecoration(
                              // color: AppTheme().white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppTheme().lblack)),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: email,
                            onChanged: (value) {
                              checker(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Your E-Mail',
                              hintStyle: GoogleFonts.lato(
                                color: AppTheme().grey,
                                // fontFamily: 'Roxborough CF',
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          decoration: BoxDecoration(
                              // color: AppTheme().white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppTheme().lblack)),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            controller: pswd,
                            decoration: InputDecoration(
                                hintText: 'Enter Your Password',
                                hintStyle: GoogleFonts.lato(
                                  color: AppTheme().grey,
                                  // fontFamily: 'Roxborough CF',
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        loader
                            ? Center(
                                child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        AppTheme().purple)))
                            : GestureDetector(
                                onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  if (email.text.isEmpty || pswd.text.isEmpty) {
                                    showAlert(
                                        "Please Fill Both Field", Colors.red);
                                  } else {
                                    login();
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                                  decoration: BoxDecoration(
                                      // color: AppTheme().white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: AppTheme().lblack, width: 1)),
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.alegreya(
                                      color: AppTheme().black,
                                      fontWeight: FontWeight.w700,
                                      // fontFamily: 'Nexa',
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            contro.loginwithgoogle(token);
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              padding: EdgeInsets.fromLTRB(20, 17, 20, 17),
                              decoration: BoxDecoration(
                                  color: AppTheme().white,
                                  border: Border.all(
                                      color: AppTheme().loginBtnColor),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/google.svg',
                                      color: AppTheme().black,
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'SIGN UP WITH GMAIL',
                                      style: GoogleFonts.lato(
                                          color: Colors.black,
                                          // fontFamily: 'Roxborough CF',
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void checker(value) {
    emailvarified = EmailValidator.validate(value);
  }

  login() async {
    setState(() {
      loader = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {
      'email': email.text.trim(),
      'password': pswd.text.trim(),
      'mob_token': token
    };
    print(data);
    if (emailvarified) {
      LoginService().login(data).then((value) {
        print(value);
        if (value['message'] == 'success') {
          if (value['user']['role']['name'] == 'user') {
            print('user');
            prefs.setString('user', jsonEncode(value['user']));
            // prefs.setString('new', 'new');

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => TabPage(
                          index: 0,
                          data: null,
                        )),
                (Route<dynamic> route) => false);
          } else if (value['user']['role']['name'] == 'shopOwner') {
            prefs.setString('user', jsonEncode(value['user']));
            prefs.setString('new', 'new');

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => TabPage(
                          index: 0,
                          data: value['user']['shop'],
                        )),
                (Route<dynamic> route) => false);
            print('shop');
          } else {
            setState(() {
              loader = false;
            });
            showAlert('User not available', Colors.red);
            print('user not available');
          }
        } else {
          setState(() {
            loader = false;
          });
          showAlert('User not available', Colors.red);
          print('user not available');
        }
      });
    } else {
      showAlert('Email not Correct', Colors.red);
    }
  }
}
