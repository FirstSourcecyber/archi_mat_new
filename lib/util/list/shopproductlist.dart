import 'package:Archimat/environment.dart';
import 'package:Archimat/pages/materialdetail.dart';
import 'package:Archimat/pages/servicdetail.dart';
import 'package:Archimat/userside/productDetail.dart';
import 'package:flutter/material.dart';
import '../../theme.dart';

class ShopProductlist extends StatefulWidget {
  final int i;
  final dynamic data;
  const ShopProductlist({
    Key key,
    this.i,
    this.data,
  }) : super(key: key);

  @override
  _ShopProductlistState createState() => _ShopProductlistState();
}

class _ShopProductlistState extends State<ShopProductlist> {
  gotoproduct(data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetail(
                  data: data,
                  shop: true,
                )));
  }

  gotomaterial(data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MaterialDetail(
                  data: data,
                  shop: true,
                )));
  }

  gotoservice(data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ServiceDetail(
                  data: data,
                  shop: true,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 190,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(color: Colors.transparent),
            // padding: EdgeInsets.only(left: 10),

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
                    if (widget.i == 1) {
                      print('product===');
                      print(widget.data[index]);
                      gotoproduct(widget.data[index]);
                    } else if (widget.i == 2) {
                      print('shop===');
                      print(widget.data[index]);

                      gotomaterial(widget.data[index]);
                    } else if (widget.i == 3) {
                      print('shop===');
                      print(widget.data[index]);
                      gotoservice(widget.data[index]);
                    } else {
                      print('shop===');
                      print(widget.data[index]);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: 165,
                    height: 190,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppTheme().grey, width: .5),
                        color: AppTheme().white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 165,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              // border: Border(
                              //     bottom: BorderSide(color: AppTheme().grey)),
                              image: DecorationImage(
                                  image: widget.i == 1 &&
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
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.data[index]['name'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Nexa',
                                ),
                              ),
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
