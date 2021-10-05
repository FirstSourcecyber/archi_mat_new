import 'package:Archimat/splash/loginregister.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme.dart';

// ignore: camel_case_types
class Logou_button extends StatelessWidget {
  final Function onclick;

  const Logou_button({
    Key key,
    this.onclick,
  }) : super(key: key);
  logout() async {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        GestureDetector(
          onTap: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.clear();
            pref.setString('new', 'new');
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginRegister()),
                (Route<dynamic> route) => false);
          },
          child: Container(
            width: 150,
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppTheme().l1black, width: 1)),
            child: Text(
              'LOG OUT',
              style: TextStyle(
                fontFamily: 'Roxborough CF',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Version 1.0',
          style: TextStyle(
            fontFamily: 'Roxborough CF',
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
