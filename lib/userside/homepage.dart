import 'package:Archimat/Services/homeService.dart';
import 'package:Archimat/theme.dart';
import 'package:Archimat/util/list/categorylist.dart';
import 'package:Archimat/util/list/productlist.dart';
import 'package:Archimat/util/slider/slider.dart';
import 'package:Archimat/util/slider/slider1.dart';
import 'package:Archimat/util/widgets/list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i = 0, j = 0;
  List category = [],
      product = [],
      service = [],
      slider = [],
      slider2 = [],
      slider3 = [],
      shop = [],
      material = [];

  bool loader = true;

  // getcategory() {
  //   setState(() {
  //     loader = true;
  //   });
  //   CategoryService().getcategory().then((value) {
  //     print(value);
  //     setState(() {
  //       if (value != null) {
  //         // var data = jsonDecode(value);
  //         var data = value;
  //         print(data['arks']);
  //         category = data['arks'];
  //         // loader = false;
  //       }
  //     });
  //   });
  // }

  // getproduct() {
  //   // setState(() {
  //   //   loader = true;
  //   // });

  //   ProductService().getproduct().then((value) {
  //     print(value);
  //     setState(() {
  //       if (value != null) {
  //         var data = value;
  //         print(data['arks']);
  //         product1 = data['arks'];
  //       }
  //     });
  //   });
  // }

  // getservice() {
  //   // setState(() {
  //   //   loader = true;
  //   // });

  //   ServiceRoute().getservice().then((value) {
  //     print(value);
  //     setState(() {
  //       if (value != null) {
  //         var data = value;
  //         print(data['arks']);
  //         service = data['arks'];
  //         // loader = false;
  //       }
  //     });
  //   });
  // }

  // getslider() {
  //   setState(() {
  //     loader = true;
  //   });

  //   ProductService().getslider().then((value) {
  //     print(value);
  //     setState(() {
  //       if (value != null) {
  //         var data = value;

  //         slider = data['slider1'];
  //         slider2 = data['slider2'];
  //         slider3 = data['slider3'];
  //         loader = false;
  //       }
  //     });
  //   });
  // }

  gethome() {
    setState(() {
      loader = true;
    });

    HomeService().gethomedetail().then((value) {
      print(value);
      setState(() {
        if (value != null) {
          var data = value;
          product = data['vrproduct'];
          material = data['allmaterial'];
          category = data['allcategory'];
          shop = data['vrshop'];
          service = data['allservice'];
          slider = data['slider1'];
          slider2 = data['slider2'];
          slider3 = data['slider3'];
          loader = false;
        }
      });
    });
  }

  @override
  void initState() {
    // getcategory();
    // getproduct();
    // getservice();
    // getslider();
    gethome();
    super.initState();
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // key: scaffoldKey,
        // drawer: Menu2(),
        appBar: AppBar(
          backgroundColor: AppTheme().white,
          // leading: GestureDetector(
          //   onTap: () => scaffoldKey.currentState.openDrawer(),
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          //     child: Container(
          //       padding: EdgeInsets.all(10),
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           border: Border.all(color: AppTheme().black)),
          //       child: SvgPicture.asset(
          //         'assets/images/menu.svg',
          //         color: AppTheme().l1black,
          //         width: 40,
          //       ),
          //     ),
          //   ),
          // ),
          title: Image(
            image: AssetImage('assets/images/archimat.png'),
            width: 150,
            height: 100,
          ),
          centerTitle: true,
          // actions: <Widget>[
          //   Padding(
          //     padding: const EdgeInsets.only(right: 15),
          //     child: SvgPicture.asset(
          //       'assets/images/search.svg',
          //       color: AppTheme().l1black,
          //       width: 20,
          //     ),
          //   )
          // ],
        ),
        body: loader
            ? Center(child: CircularProgressIndicator(color: AppTheme().purple))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    slider != []
                        ? SliderPage(
                            text: false,
                            data: slider,
                          )
                        : Container(),
                    List1(),
                    category != []
                        ? CategoryList(
                            category: category,
                            subcategory: false,
                          )
                        : Container(),
                    material != []
                        ? Productlist(
                            i: 1,
                            data: material,
                            title: 'Find Materials Around You',
                          )
                        : Container(),
                    slider2 != []
                        ? Slider1Page(
                            data: slider2,
                          )
                        : Container(),
                    shop != []
                        ? Productlist(
                            i: 2,
                            data: shop,
                            title: 'Find Virtual Shops',
                          )
                        : Container(),
                    product.length != 0
                        ? Productlist(
                            i: 3,
                            data: product,
                            title: 'Find AR Product',
                          )
                        : Container(),
                    service != []
                        ? Productlist(
                            i: 4,
                            data: service,
                            title: 'Find Professional Services',
                          )
                        : Container(),
                    slider3 != []
                        ? Slider1Page(
                            data: slider3,
                          )
                        : Container(),
                    // Productlist(
                    //   i: 0,
                    //   data: product,
                    //   title: 'Find Interactive Events',
                    // ),
                    // Title_Widgets(
                    //   bold: false,
                    //   text: 'Latest Feed',
                    // ),
                    // List2(),
                    // PhotoListGride(
                    //   i: 0,
                    //   count: 2,
                    //   data: product,
                    //   title: 'Find Interactive Events',
                    // ),
                    // InstList(
                    //   data: product,
                    //   title: 'Instagram #archimat.xr',
                    // ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
