import 'dart:convert';

import 'package:archimat/theme.dart';
import 'package:archimat/util/widgets/back.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController currentpaswd = new TextEditingController();
  TextEditingController newpaswd = new TextEditingController();
  TextEditingController confirmpaswd = new TextEditingController();
  var userdata;
  @override
  void initState() {
    getuserdata();
    super.initState();
  }

  getuserdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userdata = jsonDecode(prefs.getString('user'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Back_Widgets(
                onclick: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppTheme().black)),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: currentpaswd,
                        decoration: InputDecoration(
                          hintText: 'Current Password',
                          hintStyle: GoogleFonts.lato(color: Colors.grey),
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
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppTheme().black)),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: newpaswd,
                        decoration: InputDecoration(
                            hintText: 'New Password',
                            hintStyle: GoogleFonts.lato(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppTheme().black)),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: confirmpaswd,
                        decoration: InputDecoration(
                            hintText: 'New Password again',
                            hintStyle: GoogleFonts.lato(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        change();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: AppTheme().lblack, width: 1)),
                        child: Text(
                          'Change',
                          style: GoogleFonts.lato(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Forget Password?',
                      style: GoogleFonts.lato(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  change() {
    if (currentpaswd.text.isEmpty ||
        confirmpaswd.text.isEmpty ||
        newpaswd.text.isEmpty) {
      showAlert('Please Fill All Field', AppTheme().red);
    }
  }

  showAlert(text, backcolor) {
    print('infunction');
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backcolor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
