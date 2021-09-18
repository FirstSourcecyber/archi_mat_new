import 'dart:convert';

import 'package:Archimat/business/setting.dart';
import 'package:Archimat/pages/inbox.dart';
import 'package:Archimat/pages/scannerPage.dart';
import 'package:Archimat/userside/homepage.dart';
import 'package:Archimat/theme.dart';
import 'package:Archimat/userside/setting.dart';
import 'package:Archimat/userside/shophome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabPage extends StatefulWidget {
  final int index;
  final dynamic data;
  TabPage({@required this.index, this.data});
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _page = 0;
  bool check = true;

  getPage() {
    if (_page == 0) {
      return AnimatedContainer(
          color: AppTheme().white,
          duration: Duration(seconds: 1),
          child: widget.data != null
              ? ShopHomePage(
                  data: widget.data,
                  shop: true,
                )
              : HomePage());
    }
    if (_page == 1) {
      return AnimatedContainer(
          color: AppTheme().white,
          duration: Duration(seconds: 1),
          child:
              //  widget.data != null
              //     ?
              Inbox(
            shopside: widget.data != null ? true : false,
          )
          // : CategoryPage(
          //     dat1: false,
          //   ),
          );
    }

    if (_page == 2) {
      return AnimatedContainer(
          color: AppTheme().white,
          duration: Duration(seconds: 1),
          child: widget.data != null
              ? BusinessSetting()
              : UserSetting(
                  data: detail,
                ));
    }
    if (_page == 3) {
      return AnimatedContainer(
          color: AppTheme().white,
          duration: Duration(seconds: 1),
          child: Container());
    }
    if (_page == 4) {
      return AnimatedContainer(
          color: AppTheme().white,
          duration: Duration(seconds: 1),
          child: ShopQr(
            shopside: widget.data != null ? true : false,
            shopdata: widget.data != null ? detail['shop'] : detail,
          ));
    }
  }

  List pages = [];
  String logstatment = 'You Need To Login First \nTo Move Forward!';

  String name = '', image = '';
  dynamic detail;

  userdetail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      detail = jsonDecode(pref.getString('user'));
    });
    if (detail != null) {
      setState(() {
        name = detail['firstname'] + ' ' + detail['lastname'];
        image = detail['image'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    userdetail();
    setState(() {
      _page = widget.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 240, 242, 1.0),
      body: getPage(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.purple,
      //   child: SvgPicture.asset(
      //     'assets/images/floatlogo.svg',
      //     width: 20,
      //     color: AppTheme().white,
      //   ),
      //   onPressed: () {
      //     this.setState(() {
      //       _page = 4;
      //     });
      //   },
      // ),
      bottomNavigationBar: BottomAppBar(
        color: AppTheme().white,
        shape: CircularNotchedRectangle(),
        notchMargin: 0.0,
        child: Container(
          height: 70,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  this.setState(() {
                    _page = 0;
                  });
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 3),
                      child: SvgPicture.asset(
                        'assets/images/home.svg',
                        width: 20,
                        color: _page == 0 ? AppTheme().purple : AppTheme().grey,
                      ),
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                          color:
                              _page == 0 ? AppTheme().purple : AppTheme().grey,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  this.setState(() {
                    _page = 1;
                  });
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 3),
                      child: SvgPicture.asset(
                        // widget.data != null
                        //     ?
                        'assets/images/message.svg'
                        // : 'assets/images/category.svg'
                        ,
                        width: 20,
                        color: _page == 1 ? AppTheme().purple : AppTheme().grey,
                      ),
                    ),
                    Text(
                      // widget.data != null ?
                      'Chat'
                      // : 'Category'
                      ,
                      style: TextStyle(
                        fontFamily: 'Roxborough CF',
                        color: _page == 1 ? AppTheme().purple : AppTheme().grey,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      this.setState(() {
                        _page = 4;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 13),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppTheme().grey),
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        'assets/images/makitsvg.svg',
                        width: 30,
                        color: _page == 4 ? AppTheme().purple : AppTheme().grey,
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  this.setState(() {
                    _page = 2;
                  });
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 3),
                        child:
                            //  widget.data != null
                            //     ?
                            Icon(
                          Icons.person,
                          color:
                              _page == 2 ? AppTheme().purple : AppTheme().grey,
                        )
                        // : SvgPicture.asset(
                        //     'assets/images/search.svg',
                        //     width: 20,
                        //     color: _page == 2
                        //         ? AppTheme().purple
                        //         : AppTheme().grey,
                        //   ),
                        ),
                    Text(
                      // widget.data != null ?
                      'Person'
                      // : 'Discover'
                      ,
                      style: TextStyle(
                          fontFamily: 'Roxborough CF',
                          color:
                              _page == 2 ? AppTheme().purple : AppTheme().grey,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      this.setState(() {
                        _page = 3;
                      });
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 5),
                          child: SvgPicture.asset(
                            'assets/images/makitsvg.svg',
                            width: 25,
                            color: _page == 3
                                ? AppTheme().purple
                                : AppTheme().grey,
                          ),
                        ),
                        Text(
                          'MAT IT',
                          style: TextStyle(
                              fontFamily: 'Roxborough CF',
                              // fontWeight: FontWeight.w700,
                              color: _page == 3
                                  ? AppTheme().purple
                                  : AppTheme().grey,
                              fontSize: 12),
                        )
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 20),
                        //   child: SvgPicture.asset(
                        //     'assets/images/mat.svg',
                        //     width: 35,
                        //     color: _page == 3 ? AppTheme().purple : AppTheme().grey,
                        //   ),
                        // ),
                      ],
                    ),
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
