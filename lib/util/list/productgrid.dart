import 'package:Archimat/environment.dart';
import 'package:Archimat/pages/materialdetail.dart';
import 'package:Archimat/pages/servicdetail.dart';
import 'package:Archimat/userside/productDetail.dart';
import 'package:Archimat/userside/shophome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme.dart';

class ProductListGride extends StatefulWidget {
  final dynamic data;
  final dynamic i;

  const ProductListGride({
    Key key,
    this.data,
    this.i,
  }) : super(key: key);

  @override
  _ProductListGrideState createState() => _ProductListGrideState();
}

class _ProductListGrideState extends State<ProductListGride> {
  List photos = [];
  int g = 0;
  bool loader = true;
  @override
  void initState() {
    print(widget.data);
    super.initState();
  }

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
    return widget.data.length == 0
        ? Center(
            child: Text(
              'No ' +
                  (widget.i == 1
                      ? 'Product'
                      : widget.i == 2
                          ? 'Shop'
                          : widget.i == 3
                              ? 'Service'
                              : 'Material') +
                  ' Available',
              style: TextStyle(
                fontFamily: 'Nexa',
              ),
            ),
          )
        : Wrap(
            spacing: 14,
            runSpacing: 14,
            children: List.generate(
                widget.data.length,
                (index) => GestureDetector(
                      onTap: () {
                        if (widget.i == 1) {
                          print('product===');
                          print(widget.data[index]);
                          gotoproduct(widget.data[index]);
                        } else if (widget.i == 2) {
                          print('shop===');
                          print(widget.data[index]);

                          gotoshop(widget.data[index]);
                        } else if (widget.i == 4) {
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
                          // width: MediaQuery.of(context).size.width * 0.5,
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppTheme().grey),
                              color: AppTheme().white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    image: DecorationImage(
                                        image: widget.i == 1 &&
                                                widget.data[index]['images']
                                                        .length !=
                                                    0
                                            ? NetworkImage(Config.url +
                                                (widget.data[index]['images'][0]
                                                    ['image']))
                                            : widget.data[index]['image'] !=
                                                        null &&
                                                    widget.data[index]
                                                            ['image'] !=
                                                        ''
                                                ? NetworkImage(Config.url +
                                                    (widget.data[index]
                                                        ['image']))
                                                : AssetImage('assets/images/back.png'),
                                        // AssetImage(widget.data[index]['image']),
                                        fit: BoxFit.cover)),
                              ),
                              // ClipRRect(
                              //   borderRadius: BorderRadius.only(
                              //       topLeft: Radius.circular(10),
                              //       topRight: Radius.circular(10)),
                              //   child: Image.network(
                              //     Config.url + widget.data[index]['images'][0]['image'],
                              //     width: MediaQuery.of(context).size.width,
                              //     height: 134,
                              //     fit: BoxFit.cover,
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.data[index]['name'] != '' &&
                                              widget.data[index]['name'] != null
                                          ? widget.data[index]['name'].length >
                                                  16
                                              ? widget.data[index]['name']
                                                      .toString()
                                                      .substring(0, 16) +
                                                  ' .. '
                                              : widget.data[index]['name']
                                          : ' ',
                                      style: GoogleFonts.alegreya(
                                        fontSize: 15,
                                        // fontFamily: 'Nexa',
                                      ),
                                    ),
                                    widget.i != 2
                                        ? Text(
                                            widget.data[index]['shop']
                                                            ['name'] !=
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
                                                              .data[index]
                                                                  ['company']
                                                                  ['title']
                                                              .length >
                                                          18
                                                      ? widget.data[index]
                                                                  ['company']
                                                                  ['title']
                                                              .toString()
                                                              .substring(
                                                                  0, 18) +
                                                          ' .. '
                                                      : widget.data[index]
                                                          ['company']['title']
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
                          )),
                    )));
  }
}

class ListGride extends StatefulWidget {
  final dynamic data;
  final int i;
  const ListGride({
    Key key,
    this.data,
    this.i,
  }) : super(key: key);

  @override
  _ListGrideState createState() => _ListGrideState();
}

class _ListGrideState extends State<ListGride> {
  List photos = [];
  int g = 0;
  bool loader = true;
  @override
  void initState() {
    setState(() {
      g = widget.i;
    });
    print(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.data.length == 0
        ? Center(
            child: Text(
              'No ' +
                  (g == 0
                      ? 'product'
                      : g == 1
                          ? 'Shop'
                          : g == 2
                              ? 'Services'
                              : 'Material') +
                  ' Available',
              style: GoogleFonts.alegreya(
                  // fontFamily: 'Nexa',
                  ),
            ),
          )
        : StaggeredGridView.countBuilder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            itemCount: widget.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 276,
                decoration: BoxDecoration(
                    border: Border.all(color: AppTheme().grey),
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
                                  bottom: BorderSide(color: AppTheme().grey)),
                              image: DecorationImage(
                                  image: g == 3 &&
                                          widget.data[index]['images'].length !=
                                              0
                                      ? NetworkImage(Config.url +
                                          (widget.data[index]['images'][0]
                                              ['image']))
                                      : widget.data[index]['image'] != null &&
                                              widget.data[index]['image'] != ''
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
                          child: g != 1 && g != 4
                              ? Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          AppTheme().lightgrey.withOpacity(0.4),
                                      border: Border.all(
                                          color: AppTheme().l2black)),
                                  child: Text(
                                    g == 2 ? 'VR' : 'AR',
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
                                ? widget.data[index]['name'].length > 18
                                    ? widget.data[index]['name']
                                            .toString()
                                            .substring(0, 18) +
                                        '..'
                                    : widget.data[index]['name']
                                : '',
                            style: GoogleFonts.alegreya(
                              fontSize: 15,
                              // fontFamily: 'Nexa',
                            ),
                          ),
                          g != 2
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.data[index]['shop']['name'] !=
                                                  '' &&
                                              widget.data[index]['shop']
                                                      ['name'] !=
                                                  null
                                          ? widget.data[index]['shop']['name']
                                                      .length >
                                                  18
                                              ? widget.data[index]['shop']
                                                          ['name']
                                                      .toString()
                                                      .substring(0, 18) +
                                                  '..'
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
                                    widget.data[index]['company']['title'] !=
                                                '' &&
                                            widget.data[index]['company']
                                                    ['title'] !=
                                                null
                                        ? widget.data[index]['company']['title']
                                                    .length >
                                                18
                                            ? widget.data[index]['company']
                                                        ['title']
                                                    .toString()
                                                    .substring(0, 18) +
                                                '..'
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
              );
            },
            staggeredTileBuilder: (int index) {
              return new StaggeredTile.count(1, 1);
            });
  }
}
