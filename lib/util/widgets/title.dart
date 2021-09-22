import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme.dart';

// ignore: camel_case_types
class Title_Widgets extends StatelessWidget {
  final dynamic text;
  final Function onclick;
  final bool bold;
  const Title_Widgets({Key key, this.onclick, this.text, @required this.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.text,
                style: TextStyle(
                    color: AppTheme().l2black,
                    fontSize: 18,
                    fontFamily: 'Nexa',
                    fontWeight:
                        this.bold == true ? FontWeight.w700 : FontWeight.w300),
              ),
              GestureDetector(
                onTap: this.onclick,
                child: Row(
                  children: [
                    Text('See All ',
                        style: TextStyle(
                          fontFamily: 'Roxborough CF',
                          color: AppTheme().l2black,
                        )),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 13,
                      color: AppTheme().grey,
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
