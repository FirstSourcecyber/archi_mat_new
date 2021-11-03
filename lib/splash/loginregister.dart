import 'package:archimat/controller/loginRegister.dart';
import 'package:archimat/splash/loginPage.dart';
import 'package:archimat/splash/registeration.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:archimat/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({Key key}) : super(key: key);

  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  // bool login = true;
  final controller = Get.put(LoginRegisterController());
  String token;

  @override
  initState() {
    super.initState();
    FirebaseMessaging.instance.getToken().then((tokeen) {
      print(tokeen);
      this.token = tokeen;
      print(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme().lightgrey,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Stack(
                  children: [
                    Image(
                      image: AssetImage('assets/images/back.png'),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.43,
                    ),
                    // Back_Widgets(
                    //   onclick: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 305,
                  // height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: AppTheme().lightgrey,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create a \nNew Account',
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            // fontFamily: 'Nexa',
                            fontSize: 25,
                            color: AppTheme().black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Welcome archimat',
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: AppTheme().black,
                          // fontFamily: 'Roxborough CF',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 40,
                        child: Divider(
                          color: AppTheme().black,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          controller.signupgoogle(token);
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: AppTheme().white,
                                border:
                                    Border.all(color: AppTheme().loginBtnColor),
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
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RegisterationPage()));
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: AppTheme().white,
                                border:
                                    Border.all(color: AppTheme().loginBtnColor),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/email.svg',
                                    color: AppTheme().black,
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'SIGN UP WITH EMAIL',
                                    style: GoogleFonts.lato(
                                        color: Colors.black,
                                        // fontFamily: 'Roxborough CF',
                                        fontSize: 14),
                                  )
                                ],
                              ),
                            )),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginPage()));
                          },
                          child: Container(
                              margin: EdgeInsets.only(left: 15, right: 15),
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppTheme().white,
                                  border: Border.all(
                                      color: AppTheme().loginBtnColor),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/login.png',
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Login Here',
                                    style: GoogleFonts.lato(
                                        color: Colors.black,
                                        // fontFamily: 'Roxborough CF',
                                        fontSize: 14),
                                  ),
                                ],
                              ))),
                    ],
                  ),
                ),
                // Column(
                //   children: [
                //     Divider_Widgets(),
                //     Padding(
                //       padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                //       child: Row(
                //         children: [
                //           Container(
                //             padding: EdgeInsets.all(15),
                //             decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 border: Border.all(color: AppTheme().black)),
                //             child: SvgPicture.asset(
                //               'assets/images/facebook.svg',
                //               color: AppTheme().black,
                //               width: 10,
                //             ),
                //           ),
                //           SizedBox(
                //             width: 10,
                //           ),
                //           Container(
                //             padding: EdgeInsets.all(10),
                //             decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 border: Border.all(color: AppTheme().black)),
                //             child: SvgPicture.asset(
                //               'assets/images/insta.svg',
                //               color: AppTheme().black,
                //               width: 20,
                //             ),
                //           ),
                //           SizedBox(
                //             width: 10,
                //           ),
                //           Container(
                //             padding: EdgeInsets.all(10),
                //             decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 border: Border.all(color: AppTheme().black)),
                //             child: SvgPicture.asset(
                //               'assets/images/word.svg',
                //               color: AppTheme().black,
                //               width: 20,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ));
  }
}
