import 'package:archimat/pages/search.dart';
import 'package:archimat/util/widgets/divider.dart';
import 'package:flutter/material.dart';
import '../../theme.dart';
import 'package:google_fonts/google_fonts.dart';

class List1 extends StatefulWidget {
  const List1({Key key}) : super(key: key);

  @override
  _List1State createState() => _List1State();
}

class _List1State extends State<List1> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider_Widgets(),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            // spacing: 10,
            // runSpacing: 15,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // print(i.toString());
                  // setState(() {
                  //   i = 0;
                  //   print(i.toString());
                  // });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPage(
                                search: 2,
                              )));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                  alignment: Alignment.center,
                  // width:
                  //     //  i == 0 ?
                  //     90
                  //  : 50
                  // ,
                  decoration:
                      //  i != 0
                      //     ? BoxDecoration()
                      //     :
                      BoxDecoration(
                          color: AppTheme().white,
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(color: AppTheme().lblack, width: 1)),
                  child: Text(
                    'Shops',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: AppTheme().black,
                      // fontFamily: 'Nexa',
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   i = 1;
                  //   print(i.toString());
                  // });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPage(
                                search: 1,
                              )));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                  alignment: Alignment.center,
                  // width:
                  //     // i == 1 ?
                  //     90
                  // //  : 55
                  // ,
                  decoration:
                      //  i != 1
                      //     ? BoxDecoration()
                      //     :
                      BoxDecoration(
                          color: AppTheme().white,
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(color: AppTheme().lblack, width: 1)),
                  child: Text(
                    'Products',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: AppTheme().black,
                      // fontFamily: 'Nexa',
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   i = 2;
                  //   print(i.toString());
                  // });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPage(
                                search: 3,
                              )));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                  alignment: Alignment.center,
                  // width:
                  //     //  i == 2 ?
                  //     90
                  // // : 50
                  // ,
                  decoration:
                      //  i != 2
                      //     ? BoxDecoration()
                      //     :
                      BoxDecoration(
                          color: AppTheme().white,
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(color: AppTheme().lblack, width: 1)),
                  child: Text(
                    'Services',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: AppTheme().black,
                      // fontFamily: 'Nexa',
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   i = 3;
                  // });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPage(
                                search: 4,
                              )));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                  alignment: Alignment.center,
                  // width:
                  //     // i != 3 ? 50 :
                  //     90,
                  decoration:
                      // i != 3
                      //     ? BoxDecoration()
                      //     :
                      BoxDecoration(
                          color: AppTheme().white,
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(color: AppTheme().lblack, width: 1)),
                  child: Text(
                    'Material',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: AppTheme().black,
                      // fontFamily: 'Nexa',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider_Widgets()
      ],
    );
  }
}
