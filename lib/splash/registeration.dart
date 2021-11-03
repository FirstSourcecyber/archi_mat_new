import 'dart:convert';
import 'package:archimat/Services/loginService.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:archimat/pages/tab.dart';
import 'package:archimat/util/widgets/profilepic.dart';
// import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:archimat/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterationPage extends StatefulWidget {
  final bool login;
  const RegisterationPage({Key key, this.login}) : super(key: key);

  @override
  _RegisterationPageState createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  TextEditingController email = new TextEditingController();
  TextEditingController pswd = new TextEditingController();
  TextEditingController confirmpswd = new TextEditingController();
  TextEditingController fname = new TextEditingController();
  TextEditingController uname = new TextEditingController();
  TextEditingController lname = new TextEditingController();
  TextEditingController number = new TextEditingController();

  String token;
  bool passwordmatch = false, birth = true;
  var countrycode = '+92';
  var newphone;
  String gender = 'male';
  bool loader = false;

  @override
  initState() {
    super.initState();
    FirebaseMessaging.instance.getToken().then((tokeen) {
      print(tokeen);
      this.token = tokeen;
      print(token);
    });
  }

  showAlert(text, backcolor) {
    print('infunction');
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backcolor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppTheme().black,
            )),
        backgroundColor: AppTheme().white,
        title: Text('Signup',
            style: GoogleFonts.lato(
              // fontFamily: 'Nexa',
              color: AppTheme().black,
              fontWeight: FontWeight.w700,
            )),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: ProfilepicWidgets(
                    image: '',
                    update: true,
                  )),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppTheme().grey)),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: uname,
                      decoration: InputDecoration(
                        hintText: 'User Name',
                        hintStyle: GoogleFonts.lato(
                          color: AppTheme().grey,
                          // fontFamily: 'Roxborough CF',
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppTheme().grey)),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: fname,
                            decoration: InputDecoration(
                              hintText: 'First Name',
                              hintStyle: GoogleFonts.lato(
                                color: AppTheme().grey,
                                // fontFamily: 'Roxborough CF',
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppTheme().grey)),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: lname,
                            decoration: InputDecoration(
                              hintText: 'Last Name',
                              hintStyle: GoogleFonts.lato(
                                color: AppTheme().grey,
                                // fontFamily: 'Roxborough CF',
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppTheme().grey)),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: email,
                      decoration: InputDecoration(
                        hintText: 'Enter Your E-Mail',
                        hintStyle: GoogleFonts.lato(
                          color: AppTheme().grey,
                          // fontFamily: 'Roxborough CF',
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppTheme().grey)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CountryCodePicker(
                              padding: EdgeInsets.all(0),
                              showFlag: true,
                              initialSelection: 'PK',
                              favorite: ['+92', 'PK'],
                              textStyle:
                                  GoogleFonts.lato(color: AppTheme().grey),
                              onChanged: (code) {
                                this.countrycode = code.toString();
                                print(countrycode);
                              },
                            ),
                            Container(
                              height: 30.0,
                              width: 1.0,
                              color: Colors.blue,
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                            ),
                            Expanded(
                              child: TextField(
                                controller: number,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Phone Number",
                                    hintStyle: GoogleFonts.lato(
                                        // fontFamily: 'Roxborough CF',
                                        color: AppTheme().darkgrey)),
                                onChanged: (value) {
                                  if (number.text.isNotEmpty) {
                                    if (value[0] != '0') {
                                      this.newphone = value;
                                    } else {
                                      this.newphone = value.substring(1);
                                    }
                                  }
                                },
                              ),
                            ),
                          ])),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppTheme().grey)),
                    child: Row(
                      children: [
                        Radio(
                          value: 'male',
                          activeColor: AppTheme().purple,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          },
                          groupValue: gender,
                        ),
                        Text(
                          'Male',
                          style: GoogleFonts.lato(
                            color: AppTheme().grey,
                            // fontFamily: 'Roxborough CF',
                          ),
                        ),
                        Radio(
                          value: 'female',
                          activeColor: AppTheme().purple,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          },
                          groupValue: gender,
                        ),
                        Text(
                          'Female',
                          style: GoogleFonts.lato(
                            color: AppTheme().grey,
                            // fontFamily: 'Roxborough CF',
                          ),
                        ),
                        Radio(
                          value: 'other',
                          activeColor: AppTheme().purple,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          },
                          groupValue: gender,
                        ),
                        Text(
                          'Other',
                          style: GoogleFonts.lato(
                            color: AppTheme().grey,
                            // fontFamily: 'Roxborough CF',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppTheme().grey)),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: pswd,
                      onChanged: (val) {
                        if (val == confirmpswd.text) {
                          passwordmatch = true;
                        } else {
                          passwordmatch = false;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter Your Password',
                          hintStyle: GoogleFonts.lato(
                            color: AppTheme().grey,
                            // fontFamily: 'Roxborough CF',
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppTheme().grey)),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      onChanged: (val) {
                        if (val == pswd.text) {
                          passwordmatch = true;
                        } else {
                          passwordmatch = false;
                        }
                      },
                      controller: confirmpswd,
                      decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: GoogleFonts.lato(
                            color: AppTheme().grey,
                            // fontFamily: 'Roxborough CF',
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  loader
                      ? Center(
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppTheme().purple)))
                      : GestureDetector(
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            // print(selectedDate.toString());
                            print(birth);
                            print(newphone);
                            print(email.text);
                            print(pswd.text);
                            print(lname.text);
                            print(fname.text);
                            if (email.text.isEmpty ||
                                pswd.text.isEmpty ||
                                lname.text.trim().isEmpty ||
                                fname.text.trim().isEmpty ||
                                uname.text.trim().isEmpty ||
                                // birth ||
                                newphone == null) {
                              print('Please Fill All Field');
                              showAlert("Please Fill All Field", Colors.red);
                            } else if (!passwordmatch) {
                              print(
                                  'Pasword and Confirm Pasword does`t match!');
                              showAlert(
                                  "Pasword and Confirm Pasword does`t match!",
                                  Colors.red);
                            } else {
                              print('signup');
                              signup();
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                            decoration: BoxDecoration(
                                color: AppTheme().white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: AppTheme().lblack, width: 1)),
                            child: Text(
                              'Create',
                              style: GoogleFonts.lato(
                                color: AppTheme().black,
                                fontWeight: FontWeight.w700,
                                // fontFamily: 'Nexa',
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            // ],
          ),
        ),
      ),
      // )
    );
  }

  signup() async {
    setState(() {
      loader = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {
      'email': email.text.trim(),
      'username': uname.text.trim(),
      'password': pswd.text.trim(),
      'mob_token': token,
      'firstname': fname.text.trim(),
      'lastname': lname.text.trim(),
      'gender': gender != null ? gender : 'Male',
      // 'birthday': selectedDate.toString(),
      'google': true,
      'phone': countrycode + newphone,
      'image': prefs.getString('image')
    };
    print(data);
    LoginService().signup(data).then((value) {
      print(value);
      if (value['message'] == 'success') {
        if (value['user']['role']['name'] == 'user') {
          print('user');
          prefs.remove('image');
          prefs.setString('user', jsonEncode(value['user']));

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => TabPage(
                        index: 0,
                        data: null,
                      )),
              (Route<dynamic> route) => false);
        } else {
          setState(() {
            loader = false;
          });
          showAlert('User not available', Colors.red);
          print('User not available');
        }
      } else {
        setState(() {
          loader = false;
        });
        showAlert(value['message'], Colors.red);
      }
    });
  }
}
