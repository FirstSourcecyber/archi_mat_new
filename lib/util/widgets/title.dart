import 'dart:ui';

import 'package:archimat/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../../theme.dart';

// ignore: camel_case_types
class Title_Widgets extends StatelessWidget {
  final dynamic text;
  final int i;
  final Function onclick;
  final bool bold;
  const Title_Widgets(
      {Key key, this.onclick, this.text, @required this.bold, this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    gotoshop() {
      print(i.toString());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchPage(
                    search: 2,
                  )));
    }

    gotoproduct() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchPage(
                    search: 1,
                  )));
    }

    gotomaterial() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchPage(
                    search: 4,
                  )));
    }

    gotoservice() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchPage(
                    search: 3,
                  )));
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.text,
                style: GoogleFonts.lato(
                    color: AppTheme().l2black,
                    fontSize: 16,
                    // fontFamily: 'Nexa',
                    fontWeight:
                        this.bold == true ? FontWeight.w700 : FontWeight.w300),
              ),
              GestureDetector(
                onTap: () {
                  print(i.toString());
                  if (i == 3) {
                    gotoproduct();
                  } else if (i == 2) {
                    gotoshop();
                  } else if (i == 1) {
                    gotomaterial();
                  } else {
                    gotoservice();
                  }
                },
                child: Row(
                  children: [
                    Text('See All ',
                        style: GoogleFonts.lato(
                          fontSize: 10,
                          // fontFamily: 'Roxborough CF',
                          color: AppTheme().l2black,
                        )),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: AppTheme().black,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
