import 'package:Archimat/environment.dart';
import 'package:Archimat/pages/materialdetail.dart';
import 'package:Archimat/pages/servicdetail.dart';
import 'package:Archimat/userside/productDetail.dart';
import 'package:Archimat/userside/shophome.dart';
import 'package:Archimat/util/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../../theme.dart';

class Productlist extends StatefulWidget {
  final int i;
  final dynamic data;
  final String title;
  // final Function onclick();
  const Productlist({Key key, this.i, this.data, this.title}) : super(key: key);

  @override
  _ProductlistState createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  gotoshop(data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ShopHomePage(
                  data: data,
                  shop: false,
                )));
  }

  gotoproduct(data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetail(
                  data: data,
                  shop: false,
                )));
  }

  gotomaterial(data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MaterialDetail(
                  data: data,
                  shop: false,
                )));
  }

  gotoservice(data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ServiceDetail(
                  data: data,
                  shop: false,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Title_Widgets(
            text: widget.title,
            onclick: null,
            i: widget.i,
            bold: false,
          ),
          Container(
            height: 230,
            alignment: Alignment.topLeft,
            // padding: EdgeInsets.only(left: 10),
            color: AppTheme().white,
            child:
                // loader
                //     ? Center(child: CircularProgressIndicator(color: AppTheme().purple))
                //     :
                ListView.builder(
              // padding:
              //     const EdgeInsets.only(top: 5, right: 16, left: 16, bottom: 5),
              itemCount: widget.data.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (widget.i == 3) {
                      print('product===');
                      print(widget.data[index]);
                      gotoproduct(widget.data[index]);
                    } else if (widget.i == 2) {
                      print('shop===');
                      print(widget.data[index]);

                      gotoshop(widget.data[index]);
                    } else if (widget.i == 1) {
                      print('shop===');
                      print(widget.data[index]);

                      gotomaterial(widget.data[index]);
                    } else {
                      print('shop===');
                      print(widget.data[index]);

                      gotoservice(widget.data[index]);
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 230,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppTheme().grey, width: .5),
                        color: AppTheme().white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 185,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: AppTheme().grey)),
                                  image: DecorationImage(
                                      image: widget.i == 3 &&
                                              widget.data[index]['images']
                                                      .length !=
                                                  0
                                          ? NetworkImage(Config.url +
                                              (widget.data[index]['images'][0]
                                                  ['image']))
                                          : widget.data[index]['image'] !=
                                                      null &&
                                                  widget.data[index]['image'] !=
                                                      ''
                                              ? NetworkImage(Config.url +
                                                  (widget.data[index]['image']))
                                              : AssetImage(
                                                  'assets/images/back.png'),
                                      // AssetImage(widget.data[index]['image']),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                              left: 10,
                              top: 10,
                              child: widget.i != 1 && widget.i != 4
                                  ? Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppTheme()
                                              .lightgrey
                                              .withOpacity(0.4),
                                          border: Border.all(
                                              color: AppTheme().l2black)),
                                      child: Text(
                                        widget.i == 2 ? 'VR' : 'AR',
                                        style: GoogleFonts.lato(
                                            fontSize: 8,
                                            // fontFamily: 'Roxborough CF',
                                            color: AppTheme().l2black),
                                      ))
                                  : Container(),
                            )
                          ],
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.data[index]['name'] != '' &&
                                        widget.data[index]['name'] != null
                                    ? widget.data[index]['name'].length > 16
                                        ? widget.data[index]['name']
                                                .toString()
                                                .substring(0, 16) +
                                            ' .. '
                                        : widget.data[index]['name']
                                    : '',
                                style: GoogleFonts.alegreya(
                                  fontSize: 15,
                                  // fontFamily: 'Nexa',
                                ),
                              ),
                              widget.i != 2
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.data[index]['shop']['name'] !=
                                                      '' &&
                                                  widget.data[index]['shop']
                                                          ['name'] !=
                                                      null
                                              ? widget
                                                          .data[index]['shop']
                                                              ['name']
                                                          .length >
                                                      18
                                                  ? widget.data[index]['shop']
                                                              ['name']
                                                          .toString()
                                                          .substring(0, 18) +
                                                      ' .. '
                                                  : widget.data[index]['shop']
                                                      ['name']
                                              : '',
                                          style: GoogleFonts.lato(
                                              color: AppTheme().l1black,
                                              // fontFamily: 'Roxborough CF',
                                              fontSize: 12),
                                        ),
                                        // Container(
                                        //   width: 70,
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       // Container(
                                        //       //   decoration: BoxDecoration(
                                        //       //       shape: BoxShape.circle,
                                        //       //       border: Border.all(
                                        //       //           color: AppTheme().grey)),
                                        //       //   child: Icon(
                                        //       //     Icons.star,
                                        //       //     color: AppTheme().grey,
                                        //       //     size: 15,
                                        //       //   ),
                                        //       // ),
                                        //       // Container(
                                        //       //   padding: EdgeInsets.all(5),
                                        //       //   decoration: BoxDecoration(
                                        //       //       shape: BoxShape.circle,
                                        //       //       border: Border.all(
                                        //       //           color: AppTheme().grey)),
                                        //       //   child: Icon(FontAwesomeIcons.leaf,
                                        //       //       size: 10, color: AppTheme().grey),
                                        //       // ),
                                        //       // Container(
                                        //       //     padding: EdgeInsets.all(5),
                                        //       //     decoration: BoxDecoration(
                                        //       //         shape: BoxShape.circle,
                                        //       //         border: Border.all(
                                        //       //             color: AppTheme().grey)),
                                        //       //     child: Text(
                                        //       //       'VR',
                                        //       //       style: TextStyle(fontSize: 8),
                                        //       //     )),
                                        //     ],
                                        //   ),
                                        // )
                                      ],
                                    )
                                  : Container(
                                      child: Text(
                                        widget.data[index]['company']
                                                        ['title'] !=
                                                    '' &&
                                                widget.data[index]['company']
                                                        ['title'] !=
                                                    null
                                            ? widget
                                                        .data[index]['company']
                                                            ['title']
                                                        .length >
                                                    18
                                                ? widget.data[index]['company']
                                                            ['title']
                                                        .toString()
                                                        .substring(0, 18) +
                                                    ' .. '
                                                : widget.data[index]['company']
                                                    ['title']
                                            : '',
                                        style: GoogleFonts.lato(
                                            color: AppTheme().l1black,
                                            // fontFamily: 'Roxborough CF',
                                            fontSize: 12),
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
