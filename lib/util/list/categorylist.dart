import 'package:archimat/environment.dart';
import 'package:archimat/userside/category.dart';
import 'package:archimat/util/widgets/divider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../../theme.dart';

class CategoryList extends StatefulWidget {
  final dynamic category;
  final bool subcategory;
  const CategoryList({Key key, this.category, this.subcategory})
      : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int i = 0;
  List category = ['All', "Tiles", "Comment", 'Furniture'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 5),
          height: 90,
          child:
              // loader
              //     ? Center(child: CircularProgressIndicator(color: AppTheme().purple))
              //     :
              ListView.builder(
            itemCount: widget.category.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Container(
                    width: 60,
                    // height: 70,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryPage(
                                      dat: widget.category[index]['id'],
                                      dat1: widget.subcategory,
                                    )));
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppTheme().l1black, width: 1)),
                            child: CircleAvatar(
                              radius: 35,
                              // backgroundColor: i == index
                              //     ? AppTheme().purple
                              //     : AppTheme().white,
                              backgroundColor: AppTheme().white,
                              child: Image.network(
                                Config.url + widget.category[index]['image'],
                                width: 25,
                                // color: i == index
                                //     ? AppTheme().white
                                //     : AppTheme().l1black,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          Text(
                            widget.category[index]['name'].length > 20
                                ? widget.category[index]['name']
                                        .toString()
                                        .substring(0, 20) +
                                    '... '
                                : widget.category[index]['name'],
                            style: AppTheme().primaryTextStyle(false),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ),
        Divider_Widgets(),
      ],
    );
  }
}
