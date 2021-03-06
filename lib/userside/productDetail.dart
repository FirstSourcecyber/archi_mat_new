import 'package:archimat/userside/shophome.dart';
import 'package:archimat/util/slider/profileslider.dart';
import 'package:archimat/util/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

class ProductDetail extends StatefulWidget {
  final dynamic data;
  final dynamic shop;
  const ProductDetail({Key key, this.data, this.shop}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  double rating = 3.5, i = 0;
  bool aboutText = true, loader = true;
  List image = [];
  String about =
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,';
  @override
  void initState() {
    product();
    super.initState();
  }

  product() {
    setState(() {
      about = widget.data['desc'];

      image = widget.data['images'];
      print(image);
      print(widget.data);
      loader = false;
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: loader
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppTheme().purple)),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileSliderPage(
                      image: image,
                    ),
                    Container(
                      // height: 75,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(color: AppTheme().white
                          // border: Border(
                          //     bottom: BorderSide(
                          //         width: 0.5, color: AppTheme().lblack)),
                          ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data['name'],
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                // fontFamily: 'Nexa',
                              ),
                            ),
                            Text(
                              r'$ ' + widget.data['price'].toString() != '' &&
                                      widget.data['price'].toString() != null
                                  ? widget.data['price'].toString()
                                  : '0',
                              style: GoogleFonts.lato(
                                  color: AppTheme().l1black,
                                  // fontFamily: 'Roxborough CF',
                                  fontSize: 12),
                            ),
                            !widget.shop
                                ? Text(
                                    widget.data['shop']['name'] != '' &&
                                            widget.data['shop']['name'] != null
                                        ? widget.data['shop']['name']
                                        : '',
                                    style: GoogleFonts.lato(
                                        color: AppTheme().l1black,
                                        // fontFamily: 'Roxborough CF',
                                        fontSize: 12),
                                  )
                                : Container(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: widget.shop
                                  ? Container()
                                  : GestureDetector(
                                      child: Container(
                                        width: 100,
                                        height: 35,
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.fromLTRB(15, 0, 15, 0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppTheme().purple,
                                            border: Border.all(
                                                color: AppTheme().l1black,
                                                width: 1)),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ShopHomePage(
                                                          data: widget
                                                              .data['shop'],
                                                          shop: false,
                                                        )));
                                          },
                                          child: Text(
                                            'Visit Shop',
                                            style: GoogleFonts.lato(
                                              color: AppTheme().white,
                                              // fontFamily: 'Nexa'
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                      child: Text(
                        'Description',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w700,
                          color: AppTheme().black,
                          // fontFamily: 'Nexa',
                        ),
                      ),
                    ),
                    DividerWidgets1(),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            about.length > 200 && aboutText
                                ? about.toString().substring(0, 200) +
                                    ' .....\n '
                                : about + '\n',
                            style: GoogleFonts.lato(
                                // fontFamily: 'Roxborough CF',
                                ),
                          ),
                          about.length > 200 && aboutText
                              ? GestureDetector(
                                  child: Text(
                                    'More',
                                    style: GoogleFonts.lato(
                                      color: AppTheme().blue,
                                      // fontFamily: 'Roxborough CF',
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      aboutText = false;
                                    });
                                  },
                                )
                              : about.length > 200
                                  ? GestureDetector(
                                      child: Text(
                                        'less',
                                        style: GoogleFonts.lato(
                                          color: AppTheme().blue,
                                          // fontFamily: 'Roxborough CF',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          aboutText = true;
                                        });
                                      },
                                    )
                                  : Container(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                      child: Text(
                        'Basic Info',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w700,
                          color: AppTheme().black,
                          // fontFamily: 'Nexa',
                        ),
                      ),
                    ),
                    DividerWidgets1(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              'In Stock',
                              style: GoogleFonts.lato(
                                  // fontFamily: 'Nexa',
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              widget.data['stock'].toString(),
                              style: GoogleFonts.lato(
                                  // fontFamily: 'Nexa',
                                  color: AppTheme().black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              'Category',
                              style: GoogleFonts.lato(
                                  // fontFamily: 'Nexa',
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              widget.data['category']['name'] +
                                  '>' +
                                  widget.data['subcategory']['name'],
                              style: GoogleFonts.lato(
                                  // fontFamily: 'Nexa',
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              'Size',
                              style: GoogleFonts.lato(
                                  // fontFamily: 'Nexa',
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              widget.data['size'],
                              style: GoogleFonts.lato(
                                  // fontFamily: 'Nexa',
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         alignment: Alignment.centerLeft,
                    //         width: MediaQuery.of(context).size.width * 0.4,
                    //         child: Text(
                    //           'Category',
                    //           style: GoogleFonts.lato(
                    //               // fontFamily: 'Nexa',
                    //               fontWeight: FontWeight.w700),
                    //         ),
                    //       ),
                    //       Container(
                    //         alignment: Alignment.centerLeft,
                    //         width: MediaQuery.of(context).size.width * 0.4,
                    //         child: Text(
                    //           widget.data['category']['name'] +
                    //               '>' +
                    //               widget.data['subcategory']['name'],
                    //           style: GoogleFonts.lato(
                    //               // fontFamily: 'Nexa',
                    //               ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              'Product Code',
                              style: GoogleFonts.lato(
                                  // fontFamily: 'Nexa',
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              widget.data['productCode'],
                              style: GoogleFonts.lato(
                                  // fontFamily: 'Nexa',
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
