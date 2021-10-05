import 'package:Archimat/userside/editprofile.dart';
import 'package:Archimat/util/widgets/divider.dart';
import 'package:Archimat/util/widgets/logout.dart';
import 'package:Archimat/util/widgets/profilepic.dart';
import 'package:Archimat/util/widgets/profiletab.dart';
import 'package:flutter/material.dart';

class UserSetting extends StatefulWidget {
  final dynamic data;
  const UserSetting({Key key, this.data}) : super(key: key);

  @override
  _UserSettingState createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Back_Widgets(
              //   onclick: () {
              //     Navigator.pop(context);
              //   },
              // ),
              Container(
                height: 40,
              ),
              ProfilepicWidgets(
                image: widget.data['image'],
                update: false,
              ),
              SizedBox(
                height: 40,
              ),
              Divider_Widgets(),
              ProfileTab(
                bold: true,
                text: "Edit Profile",
                onclick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserEditProfile()));
                },
              ),
              ProfileTab(
                bold: true,
                text: 'Change Password',
                onclick: () {},
              ),
              ProfileTab(
                bold: false,
                text: "Push Notifications",
                option: true,
                onclick: () {},
              ),
              ProfileTab(
                bold: false,
                text: 'Allow Access to My Contacts',
                option: true,
                onclick: () {},
              ),
              ProfileTab(
                bold: false,
                text: 'Allow My Location',
                option: true,
                onclick: () {},
              ),
              ProfileTab(
                bold: false,
                text: 'Other Can See My Activity',
                option: true,
                onclick: () {},
              ),
              ProfileTab(
                bold: true,
                text: 'Support Center',
                onclick: () {},
              ),
              Logou_button(),
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
