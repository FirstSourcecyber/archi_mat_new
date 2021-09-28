import 'dart:convert';
import 'package:Archimat/Services/inboxService.dart';
import 'package:Archimat/Services/searchService.dart';
import 'package:Archimat/util/widgets/businesslist.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme.dart';

class SearchPage extends StatefulWidget {
  final dynamic search;
  const SearchPage({
    Key key,
    this.search,
  }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int loader = 2;
  var search = TextEditingController();
  bool loader1 = true, cancel = false;
  String data = '';
  List inbox1 = [], inbox = [], searchdetail = [];

  var detail;
  @override
  void initState() {
    dat();
    super.initState();
  }

  dat() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      detail = jsonDecode(pref.getString('user'));
      data = widget.search;
    });
    getsearch();
  }

  getsearch() {
    setState(() {
      loader1 = true;
    });
    SearchService().getallsearch().then((value) {
      print(value);
      setState(() {
        searchdetail = value;
      });
      setvalue(widget.search);
    });
  }

  setvalue(search) {
    setState(() {
      loader1 = true;
      inbox1 = searchdetail[search];
      inbox = searchdetail[search];
      if (inbox1.length == 0) {
        loader = 0;
      }
      loader1 = false;
    });
  }

  searchvalueASshop() {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      cancel = !cancel;
      loader1 = true;
      inbox1 = inbox
          .where((search1) => ((search1['user']['firstname']
              .toLowerCase()
              .contains(search.text.toLowerCase()))))
          .toList();
      if (inbox1.length == 0) {
        loader = 0;
      }
      loader1 = false;
    });
  }

  aftersearch() {
    FocusScope.of(context).unfocus();
    setState(() {
      cancel = !cancel;
      loader1 = true;
      print('inbox======================');
      print(inbox);
      inbox1 = inbox;
      print('inbox1======================');

      print(inbox1);
      if (inbox1.length == 0) {
        loader = 0;
      } else {
        loader = inbox1.length;
      }
      loader1 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme().white,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios_sharp,
        //     color: AppTheme().black,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: Text(
          'Inbox',
          style: TextStyle(
            color: AppTheme().black,
            fontFamily: 'Roxborough CF',
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                FontAwesomeIcons.facebookMessenger,
                color: Colors.black,
              ),
              onPressed: null)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: search,
                style: TextStyle(
                  fontSize: 16,
                  // color: AppTheme.dark_grey,
                ),
                decoration: new InputDecoration(
                  // fillColor: AppTheme().blue,
                  focusColor: AppTheme().blue,
                  errorText: null,
                  // border: InputBorder.none,
                  suffixIcon: cancel
                      ? GestureDetector(
                          child: Icon(Icons.cancel),
                          onTap: () {
                            setState(() {
                              search.clear();
                            });
                            print(search.text);
                            aftersearch();
                            // // if (loader > 0) {
                            // if (widget.shopside) {
                            //   searchvalueASshop();
                            // } else {
                            //   searchvalueASuser();
                            // }
                            // }
                          },
                        )
                      : GestureDetector(
                          child: Icon(Icons.search),
                          onTap: () {
                            if (loader > 0) {
                              if (search.text.isNotEmpty) {
                                searchvalueASshop();
                              }
                            }
                          },
                        ),
                  hintText: "Search Messages",
                  hintStyle: TextStyle(color: AppTheme().l1black),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Divider_Widgets(),
            loader != 0
                ? ListingPage(data: inbox)
                : Column(
                    children: <Widget>[
                      loader1
                          ? Center(
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      AppTheme().purple)),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'No ' + 'Product' + ' available',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
