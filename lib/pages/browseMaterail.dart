import 'package:archimat/splash/loginregister.dart';
import 'package:flutter/material.dart';
import 'package:archimat/theme.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VirtualMaterialScreen1 extends StatefulWidget {
  @override
  _VirtualMaterialScreen1State createState() => _VirtualMaterialScreen1State();
}

class _VirtualMaterialScreen1State extends State<VirtualMaterialScreen1> {
  @override
  void initState() {
    super.initState();
  }

  double i = 0;
  double currentIndex = 0;
  List<String> items = [
    'assets/images/Capture.PNG',
    'assets/images/Capture1.PNG',
    'assets/images/Capture2.PNG',
  ];

  Widget slider() {
    return Column(
      children: [
        Container(
            height: 220.0,
            child: Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Image(
                  width: 400,
                  // height: 500,
                  image: AssetImage(items[i.toInt()]),
                  fit: BoxFit.fill,
                ))),
      ],
    );
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
                color: AppTheme().white,
              ),
              SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    i > 0
                                        ? IconButton(
                                            icon: Icon(
                                              Icons.arrow_back_ios,
                                              color: AppTheme().grey,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                i--;
                                                currentIndex = i;
                                              });
                                            },
                                          )
                                        : Container(
                                            height: 30,
                                          ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder:
                                                        (context) =>
                                                            LoginRegister()),
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                      child: Text(
                                        'SKIP',
                                        style: GoogleFonts.lato(
                                          color: AppTheme().grey,
                                          // fontFamily: 'Roxborough CF',
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(children: [
                                Center(
                                  child: Text(
                                    i == 0
                                        ? 'Discover \n More New Things'
                                        : i == 1
                                            ? 'Experience \n Virtually'
                                            : 'Save Your \n Fave Materials',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                        fontSize: 30,
                                        color: Colors.black54,
                                        // fontFamily: 'Nexa',
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: 40,
                                    height: 1.5,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  'World Of Architectural & \n Building Materials',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      color: Colors.black54,
                                      // fontFamily: 'Nexa',
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(child: slider()),
                                SizedBox(
                                  height: 5,
                                ),
                              ]),
                            ),
                          ]),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: GestureDetector(
                          onTap: () {
                            if (i < 2) {
                              setState(() {
                                i++;
                                currentIndex = i;
                              });
                            } else {
                              next();
                            }
                          },
                          child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //       blurRadius: 2,
                                  //       spreadRadius: 2,
                                  //       color: Colors.black54),
                                  // ],
                                  color: AppTheme().white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: AppTheme().grey, width: .5)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'NEXT',
                                    style: GoogleFonts.lato(
                                        color: Colors.black,
                                        // fontFamily: 'Roxborough CF',
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  )
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        // alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          child: new DotsIndicator(
                            dotsCount: items.length,
                            position: currentIndex,
                            decorator: DotsDecorator(
                              spacing: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              color: Colors.grey, // Inactive color
                              activeColor: AppTheme().light1grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  next() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('new', 'new');
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginRegister()),
        (Route<dynamic> route) => false);
  }
}
