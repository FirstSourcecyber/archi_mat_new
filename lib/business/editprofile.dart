import 'package:archimat/theme.dart';
import 'package:archimat/util/widgets/back.dart';
import 'package:archimat/util/widgets/divider.dart';
import 'package:archimat/util/widgets/logout.dart';
import 'package:archimat/util/widgets/profilepic.dart';
import 'package:archimat/util/widgets/profiletab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BusinessEditProfile extends StatefulWidget {
  final dynamic data;
  const BusinessEditProfile({Key key, this.data}) : super(key: key);

  @override
  _BusinessEditProfileState createState() => _BusinessEditProfileState();
}

class _BusinessEditProfileState extends State<BusinessEditProfile> {
  TextEditingController username = new TextEditingController();
  @override
  void initState() {
    // userdetail();
    super.initState();
  }

  // userdetail() async {
  //   // SharedPreferences pref = await SharedPreferences.getInstance();
  //   // var data = pref.getString('user');
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: AppTheme().white,
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Back_Widgets(
                onclick: () {
                  Navigator.pop(context);
                },
              ),
              ProfilepicWidgets(
                image: '',
              ),
              SizedBox(
                height: 40,
              ),
              Divider_Widgets(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Username',
                        style: GoogleFonts.lato(),
                      ),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'User Name',
                            hintStyle: GoogleFonts.lato(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              Divider_Widgets(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'First Name',
                        style: GoogleFonts.lato(),
                      ),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'First Name',
                            hintStyle: GoogleFonts.lato(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              Divider_Widgets(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Last Name',
                        style: GoogleFonts.lato(),
                      ),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'Last Name',
                            hintStyle: GoogleFonts.lato(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              Divider_Widgets(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Address',
                        style: GoogleFonts.lato(),
                      ),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        maxLines: 2,
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'Address....',
                            hintStyle: GoogleFonts.lato(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              Divider_Widgets(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Email',
                        style: GoogleFonts.lato(),
                      ),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: GoogleFonts.lato(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              Divider_Widgets(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Mobile',
                        style: GoogleFonts.lato(),
                      ),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'Xxxxxxx',
                            hintStyle: GoogleFonts.lato(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              Divider_Widgets(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Company',
                        style: GoogleFonts.lato(),
                      ),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'Xxxxxxxxxxxxxxx',
                            hintStyle: GoogleFonts.lato(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              Divider_Widgets(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Registration Number',
                        style: GoogleFonts.lato(fontSize: 12),
                      ),
                      alignment: Alignment.topLeft,
                      width: 75,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'Xxxxxxxxxxxxxxx',
                            hintStyle: GoogleFonts.lato(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              Divider_Widgets(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Bio',
                        style: GoogleFonts.lato(fontSize: 12),
                      ),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        maxLength: 255,
                        controller: username,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Xxxxxxxxxxxxxxx',
                          hintStyle: GoogleFonts.lato(color: Colors.grey),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider_Widgets(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Website',
                        style: GoogleFonts.lato(fontSize: 12),
                      ),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'Xxxxxxxxxxxxxxx',
                            hintStyle: GoogleFonts.lato(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              Divider_Widgets(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Virtual Shop',
                        style: GoogleFonts.lato(fontSize: 12),
                      ),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'Xxxxxxxxxxxxxxx',
                            hintStyle: GoogleFonts.lato(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              Divider_Widgets(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Virtual Event',
                        style: GoogleFonts.lato(fontSize: 12),
                      ),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'Xxxxxxxxxxxxxxx',
                            hintStyle: GoogleFonts.lato(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              Divider_Widgets(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Hotline',
                        style: GoogleFonts.lato(fontSize: 12),
                      ),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'Xxxxxxxxxxxxxxx',
                            hintStyle: GoogleFonts.lato(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              Divider_Widgets(),
              ProfileTab(
                bold: false,
                text: 'Link Facebook',
                option: true,
                onclick: () {},
              ),
              Divider_Widgets(),
              ProfileTab(
                bold: false,
                text: 'Link Instagram',
                option: true,
                onclick: () {},
              ),
              Divider_Widgets(),
              ProfileTab(
                bold: false,
                text: 'Link Google Business',
                option: true,
                onclick: () {},
              ),
              Logou_button()
            ],
          ),
        )),
      ),
    );
  }
}
