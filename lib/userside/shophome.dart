import 'dart:convert';

import 'package:Archimat/Services/fallowService.dart';
import 'package:Archimat/Services/shopService.dart';
import 'package:Archimat/pages/chat.dart';
import 'package:Archimat/util/slider/profileslider.dart';
import 'package:Archimat/util/widgets/businesslist.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../environment.dart';
import '../theme.dart';

class ShopHomePage extends StatefulWidget {
  final dynamic data;
  final bool shop;
  const ShopHomePage({Key key, this.data, this.shop}) : super(key: key);

  @override
  _ShopHomePageState createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  double rating = 3.5, i = 0;
  int fallow = 0;
  bool loader = true, youfallow = false;
  var shop, product, userdata, material, service;
  List slider = [];
  @override
  void initState() {
    getshop();
    super.initState();
  }

  getshop() async {
    var pref = await SharedPreferences.getInstance();
    setState(() {
      loader = true;
      userdata = jsonDecode(pref.getString('user'));
      print(userdata);
    });
    var data = {'user': userdata['id'], 'shop': widget.data['id']};

    ShopService().getshop(data).then((value) {
      print(value);
      setState(() {
        if (value != null) {
          var data = value;
          print(data['product']);
          shop = data['shop'];
          product = data['product'];
          material = data['material'];
          service = data['service'];
          print('material');
          print(material);

          print('service');
          print(service);
          print('service');
          slider = data['slider'];
          fallow = data['fallow'];
          if (!widget.shop) {
            youfallow = data['youfallow'];
          }
          print('slider=================================');
          print(slider);
          print('slider=================================');

          loader = false;
        }
      });
    });
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
          ),
        ),
        title: Image(
          image: AssetImage('assets/images/archimat.png'),
          width: 150,
          height: 100,
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {
                message();
              },
              icon: Icon(
                FontAwesomeIcons.facebookMessenger,
                color: AppTheme().black,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: loader
              ? Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppTheme().purple)),
                )
              : Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            ProfileSliderPage(
                              image: slider,
                            ),
                            // widget.shop
                            //     ? Container()
                            //     : Positioned(
                            //         // bottom: 5,
                            //         top: 5,
                            //         right: 5,
                            //         child: GestureDetector(
                            //           onTap: () {
                            //             message();
                            //           },
                            //           child: Container(
                            //             padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            //             decoration: BoxDecoration(
                            //                 color: AppTheme().l1black,
                            //                 shape: BoxShape.circle,
                            //                 border: Border.all(
                            //                     color: AppTheme().white, width: 1)),
                            //             child: Icon(
                            //               Icons.message,
                            //               size: 20,
                            //               color: AppTheme().white,
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            // widget.shop
                            //     ? Container()
                            //     : Positioned(
                            //         // bottom: 5,
                            //         top: 5,
                            //         left: 5,
                            //         child: GestureDetector(
                            //           onTap: () {
                            //             Navigator.pop(context);
                            //           },
                            //           child: Container(
                            //             padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                            //             decoration: BoxDecoration(
                            //                 color: AppTheme().l1black,
                            //                 shape: BoxShape.circle,
                            //                 border: Border.all(
                            //                     color: AppTheme().white, width: 1)),
                            //             // decoration: BoxDecoration(
                            //             // shape: BoxShape.circle,
                            //             // border: Border.all(
                            //             //     color: AppTheme().white, width: 1),
                            //             // color: AppTheme().l1black),
                            //             child: Icon(
                            //               Icons.arrow_back_ios,
                            //               size: 20,
                            //               color: AppTheme().white,
                            //             ),
                            //           ),
                            //         ),
                            //       ),

                            Container(
                              height: 100,
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              decoration: BoxDecoration(color: AppTheme().white
                                  // border: Border(
                                  //     bottom: BorderSide(
                                  //         width: 0.5, color: AppTheme().lblack)),
                                  ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  widget.shop
                                      ? Container()
                                      : GestureDetector(
                                          child: Container(
                                            // width: 150,
                                            height: 35,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.fromLTRB(
                                                15, 0, 15, 0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: youfallow
                                                    ? AppTheme().red
                                                    : AppTheme().purple,
                                                border: Border.all(
                                                    color: AppTheme().l1black,
                                                    width: 1)),
                                            child: GestureDetector(
                                              onTap: () {
                                                fallow1();
                                              },
                                              child: Text(
                                                youfallow
                                                    ? 'Unfollow'
                                                    : 'Follow',
                                                style: TextStyle(
                                                    color: AppTheme().white,
                                                    fontFamily: 'Nexa'),
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 22,
                          left: 20,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.68,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 57,
                                  backgroundColor: AppTheme().white,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.grey[200],
                                    backgroundImage: widget.data['image'] !=
                                            null
                                        ? NetworkImage(Config.url +
                                            '/' +
                                            widget.data['image'])
                                        : AssetImage('assets/images/mask.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.data['name'],
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Nexa',
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Malaysia',
                                              style: TextStyle(
                                                  fontFamily: 'Nexa',
                                                  color: AppTheme().lblack,
                                                  fontSize: 12),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    // Text(
                                    //   'Verified',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                    // SmoothStarRating(
                                    //     allowHalfRating: false,
                                    //     onRated: (v) {},
                                    //     starCount: 5,
                                    //     rating: rating,
                                    //     size: 15.0,
                                    //     isReadOnly: true,
                                    //     // fullRatedIconData: Icons.blur_off,
                                    //     // halfRatedIconData: Icons.blur_on,
                                    //     color: Colors.green,
                                    //     borderColor: Colors.green,
                                    //     spacing: 0.0)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Container(
                    //       width: MediaQuery.of(context).size.width * 0.25,
                    //       height: 80,
                    //       padding: EdgeInsets.all(10),
                    //       decoration:
                    //           BoxDecoration(border: Border.all(width: 0.5)),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             'Listing',
                    //             style: TextStyle(
                    //                 fontSize: 12,
                    //                 fontFamily: 'Nexa',
                    //                 fontWeight: FontWeight.w700),
                    //           ),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           Text(product.length.toString())
                    //         ],
                    //       ),
                    //     ),
                    //     Container(
                    //       width: MediaQuery.of(context).size.width * 0.25,
                    //       height: 80,
                    //       padding: EdgeInsets.all(10),
                    //       decoration:
                    //           BoxDecoration(border: Border.all(width: 0.5)),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             'Industry',
                    //             style: TextStyle(
                    //                 fontSize: 12,
                    //                 fontFamily: 'Nexa',
                    //                 fontWeight: FontWeight.w700),
                    //           ),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           Text(
                    //             shop['shop_type']['name'],
                    //             style: TextStyle(
                    //               fontFamily: 'Nexa',
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     Container(
                    //       width: MediaQuery.of(context).size.width * 0.25,
                    //       height: 80,
                    //       padding: EdgeInsets.all(10),
                    //       decoration:
                    //           BoxDecoration(border: Border.all(width: 0.5)),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             'Country',
                    //             style: TextStyle(
                    //                 fontSize: 12,
                    //                 fontFamily: 'Nexa',
                    //                 fontWeight: FontWeight.w700),
                    //           ),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           Text(
                    //             'Malaysia',
                    //             style: TextStyle(
                    //               fontFamily: 'Nexa',
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     Container(
                    //       width: MediaQuery.of(context).size.width * 0.25,
                    //       height: 80,
                    //       padding: EdgeInsets.all(10),
                    //       decoration:
                    //           BoxDecoration(border: Border.all(width: 0.5)),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             'Followers',
                    //             style: TextStyle(
                    //                 fontSize: 12,
                    //                 fontFamily: 'Nexa',
                    //                 fontWeight: FontWeight.w700),
                    //           ),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           Text(
                    //             '1244',
                    //             style: TextStyle(
                    //               fontFamily: 'Nexa',
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    BusinessAboutPage(
                      data: shop,
                      product: product,
                      service: service,
                      material: material,
                    )
                  ],
                ),
        ),
      ),
    );
  }

  fallow1() {
    var data = {'user': userdata['id'], 'shop': shop['id']};
    print(data);
    FallowService().fallow(data).then((value) {
      showAlert(value['message'], Colors.green);
      getshop();
    });
  }

  showAlert(text, backcolor) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  message() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatPage(
                  user: userdata,
                  shop: widget.data,
                  shopside: false,
                )));
  }
}
