import 'package:archi_mat/browseMaterial/virtualMaterial2.dart';
import 'package:archi_mat/pages/tab.dart';
import 'package:flutter/material.dart';
import 'package:archi_mat/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class VirtualMaterialScreen2 extends StatefulWidget {
  @override
  _VirtualMaterialScreen2State createState() => _VirtualMaterialScreen2State();
}

class _VirtualMaterialScreen2State extends State<VirtualMaterialScreen2> {
  @override
  void initState() {
    super.initState();
  }

  double currentIndex = 0;
  List<String> items = [
    'assets/images/card.png',
    'assets/images/card.png',

    'assets/images/card.png',

    //  'assets/images/2.png',
    //  'assets/images/3.png'
  ];

  Widget slider() {
    return Container(
      height: 220.0,

      // decoration: BoxDecoration(
      //         color:AppTheme().white,
      //       ),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 210.0,
          autoPlay: true,
          onPageChanged: (index, reason) => {
            this.setState(() {
              currentIndex = index.toDouble();
            }),
          },
        ),
        items: items.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image(
                    image: AssetImage(i),
                  ));
            },
          );
        }).toList(),
      ),
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
                color: AppTheme().purple,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.black12,
              ),
              // Image(
              //   image: AssetImage('assets/images/splashbg.png'),
              //   fit: BoxFit.fitHeight,
              //   width: MediaQuery.of(context).size.width,
              // ),
              SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: AppTheme().white,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder:
                                                        (context) =>
                                                            TabPage(index: 0)),
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                      child: Text(
                                        'SKIP',
                                        style:
                                            TextStyle(color: AppTheme().white),
                                      ),
                                    )
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Column(children: [
                                Center(
                                  child: Text(
                                    'View Your \nVirtual Materials',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 32,
                                        color: AppTheme().white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: 40,
                                    height: 1.5,
                                    color: AppTheme().white,
                                  ),
                                ),
                                Text(
                                  'Select your color platette',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppTheme().white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(child: slider()),
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
                                        spacing:
                                            EdgeInsets.fromLTRB(5, 0, 5, 0),
                                        color: Colors.grey, // Inactive color
                                        activeColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ]),
                      Padding(
                        padding: const EdgeInsets.all(60.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    VirtualMaterialScreen3()));
                          },
                          child: Container(
                              // padding: EdgeInsets.only(left: 15),

                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        spreadRadius: 4,
                                        color: Colors.black12),
                                  ],
                                  color: AppTheme().white,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'NEXT',
                                    style: TextStyle(
                                        color: Colors.black,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
