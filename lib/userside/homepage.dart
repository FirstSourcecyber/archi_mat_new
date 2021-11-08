import 'package:archimat/controller/homeController.dart';
import 'package:archimat/controller/loginRegister.dart';
import 'package:archimat/theme.dart';
import 'package:archimat/util/list/categorylist.dart';
import 'package:archimat/util/list/productlist.dart';
import 'package:archimat/util/slider/slider.dart';
import 'package:archimat/util/slider/slider1.dart';
import 'package:archimat/util/widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i = 0, j = 0;
  // List category = [],
  //     product = [],
  //     service = [],
  //     slider = [],
  //     slider2 = [],
  //     slider3 = [],
  //     shop = [],
  //     material = [];

  // bool loader = true;
  final LoginRegisterController controller = Get.find();
  final HomeController controller1 = Get.find();

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

  // gethome() {
  //   setState(() {
  //     loader = true;
  //   });

  //   HomeService().gethomedetail().then((value) {
  //     print(value);
  //     setState(() {
  //       if (value != null) {
  //         var data = value;
  //         product = data['vrproduct'];
  //         material = data['allmaterial'];
  //         category = data['allcategory'];
  //         shop = data['vrshop'];
  //         service = data['allservice'];
  //         slider = data['slider1'];
  //         slider2 = data['slider2'];
  //         print(data['slider3'].length.toString());
  //         slider3 = data['slider3'];
  //         // slider3 = [];
  //         loader = false;
  //       }
  //     });
  //   });
  // }

  @override
  void initState() {
    // getcategory();
    // getproduct();
    // getservice();
    // getslider();
    // gethome();
    // print('token------------------------');
    // print(controller.token);
    // print('token------------------------');
    super.initState();
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // key: scaffoldKey,
          // drawer: Menu2(),
          backgroundColor: AppTheme().lightgrey,
          appBar: AppBar(
            backgroundColor: AppTheme().white,
            title: Image(
              image: AssetImage('assets/images/archimat.png'),
              width: 150,
              height: 100,
            ),
            centerTitle: true,
          ),
          body: Obx(() {
            if (controller1.loader.value) {
              return Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppTheme().purple)));
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller1.slider.length != 0
                        ? SliderPage(
                            text: false,
                            data: controller1.slider,
                          )
                        : Container(),
                    List1(),
                    controller1.category.length != 0
                        ? CategoryList(
                            category: controller1.category,
                            subcategory: false,
                          )
                        : Container(),
                    controller1.material.length != 0
                        ? Productlist(
                            i: 1,
                            seeall: true,
                            data: controller1.material,
                            title: 'Find Materials Around You',
                          )
                        : Container(),
                    controller1.slider2.length != 0
                        ? Slider1Page(
                            data: controller1.slider2,
                          )
                        : Container(),
                    controller1.shop.length != 0
                        ? Productlist(
                            i: 2,
                            seeall: true,
                            data: controller1.shop,
                            title: 'Find Virtual Shops',
                          )
                        : Container(),
                    controller1.product.length != 0
                        ? Productlist(
                            i: 3,
                            seeall: true,
                            data: controller1.product,
                            title: 'Find Product',
                          )
                        : Container(),
                    controller1.service.length != 0
                        ? Productlist(
                            i: 4,
                            seeall: true,
                            data: controller1.service,
                            title: 'Find Professional Services',
                          )
                        : Container(),
                    controller1.slider3.length != 0
                        ? Slider1Page(
                            data: controller1.slider3,
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
              );
            }
          })

          //  loader
          //     ? Center(
          //         child: CircularProgressIndicator(
          //             valueColor:
          //                 AlwaysStoppedAnimation<Color>(AppTheme().purple)))
          //     : SingleChildScrollView(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             slider.length != 0
          //                 ? SliderPage(
          //                     text: false,
          //                     data: slider,
          //                   )
          //                 : Container(),
          //             List1(),
          //             category.length != 0
          //                 ? CategoryList(
          //                     category: category,
          //                     subcategory: false,
          //                   )
          //                 : Container(),
          //             material.length != 0
          //                 ? Productlist(
          //                     i: 1,
          //                     seeall: true,
          //                     data: material,
          //                     title: 'Find Materials Around You',
          //                   )
          //                 : Container(),
          //             slider2.length != 0
          //                 ? Slider1Page(
          //                     data: slider2,
          //                   )
          //                 : Container(),
          //             shop.length != 0
          //                 ? Productlist(
          //                     i: 2,
          //                     seeall: true,
          //                     data: shop,
          //                     title: 'Find Virtual Shops',
          //                   )
          //                 : Container(),
          //             product.length != 0
          //                 ? Productlist(
          //                     i: 3,
          //                     seeall: true,
          //                     data: product,
          //                     title: 'Find Product',
          //                   )
          //                 : Container(),
          //             service.length != 0
          //                 ? Productlist(
          //                     i: 4,
          //                     seeall: true,
          //                     data: service,
          //                     title: 'Find Professional Services',
          //                   )
          //                 : Container(),
          //             slider3.length != 0
          //                 ? Slider1Page(
          //                     data: slider3,
          //                   )
          //                 : Container(),
          //             // Productlist(
          //             //   i: 0,
          //             //   data: product,
          //             //   title: 'Find Interactive Events',
          //             // ),
          //             // Title_Widgets(
          //             //   bold: false,
          //             //   text: 'Latest Feed',
          //             // ),
          //             // List2(),
          //             // PhotoListGride(
          //             //   i: 0,
          //             //   count: 2,
          //             //   data: product,
          //             //   title: 'Find Interactive Events',
          //             // ),
          //             // InstList(
          //             //   data: product,
          //             //   title: 'Instagram #archimat.xr',
          //             // ),
          //             SizedBox(
          //               height: 20,
          //             )
          //           ],
          //         ),
          //       ),
          ),
    );
  }
}
