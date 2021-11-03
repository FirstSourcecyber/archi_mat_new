import 'package:archimat/pages/browseMaterail.dart';
import 'package:flutter/material.dart';
import 'package:archimat/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  bool isSignup = true, isLogin = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                color: AppTheme().getstartedbg,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.black54,
              ),
              // Image(
              //   image: AssetImage('assets/images/splashbg.png'),
              //   fit: BoxFit.fitHeight,
              //   width: MediaQuery.of(context).size.width,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Center(
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Image(
                          image: AssetImage('assets/images/getstartedlogo.png'),
                          fit: BoxFit.cover,
                          // height: 160,
                          width: 180,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create a \nNew Account',
                        style: GoogleFonts.lato(
                            fontSize: 32,
                            color: AppTheme().white,
                            // fontFamily: 'Nexa',
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: 40,
                          height: 1.5,
                          color: AppTheme().white,
                        ),
                      ),
                      Text(
                        'For the best experience \nwith archimat',
                        style: GoogleFonts.lato(
                            color: AppTheme().white,
                            // fontFamily: 'Roxborough CF',
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              this.setState(() {
                                this.isSignup = true;
                                this.isLogin = false;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                        child: Text(
                                      'Sign Up',
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w700,
                                          // fontFamily: 'Nexa',
                                          color: isSignup == false
                                              ? AppTheme().loginBtnColor
                                              : Colors.white),
                                    )),
                                  ),
                                  isLogin == false && isSignup == true
                                      ? Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          color: AppTheme().yellow,
                                          // width: 100,
                                          height: 1,
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              this.setState(() {
                                this.isSignup = false;
                                this.isLogin = true;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      child: Text(
                                        'Log In',
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w700,
                                            // fontFamily: 'Nexa',
                                            color: isLogin == false
                                                ? AppTheme().loginBtnColor
                                                : Colors.white),
                                      ),
                                    ),
                                  ),
                                  isLogin == true && isSignup == false
                                      ? Container(
                                          color: AppTheme().yellow,
                                          // width: 100,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: 1,
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 45),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => VirtualMaterialScreen1()));
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: AppTheme().white,
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'SIGN UP WITH EMAIL',
                                    style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
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
                              builder: (context) => VirtualMaterialScreen1()));
                        },
                        child: Container(
                            // padding: EdgeInsets.only(left: 15),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                // color: AppTheme().white,
                                border:
                                    Border.all(color: AppTheme().loginBtnColor),
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'SIGN UP WITH PHONE NUMBER',
                                    style: GoogleFonts.lato(
                                        color: AppTheme().white,
                                        fontWeight: FontWeight.w700,
                                        // fontFamily: 'Roxborough CF',
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  )
                                ],
                              ),
                            )),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
